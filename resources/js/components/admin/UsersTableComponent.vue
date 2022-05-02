<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="users"
      item-key="name"
      class="elevation-1"
      :search="search"
      :custom-filter="filterOnlyCapsText"
    >
      <template v-slot:top>
        <v-text-field
          v-model="search"
          label="Search (UPPER CASE ONLY)"
          class="mx-4"
        ></v-text-field>
      </template>
      <template v-slot:body.append>
        <tr>
          <td></td>
          <td>
            <v-text-field
              v-model="calories"
              type="number"
              label="Less than"
            ></v-text-field>
          </td>
          <td colspan="4"></td>
        </tr>
      </template>
    </v-data-table>
  </div>
</template>
<script>
  export default {
    props: ["users"],
    data () {
      return {
        search: '',
        calories: '',
        users: this.users,
        token: "{{ csrf_token() }}",
      }
    },
    computed: {
      headers () {
        return [
          {
            text: 'id',
            align: 'start',
            sortable: false,
            value: 'id',
          },
          {
            text: 'name',
            value: 'name',
          },
         {
            text: 'email',
            value: 'email',
          },
          { text: 'Created At', value: 'created_at' },
          { text: 'Updated At', value: 'updated_at' }
        ]
      },
    },
    methods: {
      filterOnlyCapsText (value, search, item) {
        return value != null &&
          search != null &&
          typeof value === 'string' &&
          value.toString().toLocaleUpperCase().indexOf(search) !== -1
      },
    },
  }
</script>