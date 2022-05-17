<template>
  <v-container>
    <v-row>
      <v-col col="12">
        <v-card class="mx-auto" max-width="400">
          <v-img
            class="white--text align-end"
            height="200px"
            src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
          >
            <v-avatar color="primary" size="123" class="ma-2">
              <v-img
                :src="
                  'https://ui-avatars.com/api/?name=' +
                  user_data.creator.real_name
                "
              ></v-img>
            </v-avatar>
            <v-card-title>{{ user_data.creator.real_name }}</v-card-title>
          </v-img>
          <v-card-subtitle class="pb-0">Suscripcion Activa:</v-card-subtitle>

          <v-card-text class="text--primary">
            <p>{{ user_data.start_date }}</p>
            <p>{{ user_data.end_date }}</p>
          </v-card-text>

          <v-card-actions>
            <v-btn
              color="accent"
              dark
              v-bind="attrs"
              v-on="on"
              class="ml-2"
              :href="'/manage/' + user_data.creator.id"
            >
              Administrar Contenido
            </v-btn>
            <v-btn depressed v-on:click="download_contract(user_data.id)"
              >Contrato
              <v-icon color="accent">mdi-download-outline</v-icon></v-btn
            >
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "CreatorUserComponent",

  props: ["user_data"],
  mounted() {
    console.log(this);
  },
  data: () => ({
    dialog: false,
  }),
  methods: {
    total: function (months, price) {
      var total_price = parseInt(months) * parseInt(price);
      return total_price;
    },
    total_with_discount: function (months, price, discount) {
      var final_discount = 0;
      var total_price = 0;
      var total_price = parseInt(months) * parseInt(price);
      if (discount > 0) {
        final_discount = discount / 100;
        total_price = total_price - total_price * final_discount;
      }
      return total_price;
    },
    download_contract: function (id) {
      console.log(id);
      window.open("/contract/download/" + id, "_blank").focus();
    },
  },
};
</script>