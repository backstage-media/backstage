<template>
  <v-card>
    <v-list two-line>
      <v-list-item-group>
        <template v-for="(item, index) in event_data">
          <v-list-item
            :key="item.snippet.title"
            v-bind:color="type === 'guest' ? '#AB47BC' : '#9C27B0'"
          >
            <template v-slot:default="{ active }">
              <v-list-item-content>
                <v-list-item-title
                >{{item.snippet.title}}<v-chip class="ma-2" color="purple text-white">{{item.snippet.type + ' event'}}</v-chip
                ></v-list-item-title>

                <v-list-item-subtitle
                  class="text--primary"
                  ></v-list-item-subtitle>

                <v-list-item-subtitle
                  v-text="item.snippet.description"
                ></v-list-item-subtitle>
              </v-list-item-content>

              <v-list-item-action>
                <v-list-item-action-text
                  v-text="item.snippet.publishedAt"
                ></v-list-item-action-text>
              </v-list-item-action>
            </template>
          </v-list-item>
          <v-divider
            v-if="index < event_data.length - 1"
            :key="index"
          ></v-divider>
        </template>
      </v-list-item-group>
    </v-list>
  </v-card>
</template>
<script>
export default {
  name: "YoutubeActivityEvent",
  props: ["event_data"],
  mounted() {
    console.log(this);
  },
};
</script>