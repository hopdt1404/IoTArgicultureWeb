<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FarmTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('FarmTypes')->updateOrInsert(
            [
                'FarmTypeID' => 1,
                'FarmType' => 'Default',
            ]
        );
    }
}
