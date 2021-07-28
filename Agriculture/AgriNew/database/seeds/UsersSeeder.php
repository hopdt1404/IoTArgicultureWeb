<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('Users')->updateOrInsert(
            [
                'UserID' => 1,
            ],
            [
                'UserName' => 'admin',
                'Email' => 'admin@iotagriculture.com',
                'UPassword' => md5('123456'),
            ]
        );

    }
}
