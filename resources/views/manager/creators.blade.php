<x-app-layout>
  <v-container>
    <v-app id="manager-cards">
      @foreach ($contracts as $item)
      <creator-card :user_data='@json($item)' class="ma-5"></creator-card>
      @endforeach
    </v-app>
  </v-container>
</x-app-layout>