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

              <v-avatar>
                <img
                  src="https://cdn.vuetifyjs.com/images/john.jpg"
                  alt="John"
                />
              </v-avatar>
            </v-list-item>

            <v-card-actions>
              <v-btn outlined rounded text> Send Private Message </v-btn>
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

        <v-img src="https://picsum.photos/700?image=996" height="200px"></v-img>
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
};
</script>
