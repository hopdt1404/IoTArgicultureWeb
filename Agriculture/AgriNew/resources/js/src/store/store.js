export default {
    data() {
        return {

        }
    },
    methods: {
        /* method call api  */
        async callApi(method, url, data) {
            try {
                return await axios({
                    method: method,
                    url: 'api/' + url,
                    data: data
                });
            } catch (e) {
                return e.response
            }
        },

        /* notifications return message */
        info (message, title = 'Info notification') {
            this.$Notice.info({
                title: title,
                desc: message ? message : 'Here is the notification description. Here is the notification description. '
            });
        },
        success (message, title = 'Success notification') {
            this.$Notice.success({
                title: title,
                desc: message ? message : 'Here is the notification description. Here is the notification description. '
            });
        },
        warning (message, title = 'Warning notification') {
            this.$Notice.warning({
                title: title,
                desc: message ? message : 'Here is the notification description. Here is the notification description. '
            });
        },
        error (message, title = 'Warning notification') {
            this.$Notice.error({
                title: title,
                desc: message ? message : 'Here is the notification description. Here is the notification description. '
            });
        }
    }
}
