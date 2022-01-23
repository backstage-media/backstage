<template>
  <v-container fluid>
    <v-row>
      <v-col v-for="item in stats.columnHeaders" :key="item.name">
        <h2>{{ item.name }}</h2>
      </v-col>
    </v-row>
    <v-row v-for="entry in stats.rows" :key="entry.value">
      <v-col v-for="field in entry" :key="field.value">
        <p>{{ field }}</p>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
  name: "YoutubeBasicStats",
  props: ["stats"],
  mounted() {
    console.log(this);
  },
};
</script>