import axios from 'axios'
import Cookies from 'js-cookie'
import * as types from '../mutation-types'
import config from '../../app.config';

// state
export const state = {

};

// getters
export const getters = {

};

export const mutations = {

};

export const actions = {
  async demoCallAPIBackend({commit, dispatch}, info) {
    try {
      const data = await axios.get('/api/test')
      commit(types.ACTION_SUCCESS, {data: data});
    } catch (e) {
      commit(types.ACTION_ERROR, info);
    }
  }
};
