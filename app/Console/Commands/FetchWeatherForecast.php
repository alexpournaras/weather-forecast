<?php

namespace App\Console\Commands;

use App\Models\Location;
use Illuminate\Console\Command;

class FetchWeatherForecast extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'fetch:weather-forecast';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Fetch weather forecast for all locations';

	/**
	 * Execute the console command.
	 */
	public function handle()
	{
		$locations = Location::all();

		foreach ($locations as $location) {
			$location->fetchLocationWeatherForecast();
		}
	}
}
