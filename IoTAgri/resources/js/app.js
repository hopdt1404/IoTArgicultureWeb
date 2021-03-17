require('./bootstrap');

window.Vue = require('vue');
import router from './router';
//
Vue.component('main-app', require('./src/components/MainApp').default);
const app = new Vue({
    el: '#app',
    router
});
