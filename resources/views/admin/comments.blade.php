<x-app-layout>
    <v-container>
        <v-app>
        <admin-comments-table :comments='@json($comments)'></admin-comments-table>
        </v-app>
    </v-container>
</x-app-layout>