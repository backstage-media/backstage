<x-app-layout>
    <v-container>
        <v-app>
        <admin-creators-crud-table :creators='@json($creators)'></admin-creators-crud-table>
        <admin-managers-crud-table :managers='@json($managers)'></admin-managers-crud-table>
        </v-app>
    </v-container>
</x-app-layout>