<x-app-layout>
    <v-container>
        <v-app id="user-wizard">
        <div class="transition-swing text-h4 ma-4">Let's setup your Backstage profile!</div>
        <meta name="csrf-token" content="{{ csrf_token() }}">
            <wizard></wizard>
        </v-app>
    </v-container>
</x-app-layout>