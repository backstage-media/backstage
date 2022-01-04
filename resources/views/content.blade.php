<x-app-layout>
<v-app>
    <h2>This is the Content view</h2>
<!--
    <template>
  <div class="story-vuetube-container">
    <vue-tube
      videoId="dQw4w9WgXcQ"
      :isPlaylist="false"
      :aspectRatio="1.7777777777777777"
      :enableCookies="false"
      :playerVars="{}"
      :disableWarming="false"
      :disableWebp="false"
      imageAlt="Rick Astley"
      imageLoading="lazy"
      resolution="sddefault"
      buttonLabel="Play video"
      iframeTitle="Rick Astley - Never Gonna Give You Up (Video)"
      iframeAllow="accelerometer;autoplay;encrypted-media;gyroscope;picture-in-picture"
    />
  </div>
</template>
-->
    <?php 
    header('Content-type: text/javascript');
    $json_data = json_encode($latestYoutubeContent, JSON_PRETTY_PRINT);
    echo "<h1>&lt;pre&gt;</h1><br>";
    echo "<pre>" . $json_data . "</pre>";
    ?>
</v-app>
</x-app-layout>