<template>
  <v-data-table
    :headers="headers"
    :items="contracts"
    sort-by="id"
    class="elevation-1 ma-2"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Administracion de Contratos</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on, attrs }"> </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.name"
                      label="Name"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="20" sm="12" md="8">
                    <v-text-field
                      v-model="editedItem.email"
                      label="Email"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
              <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5"
              >¿Estas seguro de eliminar el elemento?</v-card-title
            >
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete"
                >Cancel</v-btn
              >
              <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                >OK</v-btn
              >
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.automatic_renewal="{ item }">
      <v-chip :color="getColor(item.automatic_renewal)" dark>
        {{ isAvailable(item.automatic_renewal) }}
      </v-chip>
    </template>
    <template v-slot:item.status="{ item }">
      <v-chip :color="getColor(item.status)" dark>
        {{ isAvailable(item.status) }}
      </v-chip>
    </template>
    <template v-slot:item.contract_actions="{ item }">
      <v-icon small class="mr-2" @click="cancel_contract(item.id)">
        mdi-cancel
      </v-icon>
      <v-icon small class="mr-2" @click="download_contract(item.id)">
        mdi-file-download
      </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>
<script>
export default {
  props: ["contracts"],
  data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        text: "ID",
        align: "start",
        sortable: true,
        value: "id",
      },
      { text: "Creado en", value: "created_at" },
      { text: "Manager", value: "manager.real_name" },
      { text: "Creador", value: "creator.real_name" },
      { text: "Duracion del acuerdo (meses)", value: "agreement.months" },
      { text: "Precio del Acuerdo (€)", value: "agreement.price_per_month" },
      { text: "Fecha inicio del contrato", value: "start_date" },
      { text: "Fecha final del contrato", value: "end_date" },
      { text: "Renovacion automatica", value: "automatic_renewal" },
      { text: "Estado del contrato", value: "status" },
      { text: "Acciones", value: "contract_actions", sortable: false },
    ],
    contracts: [],
    editedIndex: -1,
    editedItem: {
      name: "",
      calories: 0,
      fat: 0,
      carbs: 0,
      protein: 0,
    },
    defaultItem: {
      name: "",
      calories: 0,
      fat: 0,
      carbs: 0,
      protein: 0,
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
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
          _method: "get",
          _token: token.content,
        })
        .then((res) => {
          location.reload();
        });
    },
    getColor(available) {
      if (available == 1) return "green";
      else if (available == 0) return "red";
      else return "green";
    },

    isAvailable(item) {
      if (item == 1) return "Enabled";
      else return "Disabled";
    },
    initialize() {
      this.contracts = this.contracts;
    },

    editItem(item) {
      this.editedIndex = this.contracts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.contracts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.contracts.splice(this.editedIndex, 1);
      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.contracts[this.editedIndex], this.editedItem);
      } else {
        this.contracts.push(this.editedItem);
      }
      this.close();
    },
  },
};
</script>