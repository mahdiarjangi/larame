<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>
    @hasSection('title')
    Larame - @yield('title')
    @else
    Larame
    @endif
    </title>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    @yield('style')
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        @include('layouts.header')

        @yield('content')
    </div>

    @yield('script')
    <script src="{{ asset('js/app.js') }}"></script>
</body>
</html>