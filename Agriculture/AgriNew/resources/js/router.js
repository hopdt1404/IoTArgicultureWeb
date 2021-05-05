import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Layout from './src/components/layouts/main'
import Home from './src/views/home/index'
import User from './src/views/user/index'
import Farm from './src/views/farm/index'
import Device from './src/views/device/index'
import Plant from './src/views/plant/index'
import SettingAgriculture from './src/views/setting_agriculture/index'
import Methods from './src/components/methods/index'
import Hooks from './src/components/hooks/index'

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
