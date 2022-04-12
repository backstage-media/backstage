<x-app-layout>
  <v-app>
    <template>
      <v-container>
      <div class="transition-swing text-h5 ma-4">
      @if(session()->get('youtube_name'))
      {{ session()->get('youtube_name') }} channel
      @else
      Connect your Youtube Account to see content.
      @endif
    </div>
    <v-layout row wrap>
          <template>
            @foreach ($latestYoutubeContent as $item)
            @if(is_object($item))
            <v-flex md6>
              <youtube-card :video_data='@json($item)' class="ma-5 w-100"></youtube-card>
            </v-flex>
            @endif
            @endforeach
          </template>
    </v-layout>
      </v-container>
    </template>
  </v-app>
</x-app-layout>