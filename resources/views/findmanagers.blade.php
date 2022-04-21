<x-app-layout>
  <v-container>
    <v-app id="manager-cards">
      <v-layout row wrap>
        @forelse($managers as $item)
        <v-flex grow>
          <manager-card :manager_data='@json($item)'></manager-card>
        </v-flex>
        @empty
        <div class="text-h6">Ya tienes un contrato establecido con otro Administrador de contenido, puedes cancelarlo desde la seccion de contrato y cambiar tu Administrador de contenido</div>
        @endforelse
      </v-layout>
    </v-app>
  </v-container>
</x-app-layout>