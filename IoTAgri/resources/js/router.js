import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);

import firstPage from './src/components/pages/NewPageVue';
const routes = [
    {
        path: '/my-new-vue-route',
        // component: () => import('./src/components/pages/NewPageVue'),
        component: firstPage,
    },
];
export default new Router({
    mode: 'history',
    routes
});
