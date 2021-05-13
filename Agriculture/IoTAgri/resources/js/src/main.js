import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store/store'
import './registerServiceWorker'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/en'
import './styles/index.scss'
import Vuesax from 'vuesax'
import VueRouter from 'vue-router'
import 'vuesax/dist/vuesax.css'// Vuesax styles
import 'material-icons/iconfont/material-icons.scss'
// import theme from './themes/default.js' // No funciona

Vue.component('home', require('./views/home/index'));
Vue.component('user', require('./views/user/index'));
Vue.component('app', require('./App'));



Vue.use(Vuesax)
Vue.use(ElementUI, { locale })

import auth from './auth.js';
window.auth = auth;

Vue.use(VueRouter);

const routers = new VueRouter({
    router,
    mode: 'history'
});

// Vue.config.productionTip = false

// new Vue({
//   router,
//   store,
//   render: h => h(App)
// }).$mount('#app')

const app = new Vue({
    el: '#app',
    render: h => h(App),
    routers
});
