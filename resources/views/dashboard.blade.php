<x-app-layout>
   <v-container>
      @if(!empty($mainStats["channelStats"]))
      <v-app>
         <div class="transition-swing text-h3 ma-4">Main Stats</div>
         <youtube-simple-stats :stats='@json($mainStats["channelStats"])'></youtube-simple-stats>
         <div class="transition-swing text-h3 ma-4">Activity</div>
         <youtube-activity-event :event_data='@json($mainStats["channelActivity"])'></youtube-activity-event>
      </v-app>
      @else
      <v-app>
      <div class="transition-swing text-h5 ma-4">Connect your Youtube Account to see stats and activity</div>
      </v-app>
      @endif
      
   </v-container>
</x-app-layout>