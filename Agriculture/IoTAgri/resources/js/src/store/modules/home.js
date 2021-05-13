import homeService from "../../services/home.service";

const state = { };

const actions = {
  getListFavorite({ dispatch, commit }, mypage_id) {
    return homeService.getListFavorite(mypage_id).then(
      response => {
        commit('updateListFavorite', response.data)
        return Promise.resolve(response.data);
      },
      error => {
        dispatch("alertError", error, { root: true });
        return Promise.reject(false);
      }
    );
  },
};

const mutations = {
  updateListFavorite(state, value) {
    state.listFavorite = value;
  },
};

export const home = {
  state,
  actions,
  mutations
};
