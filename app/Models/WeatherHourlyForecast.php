<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeatherHourlyForecast extends Model
{
    protected $casts = [
		'forecast_datetime' => 'datetime'
	];
}
