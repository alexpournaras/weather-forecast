<?php

namespace App\Nova;

use Carbon\Carbon;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Http\Requests\NovaRequest;
use Illuminate\Contracts\Database\Eloquent\Builder;

class WeatherHourlyForecast extends Resource
{
	/**
	 * The model the resource corresponds to.
	 *
	 * @var class-string<\App\Models\WeatherHourlyForecast>
	 */
	public static $model = \App\Models\WeatherHourlyForecast::class;

	/**
	 * The single value that should be used to represent the resource when being displayed.
	 *
	 * @var string
	 */
	public static $title = 'forecast_datetime';

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
	public static $perPageViaRelationship = 24;

	/**
	 * Get the fields displayed by the resource.
	 *
	 * @return array<int, \Laravel\Nova\Fields\Field>
	 */
	public function fields(NovaRequest $request): array
	{
		return [
			DateTime::make('Forecast Time', 'forecast_datetime')
				->sortable()
				->displayUsing(function ($value) {
					return Carbon::parse($value)->format('H:i'); 
				}),

			Number::make('Temperature (°C)', 'temperature')->sortable(),
			Number::make('Precipitation (mm)', 'precipitation')->sortable(),
		];
	}

	/**
	 * Order resource index query by forecast date.
	 *
	 */
	public static function indexQuery(NovaRequest $request, Builder $query): Builder
	{
		parent::indexQuery($request, $query);

		return $query->orderBy('forecast_datetime');
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
