<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class LoginController {
    public function logout() {
        Auth::logout();
        return view('layouts.app');
    }
}
