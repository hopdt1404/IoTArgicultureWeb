<template>
    <div>
        <div class="content">
            <div class="container-fluid">
                <div class="container">
                    <div class="block-header-profile">
                        User profile
                    </div>
                    <div>

                    </div>
                </div>

<!--                <div>-->
<!--                    <h4>Update avatar user</h4>-->
<!--                    <Upload type="drag"-->
<!--                            :format="['jpg','jpeg','png']"-->
<!--                            name="image"-->
<!--                            :max-size="2048"-->
<!--                            :on-success="handleSuccess"-->
<!--                            :on-format-error="handleFormatError"-->
<!--                            :on-error="handleError"-->
<!--                            :on-exceeded-size="handleMaxSize"-->
<!--                            :before-upload="handleUpload"-->
<!--                            :show-upload-list="true"-->
<!--                            action="api/user/maskFunction">-->

<!--                        <div class="block-content-upload">-->
<!--                            <Icon class="icon-upload-color" type="ios-cloud-upload" size="52"></Icon>-->
<!--                            <p>Click or drag files here to upload</p>-->

<!--                        </div>-->

<!--                    </Upload>-->
<!--                    <div v-if="this.imageUpdate.data != null">-->
<!--                        <img alt="tmp" :src="'data:image/jpeg;base64, ' + this.imageUpdate.data" />-->
<!--                    </div>-->
<!--                    <div v-else-if="this.avatar != null">-->
<!--                        <img alt="tmp" :src="'data:image/jpeg;base64, ' + this.avatar" />-->
<!--                    </div>-->

<!--                </div>-->


            </div>
        </div>
    </div>
</template>

<script>
export default {
    data () {
        return {
            name: '',
            email: '',
            phone_number: '',
            avatar: '',
            imageUpdate: {
                name: null,
                res: null,
                data: null
            },
            uploadList: [],
            base64Img: null
        }
    },
    methods: {
        async initData () {
            let params = {
                id: 1
            }
            // Toto: recall action  axios
            let response = await this.callApi('get','user', params);
            if (response.status === 200) {
                let data = response.data.data;
                this.name = data.name;
                this.email = data.email;
                this.phone_number = data.phone_number;
                this.avatar = data.avatar
            } else {
                this.error(response.statusText);
            }
        },

        async upload (event) {
            this.loadingStatus = true;
            console.log('file ' + this.file)
            let params = {
                image: this.file,
                id: 1
            }
            let response = await this.callApi('post','user/updateImageProfile', params);
            if (response.status === 200) {
                this.file = null;
                this.loadingStatus = false;
                this.success(response.statusText);
            } else {
                this.error(response.statusText);
            }

        },
        handleSuccess (res, file) {
            this.file.res = res;
            this.file.name = file;

            console.log('file handleSuccess', file)
            console.log('res handleSuccess', res)
        },

        handleError(res, file) {
            console.log('res', res)
            console.log('file', file)
        },
        handleFormatError (file) {
            this.warning( 'The file format is incorrect',
                'File format of ' + file.name + ' is incorrect, please select jpg or png.');
        },
        handleMaxSize (file) {
            this.warning('Exceeding file size limit',
                'File  ' + file.name + ' is too large, no more than 2M.');
        },
        handleUpload (file) {
            let reader = new FileReader();
            // reader.onloadend = function() {
            //     console.log('RESULT', reader.result)
            //
            // }
            // let temp = reader.readAsDataURL(file);
            // this.imageUpdate.data = reader.result
        },



    },
    mounted () {
        // this.uploadList = this.$refs.upload.fileList;
    },
    created() {
        this.initData();
    }

}
</script>
