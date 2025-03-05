<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Location;
use App\Models\WeatherDailyForecast;
use App\Models\WeatherHourlyForecast;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
	/**
	 * Seed the application's database.
	 */
	public function run(): void
	{
		User::create([
			'name' => 'Admin',
			'email' => 'admin@gmail.com',
			'password' => Hash::make('asdasdasd'),
		]);

		Location::create([
			'name' => 'Thessaloniki',
			'latitude' => 40.6436,
			'longitude' => 22.9309,
		]);

		// TODO: Delete after API implementation
		WeatherDailyForecast::create([
			'location_id' => 1,
			'forecast_date' => '2025-03-05',
			'temperature_max' => 19.4,
			'temperature_min' => 11.2,
			'precipitation_sum' => 0.2,
			'forecast_source' => 'open-meteo'
		]);

		WeatherDailyForecast::create([
			'location_id' => 1,
			'forecast_date' => '2025-03-05',
			'temperature_max' => 25.4,
			'temperature_min' => 15.2,
			'precipitation_sum' => 3.2,
			'forecast_source' => 'weatherapi'
		]);

		WeatherDailyForecast::create([
			'location_id' => 1,
			'forecast_date' => '2025-03-06',
			'temperature_max' => 29.4,
			'temperature_min' => 19,
			'precipitation_sum' => 5,
			'forecast_source' => 'weatherapi'
		]);

		WeatherDailyForecast::create([
			'location_id' => 1,
			'forecast_date' => '2025-03-07',
			'temperature_max' => 26.1,
			'temperature_min' => 17.5,
			'precipitation_sum' => 2.7,
			'forecast_source' => 'weatherapi'
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 1,
			'forecast_datetime' => '2025-03-05 06:00:00',
			'temperature' => 12,
			'precipitation' => 0.0,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 1,
			'forecast_datetime' => '2025-03-05 09:00:00',
			'temperature' => 15,
			'precipitation' => 0.1,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 1,
			'forecast_datetime' => '2025-03-05 12:00:00',
			'temperature' => 19,
			'precipitation' => 0.2,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 1,
			'forecast_datetime' => '2025-03-05 15:00:00',
			'temperature' => 21,
			'precipitation' => 0.0,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 2,
			'forecast_datetime' => '2025-03-05 18:00:00',
			'temperature' => 18,
			'precipitation' => 0.3,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 2,
			'forecast_datetime' => '2025-03-05 21:00:00',
			'temperature' => 16,
			'precipitation' => 0.1,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 3,
			'forecast_datetime' => '2025-03-06 00:00:00',
			'temperature' => 14,
			'precipitation' => 0.0,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 3,
			'forecast_datetime' => '2025-03-06 06:00:00',
			'temperature' => 17,
			'precipitation' => 0.2,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 3,
			'forecast_datetime' => '2025-03-06 12:00:00',
			'temperature' => 23,
			'precipitation' => 0.5,
		]);

		WeatherHourlyForecast::create([
			'weather_daily_forecast_id' => 3,
			'forecast_datetime' => '2025-03-06 18:00:00',
			'temperature' => 21,
			'precipitation' => 0.3,
		]);
	}
}
