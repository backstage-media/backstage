<template>
  <v-container>
    <v-row>
    <v-col v-for="item in stats.columnHeaders" :key="item.name">
      {{item.name}}
    </v-col>
    </v-row>
    <v-row v-for="entry in stats.rows" :key="entry.value">
        <v-col v-for="field in entry" :key="field.value">
        {{field}}
        </v-col>
    </v-row>
  </v-container>
</template>
<script>
module.exports = {
    name:"YoutubeBasicStats",
    props: ['stats'],
  mounted() {
      console.log(this);
      }
};
</script>