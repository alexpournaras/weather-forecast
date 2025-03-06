<?php

namespace App\Observers;

use App\Models\WeatherDailyForecast;

class WeatherDailyForecastObserver
{
	/**
	 * Handle the WeatherDailyForecast "deleted" event.
	 */
	public function deleted(WeatherDailyForecast $weatherDailyForecast): void
	{
		$weatherDailyForecast->deleteHourlyForecasts();
	}
}
