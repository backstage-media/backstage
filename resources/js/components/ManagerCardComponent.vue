<template>
  <v-container>
        <v-card class="mx-auto" max-width="800px">
          <v-img
            class="white--text align-end"
            height="200px"
            src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
          >
            <v-avatar color="primary" size="123" class="ma-2">
              <v-img
                :src="'https://ui-avatars.com/api/?name='+manager_data.user.name"
              ></v-img>
            </v-avatar>
            <v-card-title>{{ manager_data.user.name }}</v-card-title>
          </v-img>
          <v-card-subtitle class="pb-0">Paquetes de suscripcion</v-card-subtitle>

          <v-card-text class="text--primary">
            <div v-if="manager_data.manager.agreement == 0">
              No hay suscripciones disponibles
            </div>
            <div width="100px">
            <v-list v-for="item in manager_data.manager.agreement" :key="item">
              <v-list-item>
               {{ item.months }} Meses -
                    {{ total(item.months, item.price_per_month) }} $ ({{
                      item.discount
                    }}
                    % Descuento)
                    <v-spacer></v-spacer>
              <v-dialog transition="dialog-top-transition" max-width="600px">
                <template v-slot:activator="{ on, attrs }">
                  <v-icon color="accent" v-bind="attrs" v-on="on"
                    >mdi-cart-arrow-right</v-icon
                  >
                </template>
                <template v-slot:default="dialog">
                  <v-card>
                    <v-card-title class="text-h6">
                      Confirmacion del contrato
                    </v-card-title>
                    <v-card-text
                      >Vas a comenzar un proceso de creacion de contrato con
                      {{ manager_data.user.name }} durante un periodo de
                      {{ item.months }} meses y un precio total de
                      {{
                        total_with_discount(
                          item.months,
                          item.price_per_month,
                          item.discount
                        )
                      }}
                      $</v-card-text
                    >
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn
                        color="green darken-1"
                        text
                        @click="dialog = false"
                      >
                        Cancelar
                      </v-btn>
                      <v-btn
                        color="green darken-1"
                        text
                        :href="'/contract/'+item.id"
                      >
                        Continuar
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </template>
              </v-dialog>
              </v-list-item>
            </v-list>
            </div>
            </div>
          </v-card-text>
          <v-card-actions>
          </v-card-actions>
        </v-card>
  </v-container>
</template>

<script>
export default {
  name: "ManagerUserComponent",

  props: ["manager_data"],
  mounted() {
    console.log(this.manager_data.manager);
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
  },
};
</script>