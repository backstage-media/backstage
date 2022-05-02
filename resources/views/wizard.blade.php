<x-app-layout>
    <v-container>
        <v-app id="user-wizard">
        <div class="transition-swing text-h4 ma-4">Vamos a configurar tu perfil en Backstage!</div>
        <meta name="csrf-token" content="{{ csrf_token() }}">
            <wizard></wizard>
        </v-app>
    </v-container>
</x-app-layout>