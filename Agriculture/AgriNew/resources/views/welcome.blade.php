<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>IoT Agri</title>
        <script>
            (function () {
                window.Laravel = {
                    csrfToken: '{{ csrf_token() }}'
                };
            })();
        </script>

    </head>
    <body>
        <h3>Welcome.blade.php</h3>
        <div id="app">
            <app></app>
        </div>

    </body>
    <script src="{{ mix('/js/app.js') }}"></script>
    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">

{{--    user css from google api -- not need  --}}
{{--    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i" rel="stylesheet">--}}
{{--    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">--}}


</html>
