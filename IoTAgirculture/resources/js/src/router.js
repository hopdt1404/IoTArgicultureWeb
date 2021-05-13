import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)


const router = new Router({
  mode: 'history',
  base: "app",

  routes: [
    // =============================================================================
    // MAIN LAYOUT ROUTES
    // =============================================================================
    {
      path: '',
      component: () => import('/layouts/main/Main.vue')
    },


    // =============================================================================
    // FULL PAGE LAYOUTS
    // =============================================================================
    {
      path: '',
      component: () => import('/layouts/full-page/FullPage.vue'),
      children: [
        // =============================================================================
        // PAGES
        // =============================================================================

        {
          path: '/pages/login',
          name: 'page-login',
          component: () => import('/views/pages/Login.vue')
        },
        {
          path: '/pages/error-404',
          name: 'page-error-404',
          component: () => import('/views/pages/Error404.vue')
        },
      ]

    },

    // Redirect to 404 page, if no match found
    {
      path: '*',
      redirect: '/pages/error-404'
    }

  ]

});

router.beforeEach(async (to, from, next) => {
  document.title = 'IotAgriculture ' + '- ' + to.meta.title;
});

router.afterEach(() => {

});

export default router
