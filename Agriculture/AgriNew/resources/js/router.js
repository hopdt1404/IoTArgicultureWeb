import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Home from './src/views/home/index'
import User from './src/views/user/index'
import Farm from './src/views/farm/index'

const routes = [
    {
        path: '/home',
        name: 'home',
        component: Home,
    },
    {
        path : '/user',
        name: 'user',
        component: User
    },
    {
        path : '/farm',
        name: 'farm',
        component: Farm
    }
]

export default new Router({
    mode: 'history',
    routes
})
