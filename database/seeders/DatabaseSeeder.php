<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Location;
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
			'active' => true,
		]);

		Location::create([
			'name' => 'Rio de Janeiro',
			'latitude' => -22.9064,
			'longitude' => -43.1822,
			'active' => true,
		]);

		Location::create([
			'name' => 'Tokyo',
			'latitude' => 35.6895,
			'longitude' => 139.6917,
			'active' => true,
		]);

		Location::create([
			'name' => 'New York',
			'latitude' => 40.7128,
			'longitude' => -74.0060,
			'active' => true,
		]);

		Location::create([
			'name' => 'Sydney',
			'latitude' => -33.8688,
			'longitude' => 151.2093,
			'active' => true,
		]);

		Location::create([
			'name' => 'Cape Town',
			'latitude' => -33.9249,
			'longitude' => 18.4241,
			'active' => false,
		]);
	}
}
