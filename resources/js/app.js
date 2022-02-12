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

var channelInfo = Vue.component('youtube-channel-info', require('./components/youtube/YoutubeChannelInfo.vue').default);
var simpleStats = Vue.component('youtube-simple-stats', require('./components/youtube/YoutubeBasicStatsComponent.vue').default);
var creatorSideMenu = Vue.component('creator-side-menu', require('./components/CreatorSideMenuComponent.vue').default);
var managerSideMenu = Vue.component('manager-side-menu', require('./components/ManagerSideMenuComponent.vue').default);
var youtubeComponent = Vue.component('youtube-card', require('./components/youtube/YoutubeVideoCardComponent.vue').default);
var youtubeChatComponent = Vue.component('youtube-chat', require('./components/youtube/YoutubeChatComponent.vue').default);
var youtubeActivityEventComponent = Vue.component('youtube-chat', require('./components/youtube/YoutubeActivityEventComponent.vue').default);
var youtubeLoginComponent = Vue.component('youtube-login-button', require('./components/youtube/YoutubeLoginButton.vue').default);
var wizard = Vue.component('wizard', require('./components/WizardComponent.vue').default);
var managerCard = Vue.component('manager-card', require('./components/ManagerCardComponent.vue').default);
var agreementsList = Vue.component('agreements-list', require('./components/AgreementsListComponent.vue').default);
var agreementsForm = Vue.component('agreements-form', require('./components/AddAgreementComponent.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import vuetify from './vuetify';
import VueRouter from 'vue-router';
import 'vue-lazy-youtube-video/dist/style.css'

const app = new Vue({
    vuetify,  
    el: '#app',
    router: VueRouter,
    components: {
        'youtube-channel-info': channelInfo,
        'youtube-simple-stats': simpleStats,
        'creator-side-menu': creatorSideMenu,
        'manager-side-menu': managerSideMenu,
        'youtube-card': youtubeComponent,
        'youtube-chat':youtubeChatComponent,
        'youtube-activity-event':youtubeActivityEventComponent,
        'youtube-login-button':youtubeLoginComponent,
        'wizard': wizard,
        'manager-card': managerCard,
        'agreements-list': agreementsList,
        'agreements-form': agreementsForm
      },
    icons: {
        iconfont: 'mdi', // 'mdi' || 'mdiSvg' || 'md' || 'fa' || 'fa4' || 'faSvg'
      },
});
