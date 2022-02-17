<x-app-layout>
    <v-container>
        <v-app>
            <agreements-form></agreements-form>
            <agreements-list :agreements='@json($agreements)'></agreements-list>
        </v-app>
    </v-container>
</x-app-layout>