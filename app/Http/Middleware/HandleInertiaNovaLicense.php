<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Config;
use Inertia\Inertia;
use Inertia\Middleware;
use Inertia\ResponseFactory;
use Laravel\Nova\Http\Resources\UserResource;
use Laravel\Nova\Http\Middleware\HandleInertiaRequests;
use Laravel\Nova\Nova;

class HandleInertiaNovaLicense extends HandleInertiaRequests
{
    /**
     * Defines the props that are shared by default.
     *
     * @see https://inertiajs.com/shared-data
     *
     * @return array
     */
    #[\Override]
    public function share(Request $request)
    {
        return array_merge(parent::share($request), [
            'validLicense' => static function () use ($request) {
                return true;
            },
        ]);
    }
}
