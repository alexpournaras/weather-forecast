<?php

namespace App\Services\Providers;

use App\Models\Location;

interface WeatherForecastProviderInterface
{
	public function fetchWeatherForecasts(Location $location);
}
