<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Controllers\Controller;

/**
 * Class DemoAPIController
 * @package App\Http\Controllers\API
 */


class DemoAPIController extends Controller
{

    public function test()
    {
        return view('welcome');
    }

    public function returnResponse()
    {
        return response()->json([
            'hello' => "valuse"
        ]);
    }

}
