<x-app-layout>
  <v-container>
    <v-app id="manager-cards">
      @foreach ($managers as $item)
      <manager-card :manager_data='@json($item)' class="ma-5"></manager-card>
      @endforeach
    </v-app>
  </v-container>
</x-app-layout>