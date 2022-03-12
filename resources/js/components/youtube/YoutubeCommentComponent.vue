<template>
  <v-card class="mx-auto" color="#673AB7" dark>
    <v-card-actions>
      <v-list-item class="grow">
        <v-list-item-avatar color="grey darken-3">
          <v-img
            class="elevation-6"
            alt=""
            src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
          ></v-img>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title>{{message.user.name || 'Guest User'}}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-card-actions>
    <v-card-text class="font-weight-bold">
      <span v-html="message.text"></span>
    </v-card-text>
    <v-card-subtitle>
      {{ message.created_at }}
    </v-card-subtitle>
    <v-card-actions>
      <v-btn>Reply</v-btn>
      <v-btn v-on:click="goto(30)">Go to second 30</v-btn>
      <v-btn icon :href="'/media/' + message.video_id + '?comment='+message.id" class="ma-2">
        <v-icon>mdi-share-variant</v-icon>
      </v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
module.exports = {
  name: "YoutubeChannelInfo",
  props: ["message"],  
  mounted() {},
  methods: {
        goto: function(sec) {
            this.$root.$refs.videoController.seek(sec, true);
        }
    }
};
</script>