<x-app-layout>
@if(isset($mainStats))
<v-app>
   <youtube-simple-stats :stats='@json($mainStats["channelStats"])'></youtube-simple-stat>
</v-app>
@endif
</x-app-layout>