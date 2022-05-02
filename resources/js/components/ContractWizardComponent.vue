<template>
  <v-stepper v-model="e1">
    <v-stepper-header>
      <v-stepper-step :complete="e1 > 1" step="1">
        Confirmar Manager
      </v-stepper-step>
      <v-divider></v-divider>
      <v-stepper-step :complete="e1 > 2" step="2">
        Detalles de la suscripcion
      </v-stepper-step>
      <v-divider></v-divider>
      <v-stepper-step step="3"> Finalizar contrato </v-stepper-step>
    </v-stepper-header>
    <v-stepper-items>
      <v-stepper-content step="1">
        <v-card class="mx-auto my-12" max-width="374">
          <template slot="progress">
            <v-progress-linear
              color="deep-purple"
              height="10"
              indeterminate
            ></v-progress-linear>
          </template>
          <v-card-title>{{ agreement[0].manager.real_name }}</v-card-title>
          <v-card-text>
            <v-row align="center">
              <div class="grey--text">
                <v-icon>mdi-heart</v-icon>
                {{ agreement[0].manager.likes }}
              </div>
            </v-row>
            <div class="my-4 text-subtitle-1">
              Miembro en Backstage desde {{ agreement[0].manager.created_at }}
            </div>
            <div>
              {{ agreement[0].manager.description }}
            </div>
          </v-card-text>
        </v-card>
        <v-btn color="primary" @click="e1 = 2"> Continuar </v-btn>
        <v-btn @click="cancel" text> Cancel </v-btn>
      </v-stepper-content>
      <v-stepper-content step="2">
        <v-card class="mx-auto my-12" max-width="374">
          <v-card-title>Plan de {{ agreement[0].months }} meses</v-card-title>
          <v-card-text> Comienzo suscripcion: {{ current_date() }} </v-card-text>
          <v-card-text>
            Fecha de fin suscripcion: {{ suscription_end(agreement[0].months) }}
          </v-card-text>
          <v-card-title
            >Coste Total
            {{
              total_with_discount(
                agreement[0].months,
                agreement[0].price_per_month,
                agreement[0].discount
              )
            }}
            $</v-card-title
          >
        </v-card>
        <v-btn color="primary" @click="e1 = 3"> Continuar </v-btn>
        <v-btn @click="cancel" text> Cancelar </v-btn>
      </v-stepper-content>
      <v-stepper-content step="3">
        <v-list>
          <v-list-item-title class="text-h4"
            >Cosas que considerar antes de formalizar el contrato:</v-list-item-title
          >
          <v-list-item>
            <mark>{{ agreement[0].manager.real_name }}</mark> tendra acceso a todo tu canal de youtube, ver tus videos, comentar sobre ellos (dentro de backstage) y cambiar la visibilidad del contenido.
          </v-list-item>
          <v-list-item>
            <mark>{{ agreement[0].manager.real_name }} </mark> Puede estar trabajando con otros creadores de contenido, por favor entienda el tiempo que le puede llevar trabajar sobre tu canal.
          </v-list-item>
          <v-list-item>
            <mark>{{ suscription_end(agreement[0].months) }}</mark> es la fecha de fin de contrato.
          </v-list-item>
          <v-list-item-group>
            <v-list-item-action>
              <v-btn color="primary" @click="e1 = 1" v-on:click="submit()">
                Aceptar Contrato
              </v-btn>
            </v-list-item-action>
            <v-list-item-action>
              <v-btn @click="cancel" text> Cancelar </v-btn>
            </v-list-item-action>
          </v-list-item-group>
        </v-list>
      </v-stepper-content>
    </v-stepper-items>
  </v-stepper>
</template>
<script>
export default {
  name: "ContractWizardComponent",
  props: ["agreement"],
  data() {
    return {
      e1: 1,
      start_date: "",
      end_date: "",
      token: "{{ csrf_token() }}",
    };
  },
  mounted() {
    //this.agreement.manager = JSON.parse(this.agreement.manager);
    console.log(this);
  },
  methods: {
    cancel: function () {
      window.location = "/dashboard";
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
    total: function (months, price) {
      var total_price = parseInt(months) * parseInt(price);
      return total_price;
    },
    suscription_end: function (months) {
      const today = new Date();
      const date =
        today.getDate() +
        "-" +
        (today.getMonth() + 1 + months) +
        "-" +
        today.getFullYear();
      this.end_date = date;
      return date;
    },
    current_date: function () {
      const today = new Date();
      const date =
        today.getDate() +
        "-" +
        (today.getMonth() + 1) +
        "-" +
        today.getFullYear();
      this.start_date = date;
      return date;
    },
    submit: function () {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth() + 1;
      var day = today.getDate();
      var hours = today.getHours();
      var minutes = today.getMinutes();
      var seconds = today.getSeconds();

      var response = this.$http.post("/contract/add", {
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        },
        emulateJSON: true,
        _method: "post",
        _token: token.content,
        start_date:
          year +
          "-" +
          month +
          "-" +
          day +
          " " +
          hours +
          ":" +
          minutes +
          ":" +
          seconds,
        end_date:
          year +
          "-" +
          (month + this.agreement[0].months) +
          "-" +
          day +
          " " +
          hours +
          ":" +
          minutes +
          ":" +
          seconds,
        agreement: this.agreement[0],
        manager: this.agreement[0].manager,
        test: 1,
        status: true,
        automatic_renewal: true,
      });
      window.location = "/contract";
    },
  },
};
</script>