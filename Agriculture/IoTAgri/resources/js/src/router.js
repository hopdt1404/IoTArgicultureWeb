import Vue from 'vue'
import Router from 'vue-router'
import Layout from './views/layout/index.vue'
import Home from './views/home/index'

Vue.use(Router)

const routes = [
  {
    path: '/',
    name: '',
    component: Layout,
    children: [
      {
        path: '',
        name: 'home',
        component: Home
      }
    ]
  },
  {
    path: '/about',
    name: '',
    component: Layout,
    children: [
      {
        path: '',
        name: 'about',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
      }
    ]
  }
];

export default new Router({
  // mode: 'history',
  // base: 'app',
  routes: routes
});
