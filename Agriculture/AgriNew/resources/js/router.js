import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

// import Home from './src/views/home/index'
import Home from './src/components/home/index'
import User from './src/views/user/index'

const routes = [
    {
        path: '/home',
        component: Home,
    },
    {
        path : '/user',
        component: User
    }
]

export default new Router({
    mode: 'history',
    routes
})
