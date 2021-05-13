<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

/*  Start code to work with router vuejs
 * Source: https://viblo.asia/p/laravel-vuejs-vue-router-63vKjGXRZ2R
 * date: 29/04/2021
 * author hopdt
 *
*/
//Route::view('login', 'auth.login');
Route::view('/{any}', 'home')
    ->where('any', '.*');

/* End code work with router vuejs */



//Auth::routes();

 // Route::get('/home', 'HomeController@index')->name('home');


//Auth::routes(['verify' => true]);

//Route::get('/home', 'HomeController@index')->middleware('verified');
