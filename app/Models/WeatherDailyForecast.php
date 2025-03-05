<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeatherDailyForecast extends Model
{
	protected $casts = [
		'forecast_date' => 'date'
	];

	public function location()
	{
		return $this->belongsTo(Location::class);
	}
}
