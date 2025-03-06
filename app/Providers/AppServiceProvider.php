<?php

namespace App\Providers;

use App\Models\Location;
use App\Models\WeatherDailyForecast;
use App\Observers\LocationObserver;
use App\Observers\WeatherDailyForecastObserver;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
	/**
	 * Register any application services.
	 */
	public function register(): void
	{
		//
	}

	/**
	 * Bootstrap any application services.
	 */
	public function boot(): void
	{
		Location::observe(LocationObserver::class);
		WeatherDailyForecast::observe(WeatherDailyForecastObserver::class);
	}
}
