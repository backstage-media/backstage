<x-app-layout>
  <v-container>
    <v-app id="contract">
      @if(isset($contract))
      <contract :contract='@json($contract)'></contract>
      @else
      <div>You are not working with any manager, have a look at the different content managers and start working with him</div>
      @endif
    </v-app>
  </v-container>
</x-app-layout>