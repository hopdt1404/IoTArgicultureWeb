import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Layout from './src/components/layouts/main'
import Home from './src/views/home/Index'
import User from './src/views/user/Index'
import Farm from './src/views/farm/Index'
import Device from './src/views/device/Index'
import Plant from './src/views/plant/Index'
import SettingAgriculture from './src/views/setting_agriculture/Index'
import Methods from './src/components/methods/index'
import Hooks from './src/components/hooks/index'
import Login from './src/components/auth/Login'

const routes = [
    {
        path: 'login',
        name: 'login',
        component: Login
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
        path : '/device',
        name: 'device',
        component: Device
    },
    {
        path : '/plant',
        name: 'plant',
        component: Plant
    },
    {
        path : '/setting-agriculture',
        name: 'setting-agriculture',
        component: SettingAgriculture
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
