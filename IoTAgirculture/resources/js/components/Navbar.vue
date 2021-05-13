<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
      <div class="container">
        <router-link :to="{ name: user ? 'home' : 'welcome' }" class="navbar-brand">
          {{ appName }}
        </router-link>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false">
          <span class="navbar-toggler-icon" />
        </button>

        <div id="navbarToggler" class="collapse navbar-collapse">
          <ul class="navbar-nav">
            <div class="navbar-nav-item">
              <li><router-link :to="{name: 'test-page'}" ><a><Icon />Farms</a></router-link></li>
            </div>
            <div>
              <li><router-link :to="{name: 'test-page'}" ><a><Icon />Devices</a></router-link></li>
            </div>


            <li><router-link :to="{name: 'test-page'}" ><a><Icon />Sensors</a></router-link></li>
            <li><router-link :to="{name: 'test-page'}" ><a><Icon />Plant</a></router-link></li>
            <li><router-link :to="{name: 'test-page'}" ><a><Icon />Weather Forecast</a></router-link></li>
          </ul>



          <ul class="navbar-nav ml-auto">
            <!-- Authenticated -->
            <ul class="navbar-nav">
              <locale-dropdown />
              <!-- <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li> -->
            </ul>
            <li v-if="user" class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-dark"
                 href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
              >
                <img :src="user.photo_url" class="rounded-circle profile-photo mr-1">
                {{ user.name }}
              </a>
              <div class="dropdown-menu">
                <router-link :to="{ name: 'settings.profile' }" class="dropdown-item pl-3">
                  <fa icon="cog" fixed-width />
                  {{ $t('settings') }}
                </router-link>

                <div class="dropdown-divider" />
                <a href="#" class="dropdown-item pl-3" @click.prevent="logout">
                  <fa icon="sign-out-alt" fixed-width />
                  {{ $t('logout') }}
                </a>
              </div>
            </li>
            <!-- Guest -->
            <template v-else>
              <li class="nav-item">
                <router-link :to="{ name: 'login' }" class="nav-link" active-class="active">
                  {{ $t('login') }}
                </router-link>
              </li>
              <li class="nav-item">
                <router-link :to="{ name: 'register' }" class="nav-link" active-class="active">
                  {{ $t('register') }}
                </router-link>
              </li>
            </template>
          </ul>
        </div>
      </div>
    </nav>
  </div>

</template>

<script>
import { mapGetters } from 'vuex'
import LocaleDropdown from './LocaleDropdown'

export default {
  components: {
    LocaleDropdown
  },

  data: () => ({
    appName: window.config.appName
  }),

  computed: mapGetters({
    user: 'auth/user'
  }),

  methods: {
    async logout () {
      // Log out the user.
      await this.$store.dispatch('auth/logout')

      // Redirect to login.
      this.$router.push({ name: 'login' })
    }
  }
}
</script>

<style scoped>
.profile-photo {
  width: 2rem;
  height: 2rem;
  margin: -.375rem 0;
}
</style>
