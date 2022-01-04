<template>
  <v-navigation-drawer app permanent expand-on-hover>
  <v-list>
          <v-list-item class="px-2">
            <v-list-item-avatar>
              <v-img :src="youtube_avatar"></v-img>
            </v-list-item-avatar>
          </v-list-item>

          <v-list-item link>
            <v-list-item-content>
              <v-list-item-title class="text-h6">
                {{youtube_name}}
              </v-list-item-title>
              <v-list-item-subtitle>{{youtube_description}}</v-list-item-subtitle>
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
    props: ['youtube_name','youtube_avatar','youtube_description'],
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