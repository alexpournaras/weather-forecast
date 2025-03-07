<?php

namespace App\Observers;

use App\Models\Location;

class LocationObserver
{
	/**
	 * Handle the Location "created" event.
	 */
	public function created(Location $location): void
	{
		$location->fetchLocationWeatherForecast();
	}

	/**
	 * Handle the Location "updated" event.
	 */
	public function updated(Location $location): void
	{
		$location->fetchLocationWeatherForecast();
	}

	/**
	 * Handle the Location "deleted" event.
	 */
	public function deleted(Location $location): void
	{
		$location->deleteOpenMeteoWeatherForecast();
		$location->deleteWeatherApiWeatherForecast();
	}
}
