<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="comments"
      item-key="text"
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
    </v-data-table>
  </div>
</template>
<script>
  export default {
    props: ["comments"],
    data () {
      return {
        search: '',
        content: '',
        comments: this.comments,
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
            text: 'Message',
            value: 'text',
          },
         {
            text: 'User',
            value: 'user.name',
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