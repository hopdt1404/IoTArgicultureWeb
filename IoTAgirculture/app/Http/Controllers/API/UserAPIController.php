<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

/**
 * Class UserAPIController
 * @package App\Http\Controllers\API
 */

class UserAPIController extends Controller
{
    var $table = 'users';
    var $model = null;

    public function __construct(User $user)
    {
        $this->model = $user;
    }

    /**
     * Display a all info of User.
     * GET|HEAD /user
     *
     * @param  $request
     * @return null
     */
    public function index(Request $request) {
        return response()->json(["Controller" => "UserAPIController", "method" => 'index']);
    }

    public function store(Request $request) {
//        return response()->json(["Controller" => "UserAPIController", "method" => 'post']);
        return response()->json(
            ["Controller" => "UserAPIController", "method" => 'post']);
    }





}
