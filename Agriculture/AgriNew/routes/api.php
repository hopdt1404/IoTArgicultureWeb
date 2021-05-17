<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('farm', 'FarmAPIController');

Route::resource('user', 'UserAPIController');
Route::post('user/updateImageProfile', 'UserAPIController@updateImageProfile');
Route::get('user/getAvatar/{id}', 'UserAPIController@getAvatar');
Route::post('user/deleteAvatar/{id}', 'UserAPIController@deleteAvatar');
Route::post('/user/{id}', 'UserAPIController@update');
Route::post('user/maskFunction', 'UserAPIController@maskFunction');

