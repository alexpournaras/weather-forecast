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
		Schema::create('weather_hourly_forecasts', function (Blueprint $table) {
			$table->id();
			$table->timestamps();
			$table->unsignedBigInteger('weather_daily_forecast_id');
			$table->dateTime('forecast_datetime');
			$table->float('temperature');
			$table->float('precipitation');
		});
	}

	/**
	 * Reverse the migrations.
	 */
	public function down(): void
	{
		Schema::dropIfExists('weather_hourly_forecasts');
	}
};
