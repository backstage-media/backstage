<template>
  <v-card class="mx-auto" max-width="800">
    <v-form action="/plans/create" method="post">
      <input type="hidden" name="_token" :value="csrf" />
      <v-list-item two-line>
        <v-list-item-content>
          <v-list-item-title class="text-h5">
            Añadir nueva suscripcion
          </v-list-item-title>
          <v-list-item-subtitle
            >Suscripciones disponibles para creadores de contenido:</v-list-item-subtitle
          >
        </v-list-item-content>
      </v-list-item>
      <v-list>
        <v-list-item>
          <v-select
            :items="items"
            label="Periodo de suscripcion (Meses)"
            name="plan-months"
            id="plan-months"
            v-model="selected"
          ></v-select>
        </v-list-item>
        <v-list-item>
          <v-slider
            name="plan-price"
            v-model="plan_price"
            :max="price_max"
            :min="price_min"
            label="Precio por mes"
            thumb-label="always"
            id="plan-price"
          >
            <template v-slot:append>
              <v-text-field
                v-model="plan_price"
                class="mt-0 pt-0"
                hide-details
                single-line
                type="number"
                style="width: 60px"
                id="plan-price"
                name="plan-price"
              ></v-text-field>
            </template>
          </v-slider>
        </v-list-item>
        <v-list-item>
        <v-slider
          name="plan-discount"
          v-model="plan_discount"
          :rules="rules"
          label="Descuento"
          step="10"
          thumb-label="Apply discount to your plan"
          ticks
        >
          <template v-slot:append>
            <v-text-field
              v-model="plan_discount"
              class="mt-0 pt-0"
              hide-details
              single-line
              type="number"
              style="width: 60px"
              id="plan-discount"
              name="plan-discount"
            ></v-text-field>
          </template>
        </v-slider>
        </v-list-item>      
        <v-list-item-action>
      <v-btn type="submit" color="primary">Crear suscripcion</v-btn>
        </v-list-item-action>
      </v-list>
    </v-form>
  </v-card>
</template>
<script>
export default {
  data() {
    return {
      selected: "1",
      items: ["1", "3", "6", "12"],
      price_min: 20,
      price_max: 149,
      plan_price: 70,
      plan_discount: 30,
      rules: [(v) => v <= 70 || "Max Allowed 70% Discount"],
      csrf: document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content"),
    };
  },
};
</script>