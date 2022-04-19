<x-app-layout>
    <v-container>
        <v-app>
        <!--<admin-users-table :users='@json($users)'></admin-users-table>-->
        <admin-users-crud-table :users='@json($users)'></admin-users-crud-table>
        </v-app>
    </v-container>
</x-app-layout>