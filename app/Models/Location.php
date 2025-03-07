<?php

namespace App\Models;

use App\Services\WeatherForecastService;
use App\Services\Providers\OpenMeteoProvider;
use App\Services\Providers\WeatherApiProvider;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
	public function fetchLocationWeatherForecast()
	{
		if (!$this->active) return;

		$weatherForecastService = new WeatherForecastService($this, [
			new OpenMeteoProvider(),
			new WeatherApiProvider()
		]);

		$weatherForecastService->fetchWeatherForecasts();
	}

	public function weatherForecastOpenMeteo()
	{
		return $this->hasMany(WeatherDailyForecast::class)->where('forecast_source', 'open-meteo');
	}

	public function weatherForecastWeatherApi()
	{
		return $this->hasMany(WeatherDailyForecast::class)->where('forecast_source', 'weatherapi');
	}

	public function deleteOpenMeteoWeatherForecast()
	{
		$this->weatherForecastOpenMeteo()->each(fn ($forecast) => $forecast->delete());
	}

	public function deleteWeatherApiWeatherForecast()
	{
		$this->weatherForecastWeatherApi()->each(fn ($forecast) => $forecast->delete());
	}
}
