<template>
  <v-card class="mx-auto" max-width="434" tile>
    <v-img
      height="100%"
      src="https://cdn.vuetifyjs.com/images/cards/server-room.jpg"
    >
      <v-row align="end" class="fill-height">
        <v-col align-self="start" class="pa-0" cols="12">
          <v-avatar color="primary" size="123" class="ma-3">
            <v-img
              src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"
            ></v-img>
          </v-avatar>
        </v-col>
        <v-col class="py-0">
          <v-list-item color="rgba(0, 0, 0, .4)" dark>
            <v-list-item-content>
              <v-list-item-title class="text-h6">
                {{ manager_data.name }}
              </v-list-item-title>
              <v-list-item-subtitle>test</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-col>
      </v-row>
    </v-img>
  </v-card>
</template>
<script>
export default {
  name: "ManagerUserComponent",
  props: ["manager_data"],
  mounted() {
    console.log(this);
  },
};
</script>