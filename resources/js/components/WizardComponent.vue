<template>
  <v-stepper v-model="e6" vertical>
    <v-stepper-step :complete="e6 > 1" step="1">
      Choose Your Role
      <small>Are you content creator or content manager?</small>
    </v-stepper-step>

    <v-stepper-content step="1">
      <div class="pa-4">
        <v-radio-group v-model="radioGroup" id="user-role">
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
      Select an ad format and name ad unit
    </v-stepper-step>

    <v-stepper-content step="3">
      <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
      <v-btn color="primary" @click="e6 = 4"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step step="4"> View setup instructions </v-stepper-step>
    <v-stepper-content step="4">
      <v-card color="grey lighten-1" class="mb-12" height="200px"></v-card>
      <v-btn color="primary" @click="e6 = 1"> Continue </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>
  </v-stepper>
</template>
<script>
export default {
  data() {
    return {
      e6: 1,
    };
  },
};
</script>