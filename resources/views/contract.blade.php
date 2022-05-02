<x-app-layout>
  <v-container>
    <v-app id="contract">
      @if(isset($contract))
      <contract :contract='@json($contract)'></contract>
      @else
      <div>No trabajas con ningun gestor de contenido, visita nuestra <a href="/managers">seccion</a> para buscar tu compañero/a en backstage </div>
      @endif
    </v-app>
  </v-container>
</x-app-layout>