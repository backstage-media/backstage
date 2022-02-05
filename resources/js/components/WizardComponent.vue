<template>
<v-form action="/wizard/submit" method="post">
<input type="hidden" name="_token" :value="csrf">
  <v-stepper v-model="e6" vertical>
    <v-stepper-step :complete="e6 > 1" step="1">
      Choose Your Role
      <small>Are you content creator or content manager?</small>
    </v-stepper-step>

    <v-stepper-content step="1">
      <div class="pa-4">
        <v-radio-group v-model="radioGroup" id="user-role" name="user-role">
          <v-radio label="Content Creator" value="creator"></v-radio>
          <v-radio label="Content Manager" value="manager"></v-radio>
        </v-radio-group>
      </div>
      <v-btn color="primary" @click="e6 = 2"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 2" step="2">
      Provide a short bio from yourself.
    </v-stepper-step>

    <v-stepper-content step="2">
      <v-textarea
        name="user-description"
        label="Something about you"
        value="I'm here on backstage!"
      ></v-textarea>
      <v-btn color="primary" @click="e6 = 3"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 3" step="3">
      Finally tell me your name... (Visible only by your partners)
    </v-stepper-step>

    <v-stepper-content step="3">
           <v-text-field
            label="User Name"
            name="user-name"
          ></v-text-field>
      <v-btn type="submit" color="primary"> Start! </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>
  </v-stepper>
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