@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            @guest
                <div class="guest-user">
                    @yield('home-guest-user')

                </div>

            @else
                <div class="auth-user">
                    @yield('home-auth-user')
                </div>

            @endguest
        </div>
    </div>
</div>
@endsection
