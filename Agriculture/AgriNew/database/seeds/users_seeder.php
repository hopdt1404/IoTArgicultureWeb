<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class users_seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->updateOrInsert(
            ['id' => 1],
            [
                'name' => 'hopdt1404',
                'email' => 'hopdt1404@gmail.com',
                'password' => bcrypt('17021389hH'),
                'user_type_id' => 0,
                'created_at' => now(),
            ]
        );
    }
}
