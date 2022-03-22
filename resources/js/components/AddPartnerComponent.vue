<template>
  <v-form v-model="valid" action="/partner/submit" method="post" enctype="multipart/form-data">
  <input type="hidden" name="_token" :value="csrf">
    <v-container>
      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="lastname"
            :rules="nameRules"
            :counter="10"
            label="Last name"
            id="partner-name"
            name="partner-name"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-text-field
            v-model="email"
            :rules="emailRules"
            name="partner-email"
            id="partner-email"
            label="E-mail"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-file-input show-size label="File input" id="partner-file" name="partner-file"></v-file-input>
        </v-col>
        <v-btn type="submit">Create partner</v-btn>
      </v-row>
    </v-container>
  </v-form>
</template>
<script>
export default {
  data() {
    return {
      csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      e6: 1,
    };
  },
};
</script>