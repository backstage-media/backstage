<template>
  <v-container fluid>
    <v-row v-for="entry in stats.rows" :key="entry.value">
      <v-col v-for="(field, index) in entry" :key="index">
        <v-sheet color="#673ab7" elevation="2" rounded >
          <div class="stat-title-text pa-2">
            {{ stats.columnHeaders[index].name }}
             <div class="stat-text">{{ field }}</div>
          </div>
        </v-sheet>
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
<style>
.stat-text {
  color: white;
  font-size: 250%;
  line-height: 150px;
  text-align: center;
}

.stat-title-text {
  text-align: center;
  color: white;
  font-size: 250%;
}

.stat-box {
  background-color: #673ab7;
}
</style>