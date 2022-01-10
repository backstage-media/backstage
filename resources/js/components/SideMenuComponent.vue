<template>
  <v-navigation-drawer app permanent expand-on-hover>
  <v-list>
          <v-list-item class="px-2">
            <v-list-item-avatar>
              <v-img :src="youtube_avatar || 'https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg'"></v-img>
            </v-list-item-avatar>
          </v-list-item>

          <v-list-item link>
            <v-list-item-content>
              <v-list-item-title class="text-h6">
                {{youtube_name || 'Guest User'}}
              </v-list-item-title>
              <v-list-item-subtitle>{{youtube_description || 'Guest Account, link your account to Youtube'}}</v-list-item-subtitle>
              <v-list-item-subtitle><a href="/login/google" class="text-sm text-gray-700 dark:text-gray-500 underline">Youtube Login</a></v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>

        <v-divider></v-divider>

        <v-list
          nav
          dense
        >
          <v-list-item link href="/dashboard">
            <v-list-item-icon>
              <v-icon>mdi-home-analytics</v-icon>
            </v-list-item-icon>
            <v-list-item-title>My Stats</v-list-item-title>
          </v-list-item>
          <v-list-item link href="/content">
            <v-list-item-icon>
              <v-icon>mdi-video</v-icon>
            </v-list-item-icon>
            <v-list-item-title>My Content</v-list-item-title>
          </v-list-item>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>mdi-bell</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Notifications</v-list-item-title>
          </v-list-item>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>mdi-handshake</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Partners</v-list-item-title>
          </v-list-item>
        </v-list>
  </v-navigation-drawer>
</template>
<script>
  export default {
    name:"SideMenu",
    props: {
    youtube_name: {
      default: "Guest User",
      type: String
    },
    youtube_avatar: {
      default: "https://avatars.dicebear.com/api/pixel-art-neutral/323232.svg",
      type: String
    },
    youtube_description: {
      default: "Guest Account, link to Youtube <a href='http://localhost/login/google'/>here</a>",
      type: String
    }
  },
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Home', icon: 'mdi-home-city' },
          { title: 'My Account', icon: 'mdi-account' },
          { title: 'Users', icon: 'mdi-account-group-outline' },
        ],
        mini: true,
      }
    },
  }
</script>