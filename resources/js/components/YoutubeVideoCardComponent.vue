<template>
  <v-card>
    <LazyYoutubeVideo
      aspect-ratio="16:9"
      thumbnail-quality="standard"
      :src="'https://www.youtube.com/embed/'+video_data.items[0].id"
    />
    <v-bottom-navigation :value="value" color="primary">
      <v-btn>
        <span>Recents</span>

        <v-icon>mdi-history</v-icon>
      </v-btn>

      <v-btn>
        <span>Favorites</span>

        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn>
        <span>Share</span>

        <v-icon>mdi-share</v-icon>
      </v-btn>
    </v-bottom-navigation>
  </v-card>
</template>
<script>
import LazyYoutubeVideo from "vue-lazy-youtube-video";
export default {
  name: "YoutubeVideoCardComponent",
  props: ["video_data"],
  components: {
    LazyYoutubeVideo,
  },
  mounted() {
    console.log(this);
  },
};
</script>