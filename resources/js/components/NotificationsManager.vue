<template>
  <v-card>
    <v-list two-line>
      <v-list-item-group>
        <template v-for="(item, index) in notifications">
          <v-list-item link
            :href="item.notification_type.id == 1 ? '/media/' + get_target_pair(item.target_id)[0] + '?comment='+get_target_pair(item.target_id)[1] : '/media/' + item.target_id"
            :key="item.message"
            v-bind:color="type === 'guest' ? '#AB47BC' : '#9C27B0'"
          >
            <template v-slot:default="{ active }">
              <v-list-item-content>
                <v-list-item-title
                  v-text="item.message"
                ></v-list-item-title>

                <!--<v-list-item-subtitle
                  class="text--primary"
                  ><v-chip color="purple text-white">{{item.snippet.type + ' event'}}</v-chip
                ></v-list-item-subtitle>-->

                <v-list-item-subtitle
                  v-text="item.from_user.name"
                ></v-list-item-subtitle>
              </v-list-item-content>

              <v-list-item-action>
                <v-list-item-action-text
                  v-text="item.created_at"
                ></v-list-item-action-text>
              </v-list-item-action>
            </template>
          </v-list-item>
          <v-divider
            v-if="index < notifications.length - 1"
            :key="index"
          ></v-divider>
        </template>
      </v-list-item-group>
    </v-list>
  </v-card>
</template>
<script>
export default {
  name: "NotificationsComponent",
  props: ["notifications"],
    methods: {
    get_target_pair: function target_split(target) {
      const values = target.split(":");
      return values;
    }
  },
  mounted() {
    console.log(this);
  },
};
</script>