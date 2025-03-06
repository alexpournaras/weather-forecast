<?php

namespace App\Services\Providers;

use Carbon\Carbon;
use App\Models\Location;
use App\Models\WeatherDailyForecast;
use App\Models\WeatherHourlyForecast;
use Illuminate\Support\Facades\Http;

class OpenMeteoProvider implements WeatherForecastProviderInterface
{
	public function fetchWeatherForecasts(Location $location)
	{
		// Open-Meteo: https://open-meteo.com/en/docs
		$api_url = "https://api.open-meteo.com/v1/forecast?latitude={$location->latitude}&longitude={$location->longitude}&hourly=temperature_2m,precipitation&daily=temperature_2m_max,temperature_2m_min,precipitation_sum&forecast_days=3";

		$response = Http::withOptions(['verify' => false])->get($api_url);

		if ($response->failed()) {
			\Log::error("OpenMeteoProvider: Failed to fetch data for location: {$location->name}");
			return;
		}

		$data = $response->json();

		// Confirm the necessary keys exist
		if (!isset($data['daily']) || !isset($data['hourly'])) {
			\Log::error("OpenMeteoProvider: Missing daily or hourly data for location: {$location->name}");
			return;
		}

		// Get daily data from the API response
		$dates = collect($data['daily']['time'] ?? []);
		$temperatures_max = collect($data['daily']['temperature_2m_max'] ?? []);
		$temperatures_min = collect($data['daily']['temperature_2m_min'] ?? []);
		$total_precipitation = collect($data['daily']['precipitation_sum'] ?? []);

		$daily_forcast_map = [];

		// Create daily forecasts
		foreach ($dates as $index => $date) {
			$forecast_date = Carbon::parse($date)->format('Y-m-d');

			$daily_forecast = WeatherDailyForecast::create([
				'location_id' => $location->id,
				'forecast_date' => $forecast_date,
				'temperature_max' => $temperatures_max[$index] ?? 0,
				'temperature_min' => $temperatures_min[$index] ?? 0,
				'precipitation_sum' => $total_precipitation[$index] ?? 0,
				'forecast_source' => 'open-meteo',
			]);

			$daily_forcast_map[$forecast_date] = $daily_forecast->id;
		}

		// Get hourly forecasts from the API response
		$times = collect($data['hourly']['time'] ?? []);
		$temperatures = collect($data['hourly']['temperature_2m'] ?? []);
		$precipitations = collect($data['hourly']['precipitation'] ?? []);

		// Create hourly forecasts
		foreach ($times as $index => $time) {
			$forecast_date = Carbon::parse($time)->format('Y-m-d');

			// Find the matching daily forecast ID from the daily map
			$daily_forecast_id = $daily_forcast_map[$forecast_date] ?? null;
			if (!$daily_forecast_id) continue;

			WeatherHourlyForecast::create([
				'weather_daily_forecast_id' => $daily_forecast_id,
				'forecast_datetime' => Carbon::parse($time)->format('Y-m-d H:i:s'),
				'temperature' => $temperatures[$index] ?? 0,
				'precipitation' => $precipitations[$index] ?? 0,
			]);
		}
	}
}
