<template>
  <v-navigation-drawer app permanent expand-on-hover>
    <v-list>
      <v-list-item class="px-2">
        <v-list-item-avatar>
          <v-img
            :src="
              youtube_avatar ||
              'https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg'
            "
          ></v-img>
        </v-list-item-avatar>
      </v-list-item>

      <v-list-item link>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            {{ user_profile.real_name }}
          </v-list-item-title>
          <v-list-item-subtitle>{{
            user_profile.description
          }}</v-list-item-subtitle>
          <v-list-item-subtitle>
            <v-chip color="pink" class="pa-1" label text-color="white">
              <v-avatar class="ma-1">
                <img
                  :src="channel_thumbnail"
                  alt="Avatar Channel"
                />
              </v-avatar>
              Managing {{ channel_name }}
            </v-chip>
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-divider></v-divider>

    <v-list nav dense>
      <v-list-item link href="/dashboard">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-home-analytics</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Dashboard</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/content">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-video</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Content</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/manage/exit">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-exit-run</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Exit</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
<script>
export default {
  name: "CreatorManagementSideMenu",
  props: {
    user_profile: {
      type: String,
    },
    channel_name: {
      type: String,
    },
    channel_thumbnail: {
      default: "https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg",
      type: String,
    },
  },
  mounted() {
    console.log("I'm here as menu component");
  },
  data() {
    return {
      drawer: true,
      items: [
        { title: "Home", icon: "mdi-home-city" },
        { title: "My Account", icon: "mdi-account" },
        { title: "Users", icon: "mdi-account-group-outline" },
      ],
      mini: true,
    };
  },
};
</script>