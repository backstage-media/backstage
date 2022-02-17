<template>
  <v-simple-table height="300px">
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Price
          </th>
          <th class="text-left">
            Months
          </th>
          <th class="text-left">
            Discount
          </th>
          <th class="text-left">
            Total Cost
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
          <td>{{ total(item.months, item.price_per_month,item.discount ) }}</td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
<script>
export default {
   props: ["agreements"],
   methods: {
    total: function (months,price, discount) {
      var total_price = parseInt(months) * parseInt(price);
      if(discount > 0){
        final_discount = (total_price * 100) / discount;
        total_price = total_price - final_discount;
      }
      return total_price;
    },
  }
};
</script>