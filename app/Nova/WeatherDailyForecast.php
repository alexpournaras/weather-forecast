<?php

namespace App\Nova;

use Carbon\Carbon;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Date;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Http\Requests\NovaRequest;
use Illuminate\Contracts\Database\Eloquent\Builder;

class WeatherDailyForecast extends Resource
{
	/**
	 * The model the resource corresponds to.
	 *
	 * @var class-string<\App\Models\WeatherDailyForecast>
	 */
	public static $model = \App\Models\WeatherDailyForecast::class;

	/**
	 * The single value that should be used to represent the resource when being displayed.
	 *
	 * @var string
	 */
	public static $title = '';

	/**
	 * Label shown in the top of resource page.
	 *
	 * @var string
	 */
	public static function label() {
		return 'Weather Daily Forecast';
	}

	/**
	 * The columns that should be searched.
	 *
	 */
	public static $search = [];
	public static $searchable = false;
	public static $globallySearchable = false;

	/**
	 * Hide resource from sidebar menu.
	 *
	 */
	public static $displayInNavigation = false;

	/**
     * The number of resources to show per page via relationships.
     *
     * @var int
     */
    public static $perPageViaRelationship = 10;

	/**
	 * Get the fields displayed by the resource.
	 *
	 * @return array<int, \Laravel\Nova\Fields\Field>
	 */
	public function fields(NovaRequest $request): array
	{
		return [
			BelongsTo::make('Location')->sortable(),

			Text::make('Forecast Source')
				->displayUsing(function ($value) {
					if ($value == 'open-meteo') return 'Open-Meteo';
					elseif ($value == 'weatherapi') return 'WeatherAPI';
					else return $value;
				}),

			Date::make('Forecast Date')
				->sortable()
				->displayUsing(function ($value) {
					return Carbon::parse($value)->format('l, j F Y'); 
				}),

			Number::make('Maximum Temperature (°C)', 'temperature_max')->sortable(),
			Number::make('Minimum Temperature (°C)', 'temperature_min')->sortable(),
			Number::make('Total Precipitation (mm)', 'precipitation_sum')->sortable(),

			HasMany::make('Weather Hourly Forecasts'),
		];
	}

	/**
	 * Order resource index query by forecast date.
	 *
	 */
	public static function indexQuery(NovaRequest $request, Builder $query): Builder
	{
		parent::indexQuery($request, $query);

		return $query->orderBy('forecast_date');
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
