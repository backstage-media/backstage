<x-app-layout>
<x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        {{ __('Dashboard') }}
    </h2>
</x-slot>

<div class="py-12">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-5">
        <div class="content">
<div class="title m-b-md">
<a href="{{ url('/login/google') }}">Youtube Authentication</a>
</div>
</div>
@if (session()->has('mainstats'))
<div id="app">
   <youtube-simple-stats :stats='@json(session()->get("mainstats"))'></youtube-simple-stat>
</div>
@endif
        </div>
    </div>
</div>
</x-app-layout>