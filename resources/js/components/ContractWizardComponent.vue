<template>
  <v-stepper v-model="e1">
    <v-stepper-header>
      <v-stepper-step :complete="e1 > 1" step="1">
        Confirm Manager
      </v-stepper-step>
      <v-divider></v-divider>
      <v-stepper-step :complete="e1 > 2" step="2">
        Plan details
      </v-stepper-step>
      <v-divider></v-divider>
      <v-stepper-step step="3"> Name of step 3 </v-stepper-step>
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
          <v-img
            height="250"
            src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
          ></v-img>
          <v-card-title>{{ agreement[0].manager.real_name }}</v-card-title>
          <v-card-text>
            <v-row align="center">
              <div class="grey--text">
                <v-icon>mdi-heart</v-icon>
                {{ agreement[0].manager.likes }}
              </div>
            </v-row>
            <div class="my-4 text-subtitle-1">
              Member since {{ agreement[0].manager.created_at }}
            </div>
            <div>
              {{ agreement[0].manager.description }}
            </div>
          </v-card-text>
        </v-card>
        <v-btn color="primary" @click="e1 = 2"> Continue </v-btn>
        <v-btn text> Cancel </v-btn>
      </v-stepper-content>
      <v-stepper-content step="2">
        <v-card class="mx-auto my-12" max-width="374">
          <v-card-title>{{ agreement[0].months }} Months plan</v-card-title>
          <v-card-text> suscription start: {{ current_date() }} </v-card-text>
          <v-card-text>
            suscription end: {{ suscription_end(agreement[0].months) }}
          </v-card-text>
          <v-card-title
            >Total cost
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
        <v-btn color="primary" @click="e1 = 3"> Continue </v-btn>
        <v-btn text> Cancel </v-btn>
      </v-stepper-content>
      <v-stepper-content step="3">
        <v-card class="mb-12" color="grey lighten-1" height="200px"></v-card>
        <v-btn color="primary" @click="e1 = 1" v-on:click="submit()">
          Accept Contract
        </v-btn>
        <v-btn text> Cancel </v-btn>
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
        start_date: year + "-" + month+ "-" + day + " " + hours + ":" + minutes + ":" + seconds,
        end_date: year + "-" + (month + this.agreement[0].months)+ "-" + day + " " + hours + ":" + minutes + ":" + seconds,
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