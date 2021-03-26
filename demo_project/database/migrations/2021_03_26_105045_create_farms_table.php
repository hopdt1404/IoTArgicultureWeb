<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFarmsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('farms', function (Blueprint $table) {
            $table->id();
            $table->string('name', 128);
            $table->unsignedDouble('area', 10, 2)->nullable();
            $table->unsignedTinyInteger('farm_type_id')->nullable();
            $table->unsignedSmallInteger('status')->default(0);
            $table->unsignedBigInteger('user_id');
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
        Schema::dropIfExists('farms');
    }
}
