<template>
  <v-simple-table height="300px">
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">Partner Name</th>
          <th class="text-left">Partner Email</th>
          <th class="text-left">Description</th>
          <th class="text-left">Joined on</th>
          <th class="text-left">Condition/Agreement file</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in partners" :key="item.id">
          <td>{{ item.name }}</td>
          <td>{{ item.contact }}</td>
          <td>{{ item.description }}</td>
          <td>{{ item.created_at }}</td>
          <td>
            <v-btn v-on:click="download_file(item.id)">Download Contract</v-btn>
          </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
<script>
export default {
  props: ["partners"],
  methods: {
    get_pdf_file: function (blob_file) {
      var blob = new Blob([blob_file], { type: "application/pdf" });
      const link = document.createElement("a");
      // create a blobURI pointing to our Blob
      link.href = URL.createObjectURL(blob);
      link.download = "test.pdf";
      // some browser needs the anchor to be in the doc
      document.body.append(link);
      link.click();
      link.remove();
      // in case the Blob uses a lot of memory
      setTimeout(() => URL.revokeObjectURL(link.href), 7000);
    },
    download_file: function (id) {
      console.log("ID of the downloaded file");
      console.log(id);
      let token = document.head.querySelector('meta[name="csrf-token"]');

      if (token) {
        window.axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
      } else {
        console.error(
          "CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token"
        );
      }

      var response = this.$http.get("/partners/contract/" + id, {
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        },
        emulateJSON: true,
        _method: "get",
        _token: token.content,
      });
      console.log(response);
    },
  },
};
</script>