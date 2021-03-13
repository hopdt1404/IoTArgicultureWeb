import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);

const routes = [

    {
        path: '/my-new-vue-route',
        component: () => import('./src/components/pages/NewPageVue'),
    },
];
export default new Router({
    mode: 'history',
    routes
});
