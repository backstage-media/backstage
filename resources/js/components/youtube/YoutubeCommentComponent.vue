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
          <v-list-item-title>{{
            message.user.name || "Usuario Invitado"
          }}</v-list-item-title>
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
      <v-btn
        v-if="message.youtube_second > 0"
        v-on:click="goto(message.youtube_second)"
        >Ir al minuto del video</v-btn
      >
      <v-spacer></v-spacer>
      <v-btn
        icon
        :href="'/media/' + message.video_id + '?comment=' + message.id"
        class="ma-2"
      >
        <v-icon>mdi-share-variant</v-icon>
      </v-btn>
    </v-card-actions>
    <v-snackbar v-model="snackbar">
      {{ text }}

      <template v-slot:action="{ attrs }">
        <v-btn color="pink" text v-bind="attrs" @click="snackbar = false">
          Cerrar
        </v-btn>
      </template>
    </v-snackbar>
  </v-card>
</template>
<script>
module.exports = {
  name: "YoutubeChannelInfo",
  props: ["message"],
  data: () => ({
    snackbar: false,
    text: `Por favor, reproduce el video primero.`,
  }),
  mounted() {},
  methods: {
    goto: function (sec) {
      try {
        window.scrollTo({ top: 0, behavior: "smooth" });
        this.$root.$refs.videoController.seek(sec, true);
      } catch (err) {
        this.snackbar = true;
      }
    },
  },
};
</script>