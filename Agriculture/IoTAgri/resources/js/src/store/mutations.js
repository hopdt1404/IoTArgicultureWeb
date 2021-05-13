
const mutations = {
  // Updates user info in state and localstorage
  UPDATE_USER_INFO(state, payload) {

    // Get Data localStorage
    let userInfo = JSON.parse(localStorage.getItem("userInfo")) || state.AppActiveUser

    for (const property of Object.keys(payload)) {

      if (payload[property] != null) {
        // If some of user property is null - user default property defined in state.AppActiveUser
        state.AppActiveUser[property] = payload[property]

        // Update key in localStorage
        userInfo[property] = payload[property]
      }


    }
    // Store data in localStorage
    localStorage.setItem("userInfo", JSON.stringify(userInfo))
  },
  UPDATE_LOADING(state, payload) {
    state.loading = payload;
  },
  UPDATE_USE_MULTIPLE_REQ(state, payload) {
    state.useMultipleReq = payload;
  },
  ALERT_SUCCESS(state, payload) {
    state.notification.status = true;
    state.notification.type = "success";
    state.notification.message = payload;
  },
  ALERT_ERROR(state, payload) {
    state.notification.status = true;
    state.notification.type = "danger";
    state.notification.message = payload;
  },
  ALERT_CLEAR(state) {
    state.notification.status = false;
    state.notification.type = null;
    state.notification.message = null;
  }
}
export default mutations
