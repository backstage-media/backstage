<template>
  <v-card class="d-flex flex-column" min-width="400px">
    <v-list-item link :href="'/media/' + video_data.items[0].id">
      <v-list-item-content>
        <v-list-item-title class="text-h5">
          {{ video_data.items[0].snippet.title }}
        </v-list-item-title>
        <v-list-item-subtitle class="text-wrap">
          <v-chip
            class="ma-1"
            label
            small
            link
            outlined
            v-for="tag in video_data.items[0].snippet.tags"
            :key="tag"
          >
            {{ tag }}
          </v-chip>
        </v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
    <LazyYoutubeVideo
      enablejsapi
      id="player"
      aspect-ratio="16:9"
      thumbnail-quality="standard"
      :src="'https://www.youtube.com/embed/' + video_data.items[0].id"
      @init:player="onPlayerInit"
    />
    <v-spacer></v-spacer>
    <v-card-actions height="30px">
      <v-badge
        v-if="video_data.items[0].status.privacyStatus == 'private'"
        bordered
        color="#9C27B0"
        icon="mdi-eye-off-outline"
        overlap
      >
        <v-btn class="white--text" color="#9C27B0" depressed
        v-on:click="update_video(video_data.items[0].id, 'unlisted')">
          Change to Hidden
        </v-btn>
      </v-badge>
      <v-icon
        v-if="video_data.items[0].status.privacyStatus == 'private'"
        class="ma-2"
        alt="private"
        >mdi-lock-outline</v-icon
      >
      <v-badge
        v-if="video_data.items[0].status.privacyStatus == 'unlisted'"
        bordered
        color="#9C27B0"
        icon="mdi-publish"
        overlap
      >
        <v-btn class="white--text" color="#9C27B0" depressed
        v-on:click="update_video(video_data.items[0].id, 'public')">
          Publish Video
        </v-btn>
      </v-badge>
      <v-icon
        v-if="video_data.items[0].status.privacyStatus == 'unlisted'"
        class="ma-3"
        alt="hidden"
        >mdi-eye-off-outline</v-icon
      >
      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-bookmark</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-share-variant</v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
import LazyYoutubeVideo from "vue-lazy-youtube-video";
var player,
  seconds = 0;
export default {
  name: "YoutubeVideoCardComponent",
  props: ["video_data"],
  components: {
    LazyYoutubeVideo,
  },
  created() {
    this.$root.$refs.videoController = this;
  },
  data() {
    return {
      player: "",
      text: "",
      token: "{{ csrf_token() }}",
    };
  },
  methods: {
    onPlayerInit: function (player) {
      console.log(player);
      this.player = player;
    },
    seek: function (sec) {
      this.player.instance.seekTo(sec, true);
    },
    update_video: function (id,visibility) {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http.post("/youtube/update", {
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        },
        emulateJSON: true,
        _method: "post",
        _token: token.content,
        text: this.text,
        video_id: id,
        visibility: visibility
      });
      console.log(response);
    },
    mounted() {
      console.log(this);
    },
  },
};
</script>