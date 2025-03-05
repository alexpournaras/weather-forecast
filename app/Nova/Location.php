<?php

namespace App\Nova;

use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Http\Requests\NovaRequest;

class Location extends Resource
{
	/**
	 * The model the resource corresponds to.
	 *
	 * @var class-string<\App\Models\Location>
	 */
	public static $model = \App\Models\Location::class;

	/**
	 * The single value that should be used to represent the resource when being displayed.
	 *
	 * @var string
	 */
	public static $title = 'name';

	/**
	 * The columns that should be searched.
	 *
	 * @var array
	 */
	public static $search = [
		'name',
	];

	/**
	 * Get the fields displayed by the resource.
	 *
	 * @return array<int, \Laravel\Nova\Fields\Field>
	 */
	public function fields(NovaRequest $request): array
	{
		return [
			Text::make('Name')->sortable()->rules('required', 'max:255')
				->placeholder('Please type a name for this Location'),

			Number::make('Latitude')->min(-90)->max(90)->step('0.000001')->rules('required')
				->placeholder('Please type the latitude (e.g., 40.712776)'),
			Number::make('Longitude')->min(-180)->max(180)->step('0.000001')->rules('required')
				->placeholder('Please type the longitude (e.g., -74.005974)'),

			Boolean::make('Active')->sortable()->default(true),

			HasMany::make('Open-Meteo Daily Forecast', 'weatherForecastOpenMeteo', WeatherDailyForecast::class),
        	HasMany::make('WeatherAPI Daily Forecast', 'weatherForecastWeatherApi', WeatherDailyForecast::class),
		];
	}

	/**
	 * Get the cards available for the resource.
	 *
	 * @return array<int, \Laravel\Nova\Card>
	 */
	public function cards(NovaRequest $request): array
	{
		return [];
	}

	/**
	 * Get the filters available for the resource.
	 *
	 * @return array<int, \Laravel\Nova\Filters\Filter>
	 */
	public function filters(NovaRequest $request): array
	{
		return [];
	}

	/**
	 * Get the lenses available for the resource.
	 *
	 * @return array<int, \Laravel\Nova\Lenses\Lens>
	 */
	public function lenses(NovaRequest $request): array
	{
		return [];
	}

	/**
	 * Get the actions available for the resource.
	 *
	 * @return array<int, \Laravel\Nova\Actions\Action>
	 */
	public function actions(NovaRequest $request): array
	{
		return [];
	}
}
