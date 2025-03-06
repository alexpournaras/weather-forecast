<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeatherDailyForecast extends Model
{
	protected $fillable = [
		'location_id',
		'forecast_date',
		'temperature_max',
		'temperature_min',
		'precipitation_sum',
		'forecast_source'
	];

	protected $casts = [
		'forecast_date' => 'date'
	];

	public function location()
	{
		return $this->belongsTo(Location::class);
	}

	public function weatherHourlyForecasts()
	{
		return $this->hasMany(WeatherHourlyForecast::class);
	}

	public function deleteHourlyForecasts()
	{
		$this->weatherHourlyForecasts()->delete();
	}
}
