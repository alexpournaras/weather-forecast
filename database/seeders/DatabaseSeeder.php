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
	}
}
