<?php

namespace App\Nova;

use Illuminate\Contracts\Database\Eloquent\Builder;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Resource as NovaResource;
use Laravel\Scout\Builder as ScoutBuilder;
use Illuminate\Http\Request;

abstract class Resource extends NovaResource
{
	/**
	 * Build an "index" query for the given resource.
	 */
	public static function indexQuery(NovaRequest $request, Builder $query): Builder
	{
		// Remove default nova sorting by id.
		$query->getQuery()->orders = array_values(array_filter(
			$query->getQuery()->orders ?? [], 
			fn($order) => strpos($order['column'], '.id') === false
		));
	
		return $query;
	}

	/**
	 * Build a Scout search query for the given resource.
	 */
	public static function scoutQuery(NovaRequest $request, ScoutBuilder $query): ScoutBuilder
	{
		return $query;
	}

	/**
	 * Build a "detail" query for the given resource.
	 */
	public static function detailQuery(NovaRequest $request, Builder $query): Builder
	{
		return parent::detailQuery($request, $query);
	}

	/**
	 * Build a "relatable" query for the given resource.
	 *
	 * This query determines which instances of the model may be attached to other resources.
	 */
	public static function relatableQuery(NovaRequest $request, Builder $query): Builder
	{
		return parent::relatableQuery($request, $query);
	}

	/**
     * Show or hide resource replication button.
     */
	public function authorizedToReplicate(Request $request)
	{
		return false;
	}
}
