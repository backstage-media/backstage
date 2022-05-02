<template>
  <v-card elevation="1">
    <v-card class="mx-auto pa-2" max-width="350px">
      <v-card-title>Establecer Momento del video (en Segundos)</v-card-title>
      <v-text-field v-model="second" hide-details single-line type="number" />
    </v-card>
    <v-textarea
      name="input-comment"
      label="Comment"
      v-model="text"
    ></v-textarea>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-on:click="submit()">Agregar Comentario</v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
export default {
  name: "AddYoutubeCommentComponent",
  props: {
    video_id: {
      type: String,
    },
    video_metadata: {
      type: Array,
    },
  },
  data() {
    return {
      text: "",
      current_date: "",
      token: "{{ csrf_token() }}",
      second: 0,
    };
  },
  mounted() {
    console.log(this);
  },
  methods: {
    submit: function () {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http
        .post("/comment/add", {
          headers: {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
          },
          emulateJSON: true,
          _method: "post",
          _token: token.content,
          text: this.text,
          video_id: this.video_id,
          video_title: this.video_metadata.items[0].snippet.title,
          second: this.second,
        })
        .then((res) => res.json())
        .then((res) => {
          window.location = "/media/" + this.video_id + "?comment=" + res;
        });
    },
  },
};
</script>