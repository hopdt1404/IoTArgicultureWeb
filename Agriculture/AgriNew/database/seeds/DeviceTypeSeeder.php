<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DeviceTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('DeviceTypes')->updateOrInsert(
            [
                'DeviceTypeID' => 1,
                'DeviceType' => 'Agriculture Sensor',
            ]
        );
        DB::table('DeviceTypes')->updateOrInsert(
            [
                'DeviceTypeID' => 2,
                'DeviceType' => 'Pump',
            ]
        );
    }
}
