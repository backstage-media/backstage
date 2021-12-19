<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
    <v-col v-for="item in stats.columnHeaders" :key="item.name">
      <p>{{item.name}}</p>
    </v-col>
    </v-row>
    <v-row v-for="entry in stats.rows" :key="entry.value">
        <v-col v-for="field in entry" :key="field.value">
        <p>{{field}}</p>
        </v-col>
    </v-row>
  </v-container>
</template>
<script>
module.exports = {
    name:"YoutubeBasicStats",
    props: ['stats'],
  data() {
    return {
      greeting: "Hello"
    };
  },
  mounted() {
      console.log(this);
      }
};
</script>