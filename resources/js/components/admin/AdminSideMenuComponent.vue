<template>
  <v-navigation-drawer app permanent expand-on-hover>
    <v-list>
      <v-list-item link>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            {{ admin_profile.name }}
          </v-list-item-title>
          <v-list-item-subtitle>{{ admin_profile.email }}</v-list-item-subtitle>
          <v-list-item-subtitle>
            <v-chip color="pink" class="pa-1" label text-color="white">
              <v-icon class="mr-2">mdi-hammer-screwdriver</v-icon>
              Administrator
            </v-chip>
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list>
    <v-divider></v-divider>
    <v-list nav dense>
      <v-list-item link href="/admin/users">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-account-group</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Users</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/admin/profiles">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-script-text</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Profiles</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/admin/contracts">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-currency-usd</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Contracts</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/partners">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-handshake</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Partners</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
<script>
export default {
  name: "AdminSideMenu",
  props: ["admin_profile"],
  mounted() {
    console.log(this.name);
  },
};
</script>