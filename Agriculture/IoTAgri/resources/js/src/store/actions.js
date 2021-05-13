const actions = {
  // /////////////////////////////////////////////
  // COMPONENTS
  // /////////////////////////////////////////////


  // /////////////////////////////////////////////
  // UI
  // /////////////////////////////////////////////


  // /////////////////////////////////////////////
  // User/Account
  // /////////////////////////////////////////////

  updateUserInfo({ commit }, payload) {
    commit('UPDATE_USER_INFO', payload)
  },

  updateLoading({commit}, payload) {
    commit('UPDATE_LOADING', payload);
  },

  alertSuccess({ commit }, payload) {
    commit("ALERT_SUCCESS", payload);
  },
  alertError({ commit }, payload) {
    commit("ALERT_ERROR", payload);
  },
  alertClear({ commit }, payload) {
    commit("ALERT_CLEAR", payload);
  }
}

export default actions
