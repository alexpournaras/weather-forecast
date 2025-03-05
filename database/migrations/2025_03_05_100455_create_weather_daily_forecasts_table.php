<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	/**
	 * Run the migrations.
	 */
	public function up(): void
	{
		Schema::create('weather_daily_forecasts', function (Blueprint $table) {
			$table->id();
			$table->timestamps();
			$table->unsignedBigInteger('location_id');
			$table->date('forecast_date');
			$table->float('temperature_max');
			$table->float('temperature_min');
			$table->float('precipitation_sum');
			$table->string('forecast_source');
		});
	}

	/**
	 * Reverse the migrations.
	 */
	public function down(): void
	{
		Schema::dropIfExists('weather_daily_forecasts');
	}
};
