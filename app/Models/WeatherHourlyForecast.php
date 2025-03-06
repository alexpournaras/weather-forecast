<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeatherHourlyForecast extends Model
{
	protected $fillable = [
		'weather_daily_forecast_id',
		'forecast_datetime',
		'temperature',
		'precipitation',
	];

	protected $casts = [
		'forecast_datetime' => 'datetime'
	];
}
