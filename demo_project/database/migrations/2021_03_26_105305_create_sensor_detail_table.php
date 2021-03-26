<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSensorDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sensor_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sensor_id')->nullable();
            $table->double('soil_moisture',8,2)->nullable();
            $table->double('humidity',8,2)->nullable();
            $table->double('temperature',8,2)->nullable();
            $table->unsignedSmallInteger('light_level')->nullable();
            $table->dateTime('time_of_measurement')->nullable();
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
        Schema::dropIfExists('sensor_detail');
    }
}
