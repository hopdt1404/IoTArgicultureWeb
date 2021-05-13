<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWeatherForecastDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('weather_forecast_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('weather_forecast_id');
            $table->dateTime('forecast_time');
            $table->unsignedInteger('epoch_time')->nullable();
            $table->string('status', 50)->nullable();
            $table->unsignedTinyInteger('is_day_light')->nullable();
            $table->double('temperature',8,2)->nullable();
            $table->double('wind_speed',8,2)->nullable();
            $table->double('relative_humidity',8,2)->nullable();
            $table->float('rain_probability', 4, 1)->nullable();
            $table->unsignedDouble('rain_value',8,2)->nullable();
            $table->unsignedSmallInteger('could_cover')->nullable();
            $table->string('created_user', 128);
            $table->string('updated_user', 128)->nullable();
            $table->dateTime('created_at');
            $table->dateTime('updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('weather_forecast_detail');
    }
}
