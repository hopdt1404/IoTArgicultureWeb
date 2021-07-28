<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PlotSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('Plots')->updateOrInsert(
            [
                'PlotID' => 1,
            ],
            [
                'FarmID' => 1,
                'PlotTypeID' => 1,
                'Area' => 1,
            ]
        );
    }
}
