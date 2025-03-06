<?php

namespace App\Models;

use App\Services\WeatherForecastService;
use App\Services\Providers\OpenMeteoProvider;
use App\Services\Providers\WeatherApiProvider;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
	public function weatherForecastOpenMeteo()
	{
		return $this->hasMany(WeatherDailyForecast::class)->where('forecast_source', 'open-meteo');
	}

	public function weatherForecastWeatherApi()
	{
		return $this->hasMany(WeatherDailyForecast::class)->where('forecast_source', 'weatherapi');
	}

	public function fetchLocationWeatherForecast()
	{
		if (!$this->active) return;
		$this->deleteLocationWeatherForecast();

		$weatherForecastService = new WeatherForecastService($this, [
            new OpenMeteoProvider(),
            new WeatherApiProvider()
        ]);

		$weatherForecastService->fetchWeatherForecasts();
	}

	public function deleteLocationWeatherForecast()
	{
		$this->weatherForecastOpenMeteo()->each(fn ($forecast) => $forecast->delete());
    	$this->weatherForecastWeatherApi()->each(fn ($forecast) => $forecast->delete());
	}
}
