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
        <youtube-add-comment :video_id="'{{ $youtubeVideoID }}'" :video_metadata='@json($youtubeVideoContent)'></youtube-add-comment>
      </v-row>
      <v-row>
        @forelse($comments as $comment)
        <youtube-comment id="{{$comment->id}}" :message='@json($comment)' class="ma-2"></youtube-comment>
        @empty
        <p>No replies</p>
        @endforelse
      </v-row>
    </v-container>
  </v-app>
  @push('scripts')
  <script>
    var message = "{{ $message }}";
    // Small jquery code just to go to the required comment and highlight it.
    $(document).ready(function() {
      @if($scroll)
      $('html, body').animate({
        scrollTop: $("#"+message).offset().top
      }, 'slow');
      $("#"+message).animate({opacity: 0.5}, 2000, 'linear');
      $("#"+message).animate({opacity: 1.0}, 2000, 'linear');
      //$('#6cdm2MziC7q4').fadeIn('slow');
      @endif
    });
  </script>
  @endpush
  @endif
</x-app-layout>