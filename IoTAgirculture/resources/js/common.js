export default {
  data() {
    return {

    }
  },
  methods: {
      async callApi(method, url, dataObj) {
        try {
          return await axios({
            method: method,
            url: url,
            data: dataObj,
          });
        } catch (e) {
          return e.response;
        }
      },
      info (data, message) {
        this.$Notice.info({
          data: data,
          message: message
        });
      },
      success (data, message) {
        this.$Notice.success({
          data: data,
          message: message
        });
      },
      warning (data, message) {
        this.$Notice.warning({
          data: data,
          message: message
        });
      },
      error (data, message) {
        this.$Notice.error({
          data: data,
          message: message
        });
      }
    }
}
