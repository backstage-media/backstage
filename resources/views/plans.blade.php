<x-app-layout>
    <v-container>
        <v-app>
            <agreements-form></agreements-form>
            <div class="ma-4">
                <div class="text-h4 text-center">Your available plans</div>
                <agreements-list :agreements='@json($agreements)'></agreements-list>
            </div>
        </v-app>
    </v-container>
</x-app-layout>