<x-app-layout>
   @if(isset($mainStats))
   <v-app>
      <v-container>
         <div class="transition-swing text-h3 ma-4">Main Stats</div>
         <youtube-simple-stats :stats='@json($mainStats["channelStats"])'></youtube-simple-stats>
         <div class="transition-swing text-h3 ma-4">Activity</div>
         <youtube-activity-event :event_data='@json($mainStats["channelActivity"])'></youtube-activity-event>
      </v-container>
   </v-app>
   @endif
</x-app-layout>