<x-app-layout>
   <v-container>
       <agreements-form></agreements-form>
       <agreements-list :agreements='@json($agreements)'></agreements-list>
   </v-container>
</x-app-layout>