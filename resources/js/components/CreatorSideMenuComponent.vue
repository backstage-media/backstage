<template>
  <v-navigation-drawer app permanent expand-on-hover>
    <v-list>
      <v-list two-line v-if="youtube_name">
        <v-list-item class="px-2">
          <v-list-item-avatar>
            <v-img
              :src="
                youtube_avatar ||
                'https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg'
              "
            ></v-img>
          </v-list-item-avatar>
          <v-list-item-title v-if="youtube_name" class="text-h6">
            {{ youtube_name }}
          </v-list-item-title>
        </v-list-item>
      </v-list>
      <v-list-item link>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            {{ user_profile.real_name }}
          </v-list-item-title>
          <v-list-item-subtitle>
            <v-chip color="pink" class="pa-1" label text-color="white">
              <v-icon class="mr-2">mdi-account-circle</v-icon>
              Content Creator
            </v-chip>
          </v-list-item-subtitle>
          <v-list-item-subtitle v-if="youtube_name">
            <v-icon>mdi-youtube</v-icon> Youtube Connected
          </v-list-item-subtitle>
          <v-list-item-subtitle v-if="!youtube_name">
            Youtube Account not connected
          </v-list-item-subtitle>
          <v-list-item-subtitle v-if="!youtube_name">
            <v-icon link href="/login/google">mdi-youtube</v-icon> <a href="/login/google">click</a> to connect
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
        <v-list-item-title>Activity</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/content">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-video</v-icon>
        </v-list-item-icon>
        <v-list-item-title>My Content</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/notifications">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-bell</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Notifications</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/managers">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-account-supervisor</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Find Content Managers</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/contract">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-file-sign</v-icon>
        </v-list-item-icon>
        <v-list-item-title>My Contract</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
<script>
export default {
  name: "SideMenu",
  props: {
    youtube_name: {
      default: "Guest User",
      type: String,
    },
    youtube_avatar: {
      default: "https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg",
      type: String,
    },
    youtube_description: {
      default:
        "Guest Account, link to Youtube <a href='http://localhost/login/google'/>here</a>",
      type: String,
    },
    user_profile: {
      type: Array,
    },
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