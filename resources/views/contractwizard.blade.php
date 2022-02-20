<x-app-layout>
    <v-container>
        <v-app id="contract-wizard">
        <div class="transition-swing text-h4 ma-4">You are about to complete the agreement.</div>
        <meta name="csrf-token" content="{{ csrf_token() }}">
            <contract-wizard :agreement='@json($agreement)'></contract-wizard>
        </v-app>
    </v-container>
</x-app-layout>