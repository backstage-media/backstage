<template>
  <v-card
    flat
    color="transparent"
  >
    <v-subheader>Monthly Price</v-subheader>
    <v-card-text class="pt-0">
      <v-slider
        v-model="value"
        :rules="rules"
        label="Price in USD"
        step="10"
        thumb-label="always"
        ticks
      ></v-slider>
    </v-card-text>
  </v-card>
</template>
<script>
export default {
  data() {
    return {
      value: 49,
      rules: [(v) => v <= 199 || "Max price is 199$ Monthly"],
    };
  },
};
</script>