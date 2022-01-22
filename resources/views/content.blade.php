<x-app-layout>
  <v-app>
    <template>
      <v-container>
      <div class="transition-swing text-h3 ma-4">
      @if(session()->get('youtube_name'))
      Youtube content from {{ session()->get('youtube_name') }} channel
      @else
      Connect your Youtube Account to see content.
      @endif
    </div>
        <v-row no-gutters>
          <template>
            @foreach ($latestYoutubeContent as $item)
            @if(is_object($item))
            <v-col>
              <youtube-card :video_data='@json($item)' class="ma-5"></youtube-card>
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