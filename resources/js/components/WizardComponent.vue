<template>
<v-form action="/wizard/submit" method="post" @submit="checkForm">
<input type="hidden" name="_token" :value="csrf">
  <v-stepper v-model="e6" vertical>
    <v-stepper-step :complete="e6 > 1" step="1">
      Seleciona un rol
      <small>¿Eres creador o gestor de contenidos?</small>
    </v-stepper-step>

    <v-stepper-content step="1">
      <div class="pa-4">
        <v-radio-group v-model="role" id="user-role" name="user-role">
          <v-radio label="Creador de contenido" value="creator"></v-radio>
          <v-radio label="Gestor de contenido" value="manager"></v-radio>
        </v-radio-group>
      </div>
      <v-btn color="primary" @click="e6 = 2"> Continuar </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 2" step="2">
      Añade una pequeña descripcion sobre ti.
    </v-stepper-step>

    <v-stepper-content step="2">
      <v-textarea
        name="user-description"
        label="Something about you"
        value="I'm here on backstage!"
        v-model="user_description"
        @input="check_desc_value"
      ></v-textarea>
      <v-btn color="primary" @click="e6 = 3" :disabled="!isStepValid"> Continuar </v-btn>
      <v-btn text> Cancelar </v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 3" step="3">
      Finalmente dime tu nombre real (Solo visible por los miembros del contrato)
    </v-stepper-step>

    <v-stepper-content step="3">
           <v-text-field
            label="User Name"
            name="user-name"
            v-model="user_name"
            counter
            @input="check_user_value"
            maxlength="20"
            :rules="[rules.required, rules.counter]"
          ></v-text-field>
      <v-btn type="submit" color="primary" :disabled="!isFormValid"> Arrancamos! </v-btn>
      <v-btn text> Cancel </v-btn>
    </v-stepper-content>
  </v-stepper>
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
      role: 'creator',
      isStepValid: false,
      isFormValid: false,
      errors: [],
      csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      e6: 1,
      user_name: '',
      user_description:'',
      rules: {
        required: value => !!value || 'Requerido.',
        counter: value => value.length <= 30 || 'Maximo 30 caracteres'
      },
    }
  },
  methods:{
    check_desc_value(){
      if(this.user_description.length > 0){
        this.isStepValid = true;
      }
    },
    check_user_value(){
      if(this.user_name.length > 0){
        this.isFormValid = true;
      }
    },
    checkForm: function (e) {


      if (this.user_name && this.user_description) {
        this.isFormValid = true;
        return true;
      }

      this.errors = [];

      if (!this.user_name) {
        this.errors.push('Por favor, añade tu nombre');

      }

      if (!this.user_description) {
        this.errors.push('Por favor, añade tu descripcion');

      }

      e.preventDefault();
    }
  }
};
</script>