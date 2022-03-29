<x-app-layout>
    <v-container>
        <v-app>
            <meta name="csrf-token" content="{{ csrf_token() }}">
            <partner-creation></partner-creation>
            <partners-list :partners='@json($partners)'></partners-list>
        </v-app>
    </v-container>
</x-app-layout>