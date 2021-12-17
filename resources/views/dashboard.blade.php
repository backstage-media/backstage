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

     <div class="flex">
     @foreach($mainstats ?? ''['rows'] as $stat)
    <x-embed url="https://www.youtube.com/watch?v={{$stat[0]}}" />
@endforeach
     </div>

<pre>
    <code>
        @json($mainstats ?? '');
    </code>
</pre>

<div id="app">
   <example-component></example-component>
</div>
        </div>
    </div>
</div>
</x-app-layout>