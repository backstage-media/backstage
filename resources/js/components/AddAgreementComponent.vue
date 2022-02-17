<template>
  <v-card class="mx-auto" max-width="600">
  <v-form action="/plans/create" method="post">
  <input type="hidden" name="_token" :value="csrf">
    <v-list-item two-line>
      <v-list-item-content>
        <v-list-item-title class="text-h5">
          Add new billing plan
        </v-list-item-title>
        <v-list-item-subtitle
          >Plans available for content creators.</v-list-item-subtitle
        >
      </v-list-item-content>
    </v-list-item>
    <v-select :items="items" label="Billing Period (Months)" name="plan-months" id="plan-months"></v-select>
    <v-slider
    name="plan-price"
      v-model="slider"
      :max="max"
      :min="min"
      label="Price per month"
      thumb-label="always"
      id="plan"
    ></v-slider>
    <v-slider
    name="plan-discount"
      v-model="value"
      :rules="rules"
      label="Discount?"
      step="10"
      thumb-label="Apply discount to your plan"
      ticks
    ></v-slider>
    <v-divider></v-divider>
      <v-btn type="submit" color="primary"> Add Plan</v-btn>
  </v-form>
  </v-card>
</template>
<script>
export default {
  data() {
    return {
      items: ["1", "3", "6", "12"],
      min: 20,
      max: 149,
      slider: 70,
      value: 30,
      rules: [(v) => v <= 70 || "Max Allowed 70% Discount"],
      csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
    };
  },
};
</script>