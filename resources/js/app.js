/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

var channelInfo = Vue.component('youtube-channel-info', require('./components/YoutubeChannelInfo.vue').default);
var simpleStats = Vue.component('youtube-simple-stats', require('./components/YoutubeBasicStatsComponent.vue').default);
var sideMenu = Vue.component('user-side-menu', require('./components/SideMenuComponent.vue').default);
var youtubeComponent = Vue.component('youtube-card', require('./components/YoutubeVideoCardComponent.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import vuetify from './vuetify';
import 'vue-lazy-youtube-video/dist/style.css'


const app = new Vue({
    vuetify,
    el: '#app',
    components: {
        'youtube-channel-info': channelInfo,
        'youtube-simple-stats': simpleStats,
        'user-side-menu': sideMenu,
        'youtube-card': youtubeComponent
      },
    icons: {
        iconfont: 'mdi', // 'mdi' || 'mdiSvg' || 'md' || 'fa' || 'fa4' || 'faSvg'
      },
});
