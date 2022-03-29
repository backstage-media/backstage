<x-app-layout>
  <v-container>
    <v-app id="contract">
        <contract :contract='@json($contract)'></contract>
    </v-app>
  </v-container>
</x-app-layout>