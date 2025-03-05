<?php

namespace App\Models;

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
}
