<?php

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

Route::get('/', function () {
    return view('layouts.app');
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/logout', 'LoginController@logout');

Auth::routes(['verify' => true]);

Route::get('/home', 'HomeController@index')->middleware('verified');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

/* this code to url bypass router laravel => Router VueJs */
Route::get('/{any?}', 'AppController')
    ->where('any', '^(?!api).*$')
    ->name('administration');
