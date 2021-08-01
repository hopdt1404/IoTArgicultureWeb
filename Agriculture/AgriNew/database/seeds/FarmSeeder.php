<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FarmSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('Farms')->updateOrInsert(
            [
                'FarmID' => 1
            ],
            [
                'LocateID' => 353412,
                'Area' => 1,
                'FarmTypeID' => 1,
                'UserID' => 1,
            ]
        );
    }
}
