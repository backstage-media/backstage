<x-app-layout>
    <v-container>
        <v-app>
        <admin-contracts-crud-table :contracts='@json($contracts)'></admin-contracts-crud-table>
        </v-app>
    </v-container>
</x-app-layout>