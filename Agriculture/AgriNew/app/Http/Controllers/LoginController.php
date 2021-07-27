<?php

namespace App\Http\Controllers;



use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class LoginController {

    public function index(Request $request) {
        if (Auth::check()) {
            Log::info($request->user());
            return view('welcome');
        } else {
            return view('guest.home');
        }
    }

    public function logout() {
        Auth::logout();
        return view('auth.login');
    }
}
