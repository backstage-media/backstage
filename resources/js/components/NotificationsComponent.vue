<template>
  <v-card>
    <v-list two-line>
      <v-list-item-group>
        <template v-for="(item, index) in notifications">
          <v-list-item
            link
            v-if="item.from_user.role.user_type_id == 1"
            v-on:click="
              follow_notification(
                item.id,
                item.from_user.role.user_type_id,
                item.notification_type,
                item.target_id,
                item.from_user.role.creator.id
              )
            "
            :key="item.message"
            v-bind:color="type === 'guest' ? '#AB47BC' : '#9C27B0'"
          >
            <template v-slot:default="{ active }">
              <v-list-item-content>
                <v-list-item-title v-text="item.message"></v-list-item-title>

                <!--<v-list-item-subtitle
                  class="text--primary"
                  ><v-chip color="purple text-white">{{item.snippet.type + ' event'}}</v-chip
                ></v-list-item-subtitle>-->

                <v-list-item-subtitle
                  v-text="item.from_user.name"
                ></v-list-item-subtitle>
                <!--<v-list-item-subtitle
                v-text="item.from_user.role.creator.real_name">
                </v-list-item-subtitle>-->
              </v-list-item-content>

              <v-list-item-action>
                <v-list-item-action-text
                  v-text="item.created_at"
                ></v-list-item-action-text>
              </v-list-item-action>
            </template>
          </v-list-item>
          <v-list-item
            link
            v-if="item.from_user.role.user_type_id == 2"
            v-on:click="
              follow_notification(
                item.id,
                item.from_user.role.user_type_id,
                item.notification_type,
                item.target_id
              )
            "
            :key="item.message"
            v-bind:color="type === 'guest' ? '#AB47BC' : '#9C27B0'"
          >
            <template v-slot:default="{ active }">
              <v-list-item-content>
                <v-list-item-title v-text="item.message"></v-list-item-title>

                <!--<v-list-item-subtitle
                  class="text--primary"
                  ><v-chip color="purple text-white">{{item.snippet.type + ' event'}}</v-chip
                ></v-list-item-subtitle>-->

                <v-list-item-subtitle
                  v-text="item.from_user.name"
                ></v-list-item-subtitle>
                <!--<v-list-item-subtitle
                v-text="item.from_user.role.creator.real_name">
                </v-list-item-subtitle>-->
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
    },
    follow_notification: function follow(
      notification_id,
      from_user_type,
      notification_type,
      target_id,
      creator_id = 0
    ) {
      console.log("workiiiing");
      // In case user from is a creator, destination is manager, so we should enable permissions to see the notification.
      if (from_user_type == 1) {
        this.$http.get("/manage/" + creator_id, {
          headers: {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
          },
          emulateJSON: true,
          _method: "get",
        });
        if (notification_type == 1) {
          window.location =
            "/media/" +
            this.get_target_pair(target_id)[0] +
            "?comment=" +
            this.get_target_pair(target_id)[1];
        } else if (notification_type == 2) {
          window.location = "/media/" + target_id;
        }
      }
    },
    mounted() {
      console.log(this);
    },
  },
};
</script>