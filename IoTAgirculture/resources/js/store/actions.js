
const actions = {
  getTask({commit}) {
    commit('getTask')
  },
  addTask({commit}) {
    commit('addTask')
  },
  editTask({commit}, task) {
    commit('editTask', task)
  },
  removeTask({commit}, task) {
    commit('removeTask', task)
  },
  completeTask({commit}, task) {
    commit('completeTask', task)
  },
  clearTask({commit}) {
    commit('clearTask')
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

};

export default actions;
