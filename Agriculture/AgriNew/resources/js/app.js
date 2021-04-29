require('./bootstrap');

window.Vue = require('vue')

import router from './router'

Vue.component('app', require('./App').default)

const app = new Vue({
    el: '#app',
    router
})
