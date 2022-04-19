<x-app-layout>
    <v-container>
        <v-app>
        <admin-profiles-crud-table :users='@json($users)'></admin-profiles-crud-table>
        </v-app>
    </v-container>
</x-app-layout>