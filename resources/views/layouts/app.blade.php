<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Backstage') }}</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/general-theme.css') }}">
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
</head>
<!-- App.vue -->

<div id="app">
    <!-- Side menu -->
    <v-app>
    @if(!session()->has('wizard'))
      @if(session()->get('profile_type') == 1)
        <creator-side-menu :youtube_description="'{{session()->get('youtube_description')}}'" :youtube_name="'{{session()->get('youtube_name')}}'" :youtube_avatar="'{{session()->get('youtube_avatar')}}'"></creator-side-menu>
      @elseif(session()->get('profile_type') == 2)
        <manager-side-menu :user_profile="{{  json_encode(session()->get('profile')) }}"></manager-side-menu>
      @endif
    @endif
    <v-app>
    <!-- End Side menu -->
    <!-- Header bar -->
    <v-app-bar app hide-on-scroll color="#673AB7">
        <h1 class="text-white">Backstage</h1>
    </v-app-bar>
    <!-- End header bar -->
    <!-- Sizes your content based upon application components -->
    <v-main>
        <!-- Provides the application the proper gutter -->
        <v-container fluid>
            {{ $slot ?? '' }}
        </v-container>
    </v-main>

    <v-footer app>
        <!-- -->
    </v-footer>
</div>

</html>