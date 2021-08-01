<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LocateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('Locates')->updateOrInsert(
            [
                'LocateID' => 353412,
                'LocateName' => 'Ha Noi',
            ]
        );
    }
}
