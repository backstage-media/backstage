    <template>
  <v-row justify="center">
    <v-col cols="12" sm="8">
      <v-card>
        <v-list>
          <v-card class="ma-2 pa-2" flat>
            <v-list-item three-line>
              <v-list-item-content>
                <v-list-item-title class="text-h5 mb-1">
                  {{ contract.manager.real_name }}
                </v-list-item-title>
                <v-list-item-subtitle>{{
                  contract.manager.description
                }}</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
            <v-card-actions>
              <v-btn depressed v-on:click="download_contract(contract.id)"
                >Download Invoce</v-btn
              >
              <v-btn
                depressed
                color="error"
                v-if="contract.status"
                v-on:click="cancel_contract(contract.id)"
                >Cancel Subscription
              </v-btn>
              <v-chip
                v-if="contract.status == false"
                class="ma-2"
                color="red"
                text-color="white"
              >
                Subscription cancelled
              </v-chip>
            </v-card-actions>
          </v-card>

          <v-divider inset></v-divider>

          <v-list-item>
            <v-list-item-action>
              <v-icon>mdi-calendar-check</v-icon>
            </v-list-item-action>

            <v-list-item-content>
              <v-list-item-title>{{ contract.start_date }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-divider inset></v-divider>

          <v-list-item>
            <v-list-item-action>
              <v-icon>mdi-calendar-remove</v-icon>
            </v-list-item-action>

            <v-list-item-content>
              <v-list-item-title>{{ contract.end_date }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-divider inset></v-divider>

          <v-list-item>
            <v-list-item-action>
              <v-icon>mdi-autorenew</v-icon>
            </v-list-item-action>

            <v-list-item-content>
              <v-list-item-title>{{
                contract.automatic_renewal
                  ? "Auto-Renewal Enabled"
                  : "Auto-Renewal Disabled"
              }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>

        <v-img src="https://picsum.photos/700?image=0" height="250px"></v-img>
      </v-card>
    </v-col>
  </v-row>
</template>
<script>
export default {
  name: "ContractShow",
  props: ["contract"],
  mounted() {
    //this.agreement.manager = JSON.parse(this.agreement.manager);
    console.log(this);
  },

  methods: {
    download_contract: function (id) {
      window.open("/contract/download/" + id, "_blank").focus();
    },

    cancel_contract: function (id) {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http
        .get("/contract/cancel/" + id, {
          headers: {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
          },
          emulateJSON: true,
          _method: "get",
          _token: token.content,
        })
        .then((res) => res.json())
        .then((res) => {
          
        });
    },
  },
};
</script>
