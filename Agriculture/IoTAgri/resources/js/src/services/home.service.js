import config from "../app.config";
import Axios from "axios";
import store from '../store/store';

export var homeService;
export default (homeService = {
  getListFavorite
})

function getListFavorite(mypage_id) {
  return Axios.get(`${config.BASE_API_URL}/favorite?mypage_id=${mypage_id}`)
    .then(response => {
      return Promise.resolve(response.data);
    })
    .catch(error => {
      error = error.response;
      const message = (error && error.data && error.data.message) || error.statusText;
      return Promise.reject(message);
    });
}
