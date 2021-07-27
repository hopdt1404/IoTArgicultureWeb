<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name', 'IoT Agri') }}</title>
        <script>
            (function () {
                window.Laravel = {
                    csrfToken: '{{ csrf_token() }}'
                };

            })();
        </script>

    </head>
    <body>
        <div id="app">
            <app></app>
        </div>

    </body>
    <script src="{{ mix('/js/app.js') }}"></script>
    <script src="{{ asset('js/app.js') }}" defer></script>

    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

</html>
