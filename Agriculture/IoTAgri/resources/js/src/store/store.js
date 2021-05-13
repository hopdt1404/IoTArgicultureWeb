import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import getters from './getters.js'
import state from './state'
import mutations from './mutations'
import actions from "./actions"

import sidebar from './modules/sidebar.js'
import { home } from './modules/home'


import SecureLS from "secure-ls";

const ls = new SecureLS({isCompression: false});

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    sidebar,
    home
  },
  //TODO: to encode local Storage
  plugins: [createPersistedState({
      storage: {
          getItem: key => ls.get(key),
          setItem: (key, value) => ls.set(key, value),
          removeItem: key => ls.remove(key)
      }
  })],
  //  plugins: [createPersistedState()],
  getters,
  mutations,
  state,
  actions,
})
