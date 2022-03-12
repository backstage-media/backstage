<template>
  <v-card elevation="1">
    <v-textarea
      name="input-comment"
      label="Comment"
      v-model="text"
    ></v-textarea>
    <v-card-actions>
      <v-btn v-on:click="submit()">Add Comment</v-btn>
    </v-card-actions>
  </v-card>
</template>
<script>
export default {
  name: "AddYoutubeCommentComponent",
  props: {
    video_id: {
      type: String,
    }
  },
  data() {
    return {
      text: "",
      current_date: "",
      token: "{{ csrf_token() }}",
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

      var response = this.$http.post("/comment/add", {
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        },
        emulateJSON: true,
        _method: "post",
        _token: token.content,
        text: this.text,
        video_id: this.video_id,
      });
      console.log(response);
    },
  },
};
</script>