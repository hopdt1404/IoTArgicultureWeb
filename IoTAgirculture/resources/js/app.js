require('./bootstrap');
import Vue from 'vue'
import store from '~/store'
import router from '~/router'
import i18n from '~/plugins/i18n'
import App from '~/components/App'
import ViewUI from 'view-design';
import 'view-design/dist/styles/iview.css';
import VueRouter from 'vue-router';
import common from './common';

Vue.mixin(common);

Vue.use(VueRouter);
Vue.use(ViewUI);
import '~/plugins'
import '~/components'



Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  i18n,
  store,
  router,
  ...App
})
