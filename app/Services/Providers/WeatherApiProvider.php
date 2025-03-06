<?php

namespace App\Services\Providers;

use App\Models\Location;
use Illuminate\Support\Facades\Http;

class WeatherApiProvider implements WeatherForecastProviderInterface
{
	public function fetchWeatherForecasts(Location $location)
	{
		//
	}
}
