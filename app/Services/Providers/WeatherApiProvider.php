<?php

namespace App\Services\Providers;

use Carbon\Carbon;
use App\Models\Location;
use App\Models\WeatherDailyForecast;
use App\Models\WeatherHourlyForecast;
use Illuminate\Support\Facades\Http;

class WeatherApiProvider implements WeatherForecastProviderInterface
{
	public function fetchWeatherForecasts(Location $location)
	{
		$WEATHER_API_KEY = env('WEATHER_API_KEY');

		// WeatherAPI: https://www.weatherapi.com/docs/
		$api_url = "https://api.weatherapi.com/v1/forecast.json?key={$WEATHER_API_KEY}&q={$location->latitude},{$location->longitude}&days=3";

		$response = Http::withOptions(['verify' => false])->get($api_url);

		if ($response->failed()) {
			\Log::error("WeatherApiProvider: Failed to fetch data for location: {$location->name}");
			return;
		}

		$data = $response->json();

		// Confirm the necessary keys exist
		if (!isset($data['forecast']) || !isset($data['forecast']['forecastday'])) {
			\Log::error("WeatherApiProvider: Missing forecast data for location: {$location->name}");
			return;
		}

		$daily_forecasts = $data['forecast']['forecastday'];

		foreach ($daily_forecasts as $daily_forecast) {
			if (!isset($daily_forecast['date']) || !isset($daily_forecast['day']) || !isset($daily_forecast['hour'])) {
				\Log::error("WeatherApiProvider: Missing daily or hourly data for location: {$location->name}");
				continue;
			}

			// Validate daily data exists
			if (!isset($daily_forecast['day']['maxtemp_c']) || !isset($daily_forecast['day']['mintemp_c']) || !isset($daily_forecast['day']['totalprecip_mm'])) {
				\Log::error("WeatherApiProvider: Missing daily data for location: {$location->name}");
				continue;
			}

			$forecast_date = Carbon::parse($daily_forecast['date'])->format('Y-m-d');

			$daily_forecast_record = WeatherDailyForecast::create([
				'location_id' => $location->id,
				'forecast_date' => $forecast_date,
				'temperature_max' => $daily_forecast['day']['maxtemp_c'] ?? 0,
				'temperature_min' => $daily_forecast['day']['mintemp_c'] ?? 0,
				'precipitation_sum' => $daily_forecast['day']['totalprecip_mm'] ?? 0,
				'forecast_source' => 'weatherapi',
			]);

			$hourly_forecasts = $daily_forecast['hour'];

			foreach ($hourly_forecasts as $hourly_forecast) {
				// Validate hourly data exists
				if (!isset($hourly_forecast['time']) || !isset($hourly_forecast['temp_c']) || !isset($hourly_forecast['precip_mm'])) {
					\Log::error("WeatherApiProvider: Missing hourly data for location: {$location->name}");
					continue;
				}

				WeatherHourlyForecast::create([
					'weather_daily_forecast_id' => $daily_forecast_record->id,
					'forecast_datetime' => Carbon::parse($hourly_forecast['time'])->format('Y-m-d H:i:s'),
					'temperature' => $hourly_forecast['temp_c'] ?? 0,
					'precipitation' => $hourly_forecast['precip_mm'] ?? 0,
				]);
			}
		}
	}
}
