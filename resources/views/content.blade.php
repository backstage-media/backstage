<x-app-layout>
  <v-app>
    <h2>This is the Content view</h2>
    <template>
      <v-container class="grey lighten-5">
        <v-row no-gutters>
          <template>
            @foreach ($latestYoutubeContent as $item)
            @if(is_object($item))
            <v-col>
              <youtube-card :video_data='@json($item)'></youtube-card>
            </v-col>
            @endif
            @if($loop->iteration % 2 == 0)
            <v-responsive width="100%"></v-responsive>
            @endif
            @endforeach
          </template>
        </v-row>
      </v-container>
    </template>
  </v-app>
</x-app-layout>