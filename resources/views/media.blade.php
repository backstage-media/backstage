<x-app-layout>
  @if(isset($youtubeVideoContent))
  <v-app>
    <v-container>
      <v-row no-gutters>
        <v-col cols="12" sm="6" md="8" class="pa-3">
          <youtube-card :video_data='@json($youtubeVideoContent)'></youtube-card>
        </v-col>
        <v-col cols="3" md="4" sm="6" class="pa-3" fill-height>
            <youtube-chat ></youtube-chat>
        </v-col>
      </v-row>
      <v-row><youtube-simple-stats :stats='@json($youtubeVideoAnalytics)'></youtube-simple-stats></v-row>
    </v-container>
  </v-app>
  @endif
</x-app-layout>