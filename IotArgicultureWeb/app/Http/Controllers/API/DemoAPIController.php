<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;

/**
 * Class DemoAPIController
 * @package App\Http\Controllers\API
 */


class DemoAPIController extends AppBaseController
{

    public function test() 
    {
        return view('welcome');
    }

    public function returnResponse() 
    {
        return $this->sendResponse('data is null', 'messenger');
    }

}