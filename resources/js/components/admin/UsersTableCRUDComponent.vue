<template>
  <v-data-table
    :headers="headers"
    :items="users"
    sort-by="id"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Administracion de Usuarios</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              Nuevo Usuario
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                  <p v-if="errors.length">
    <b>Revisa los siguientes errores:</b>
    <ul>
      <li v-for="error in errors" v-bind="error">{{ error }}</li>
    </ul>
  </p>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="editedItem.name"
                      label="Nombre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="20" sm="12" md="8">
                    <v-text-field
                      v-model="editedItem.email"
                      label="Email"
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="auto">
                    <v-text-field
                      type="password"
                      v-model="password"
                      label="Contraseña"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">
                Cancelar
              </v-btn>
              <v-btn color="blue darken-1" text @click="save"> Guardar </v-btn>
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
                >Cancelar</v-btn
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
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize"> Reset </v-btn>
    </template>
  </v-data-table>
</template>
<script>
export default {
  props: ["users"],
  data: () => ({
    errors: [],
    validated: true,
    token: "{{ csrf_token() }}",
    dialog: false,
    dialogDelete: false,
    roles: ["Creador", "Gestor"],
    headers: [
      {
        text: "ID",
        align: "start",
        sortable: true,
        value: "id",
      },
      { text: "Nombre", value: "name" },
      { text: "Email", value: "email" },
      { text: "Creado En", value: "created_at" },
      { text: "Actualizado En", value: "updated_at" },
      { text: "Contraseña", value: "password" },
      {
        text: "Tipo de Rol",
        value: "role.user_type.type_name",
        sortable: false,
      },
      { text: "Acciones", value: "actions", sortable: false },
    ],
    users: [],
    editedIndex: -1,
    editedItem: {
      name: "",
      password: "",
      email: "",
      confirm_password: "",
      carbs: 0,
      protein: 0,
    },
    defaultItem: {
      name: "",
      email: "",
      password: "",
      carbs: 0,
      protein: 0,
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Crear Registro" : "Editar Registro";
    },
    console: () => console,
    window: () => window,
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
    create_data: function (item) {
      this.validated = true;
      this.errors = [];
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      if (item.name.length < 4) {
        this.errors.push("El usuario debe tener al menos 4 caracteres");
        this.validated = false;
      }

      if (item.email.length < 4) {
        this.errors.push("El email debe tener al menos 4 caracteres");
        this.validated = false;
      }

      if (this.password.length < 8) {
        this.errors.push("El password debe tener al menos 8 caracteres");
        this.validated = false;
      }

      if (this.validated) {
        this.$http
          .post("/admin/users/add", {
            headers: {
              "Content-Type": "application/json",
              "X-Requested-With": "XMLHttpRequest",
            },
            _method: "post",
            _token: token.content,
            name: item.name,
            email: item.email,
            password: this.password,
          })
          .then((res) => {
            window.reload;
          });
      }
    },
    update_data: function (item) {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http
        .post("/admin/users/edit", {
          headers: {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
          },
          emulateJSON: true,
          _method: "post",
          _token: token.content,
          user_id: item.id,
          name: item.name,
          email: item.email,
        })
        .then((res) => res.json())
        .then((res) => {
          window.reload;
        });
    },

    delete_data: function (item) {
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http.post("/admin/users/delete", {
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        },
        emulateJSON: true,
        _method: "post",
        _token: token.content,
        user_id: item.id,
      });
    },

    initialize() {
      this.users = this.users;
    },

    editItem(item) {
      this.editedIndex = this.users.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.users.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    deleteItemConfirm() {
      this.delete_data(this.editedItem);
      this.users.splice(this.editedIndex, 1);
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
      location.reload();
    },

    save() {
      if (this.editedIndex > -1) {
        Object.assign(this.users[this.editedIndex], this.editedItem);
        this.update_data(this.editedItem);
      } else {
        this.users.push(this.editedItem);
        this.create_data(this.editedItem);
      }
      if (this.validated) {
        this.close();
      }
    },
  },
};
</script>