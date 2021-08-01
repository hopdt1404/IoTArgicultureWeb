export default {
    data() {
        return {

        }
    },
    methods: {
        /* method call api  */
        async callApi(method, url, data, config = null) {
            try {
                if (config == null ) {
                    config = {
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + $('meta[name="csrf-token"]').attr('content')
                        }
                    }
                }
                console.log(config);
                return await axios({
                    method: method,
                    url: 'api/' + url,
                    data: data,
                    config: config,
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
        error (message, title = 'Error notification') {
            this.$Notice.error({
                title: title,
                desc: message ? message : 'Here is the notification description. Here is the notification description. '
            });
        }
    }
}
