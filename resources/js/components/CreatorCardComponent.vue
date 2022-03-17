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
                src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"
              ></v-img>
            </v-avatar>
            <v-card-title>{{ user_data.creator.real_name }}</v-card-title>
          </v-img>
          <v-card-subtitle class="pb-0">Contract Bundles</v-card-subtitle>

          <v-card-text class="text--primary">
            <p>{{ user_data.start_date }}</p>
            <p>{{ user_data.end_date }}</p>
          </v-card-text>

          <v-card-actions>
            <v-dialog v-model="dialog" persistent max-width="600px">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="accent"
                  dark
                  v-bind="attrs"
                  v-on="on"
                  class="ml-2"
                >
                  Send message
                </v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="text-h5"
                    >Send a message to {{ user_data.creator.real_name }}</span
                  >
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          label="Legal first name*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          label="Legal middle name"
                          hint="example of helper text only on focus"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          label="Legal last name*"
                          hint="example of persistent helper text"
                          persistent-hint
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field label="Email*" required></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          label="Password*"
                          type="password"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6">
                        <v-select
                          :items="['0-17', '18-29', '30-54', '54+']"
                          label="Age*"
                          required
                        ></v-select>
                      </v-col>
                      <v-col cols="12" sm="6">
                        <v-autocomplete
                          :items="[
                            'Skiing',
                            'Ice hockey',
                            'Soccer',
                            'Basketball',
                            'Hockey',
                            'Reading',
                            'Writing',
                            'Coding',
                            'Basejump',
                          ]"
                          label="Interests"
                          multiple
                        ></v-autocomplete>
                      </v-col>
                    </v-row>
                  </v-container>
                  <small>*indicates required field</small>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="dialog = false">
                    Close
                  </v-btn>
                  <v-btn color="blue darken-1" text @click="dialog = false">
                    Save
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <v-btn
              color="accent"
              dark
              v-bind="attrs"
              v-on="on"
              class="ml-2"
              :href="'/manage/' + user_data.creator.id"
            >
              Manage Content
            </v-btn>
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
  },
};
</script>