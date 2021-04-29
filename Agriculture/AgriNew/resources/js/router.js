import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Layout from './src/components/layouts/main'
import Home from './src/views/home/index'
import User from './src/views/user/index'
import Farm from './src/views/farm/index'
import Methods from './src/components/methods/index'
import Hooks from './src/components/hooks/index'

const routes = [
    {
        path: '',
        name: 'layout',
        component: Layout
    },
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
    },
    {
        path : '/hooks',
        name: 'hooks',
        component: Hooks
    },
    {
        path : '/methods',
        name: 'methods',
        component: Methods
    }
]

export default new Router({
    mode: 'history',
    routes
})
