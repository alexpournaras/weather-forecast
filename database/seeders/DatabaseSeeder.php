<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Location;
use App\Models\WeatherDailyForecast;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
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
	}
}
