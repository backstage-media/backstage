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
              <v-icon class="mr-2">mdi-account-supervisor</v-icon>
              Gestor de contenido
            </v-chip>
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-divider></v-divider>
    <v-list nav dense>
      <v-list-item link href="/creators/assigned">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-account-group</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Tus Creadores</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/plans">
        <v-list-item-icon>
          <v-icon class="mr-4">mdi-currency-usd</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Planes</v-list-item-title>
      </v-list-item>
      <v-list-item link href="/notifications">
        <v-list-item-icon>
          <v-icon class="mr-4" >mdi-bell</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Notificaciones</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
<script>
export default {
  name: "ManagerSideMenu",
  props: ["user_profile"],
  mounted() {
    console.log(this.name);
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