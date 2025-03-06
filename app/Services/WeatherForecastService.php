<?php

namespace App\Services;

use App\Models\Location;
use App\Models\WeatherDailyForecast;
use App\Models\WeatherHourlyForecast;
use App\Services\Providers\WeatherForecastProviderInterface;
use Carbon\Carbon;

class WeatherForecastService
{
	protected $location;
	protected $providers;

	public function __construct(Location $location, array $providers)
	{
		$this->location = $location;
		$this->providers = $providers;
	}

	/**
	 * Fetch and store forecasts for all providers and all locations.
	 */
	public function fetchWeatherForecasts()
	{	
		foreach ($this->providers as $provider) {
			$provider->fetchWeatherForecasts($this->location);
		}
	}
}
