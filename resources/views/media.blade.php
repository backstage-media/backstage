<x-app-layout>
  @if(isset($youtubeVideoContent))
  <v-app>
    <v-container>
      <v-row no-gutters>
        <youtube-card :video_data='@json($youtubeVideoContent)'></youtube-card>
      </v-row>
      <v-row>
        <youtube-simple-stats :stats='@json($youtubeVideoAnalytics)'></youtube-simple-stats>
      </v-row>
      <v-row>
        <!--<youtube-add-comment></youtube-add-comment> -->
      </v-row>
    </v-container>
  </v-app>
  @endif
</x-app-layout>