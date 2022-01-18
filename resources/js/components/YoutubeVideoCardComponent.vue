<template>
  <v-card class="ma-5">
    <v-list-item link>
            <v-list-item-content>
              <v-list-item-title class="text-h4">
                {{video_data.items[0].snippet.title}}
              </v-list-item-title>
              <v-list-item-subtitle>
              <v-chip class="ma-1"  
              label
              small
              link
              outlined v-for="tag in video_data.items[0].snippet.tags" :key="tag">
              {{ tag }}
              </v-chip>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
    <LazyYoutubeVideo
      aspect-ratio="16:9"
      thumbnail-quality="standard"
      :src="'https://www.youtube.com/embed/' + video_data.items[0].id"
    />
<v-card-actions>
      <v-badge v-if="video_data.items[0].status.privacyStatus == 'private'"
        bordered
        color="#9C27B0"
        icon="mdi-publish"
        overlap
      >
        <v-btn 
          class="white--text"
          color="#9C27B0"
          depressed
        >
          Publish Video
        </v-btn>
      </v-badge>
              <v-spacer></v-spacer>
              <v-btn icon>
                <v-icon>mdi-heart</v-icon>
                <div>12132</div>
              </v-btn>

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