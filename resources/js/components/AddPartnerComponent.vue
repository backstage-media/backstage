<template>
  <v-form
    v-model="valid"
    action="/partner/submit"
    method="post"
    enctype="multipart/form-data"
  >
    <input type="hidden" name="_token" :value="csrf" />
    <v-container>
      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="partner_full_name"
            :counter="20"
            label="Nombre Completo"
            id="partner-name"
            name="partner-name"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-text-field
            v-model="partner_email"
            name="partner-email"
            id="partner-email"
            label="E-mail"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-file-input
            show-size
            label="Contrato Partner"
            id="partner-file"
            name="partner-file"
            accept="application/pdf"
            @change="file_to_blob"
          ></v-file-input>
        </v-col>
        <v-btn type="submit" :disabled="!isFormValid">Crear Partner</v-btn>
      </v-row>
    </v-container>
      <p v-if="errors.length">
    <b>Revisa los siguientes errores:</b>
    <ul>
      <li v-for="error in errors" v-bind="error">{{ error }}</li>
    </ul>
  </p>
  </v-form>
</template>
<script>
export default {
  data() {
    return {
      csrf: document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content"),
      e6: 1,
      partner_full_name: "",
      partner_email: "",
      partner_contract: "",
      errors: [],
      isFormValid: false,
    };
  },
  methods: {
    file_to_blob: function (files) {
      console.log(files);
      this.partner_contract = files;
      if (this.partner_full_name && this.partner_email && this.partner_contract) {
        this.isFormValid = true;
      }
    },
    checkForm: function (e) {
      if (this.partner_full_name && this.partner_email && this.partner_contract) {
        this.isFormValid = true;
        return true;
      }

      this.errors = [];

      if (!this.partner_full_name) {
        this.errors.push("Por favor, añade el nombre del partner");
      }

      if (!this.partner_email) {
        this.errors.push("Por favor, añade el email de contacto del partner");
      }

      if (!this.partner_contract) {
        this.errors.push("Por favor, añade el contrato del partner");
      }

      e.preventDefault();
    },
  },
};
</script>