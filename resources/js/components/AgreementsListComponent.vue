<template>
  <v-simple-table class="ma-4">
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Precio
          </th>
          <th class="text-left">
            Meses
          </th>
          <th class="text-left">
            Descuento
          </th>
          <th class="text-left">
            Coste Total
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="item in agreements"
          :key="item.id"
        >
          <td>{{ item.price_per_month }} $</td>
          <td>{{ item.months }}</td>
          <td>{{ item.discount }}</td>
          <td>{{ total_with_discount(item.months, item.price_per_month,item.discount ) }} $ <del>({{total(item.months,item.price_per_month)}}$)</del></td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
<script>
export default {
   props: ["agreements"],
   methods: {
    total_with_discount: function (months,price,discount) {
      var final_discount = 0;
      var total_price = 0;
      var total_price = parseInt(months) * parseInt(price);
      if(discount > 0){
        final_discount = discount / 100; 
        total_price = total_price - (total_price * final_discount)
      }
      return total_price;
    },
      total: function (months,price) {
      var total_price = parseInt(months) * parseInt(price);
      return total_price;
    },
  }
};
</script>