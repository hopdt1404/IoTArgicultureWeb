<template>
    <div class="comp-user">
        <div class="content">
            <div class="container-fluid">
                <div class="container">
                    <div class="block-header-profile mb-3">
                        <div class="header-item font-color-black">
                            User profile
                        </div>
                    </div>
                    <div class="block-content-profile">
                        <b-form>
                            <b-form-group
                                id="name"
                                label="User name: *"
                                label-for="input-name"
                            >
                                <b-form-input
                                    id="input-name"
                                    v-model="name"
                                    type="text"
                                    placeholder="Enter user name"
                                    max="128"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="email"
                                label="User email: *"
                                label-for="input-email"
                            >
                                <b-form-input
                                    id="input-email"
                                    v-model="email"
                                    type="email"
                                    placeholder="Enter user email"
                                    max="128"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="phone"
                                label="User phone number:"
                                label-for="input-phone"
                            >
                                <b-form-input
                                    id="input-phone"
                                    v-model="phone_number"
                                    type="text"
                                    max="15"
                                    placeholder="Enter user phone number"
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="address"
                                label="User address:"
                                label-for="input-address"
                            >
                                <b-form-input
                                    id="input-address"
                                    v-model="address"
                                    type="text"
                                    max="255"
                                    placeholder="Enter user address"
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                            id="avatar"
                            label="Avatar: "
                            label-for="avatar"
                            >
                                <b-row class="justify-content-center" >
                                    <b-col cols="4">
                                        <b-img v-if="avatar !== ''" center :src="'data:image/jpeg;base64, ' + this.avatar" class="avatar-image-size-display" fluid alt="Update avatar">
                                        </b-img>
                                        <b-img v-else src="https://4xucy2kyby51ggkud2tadg3d-wpengine.netdna-ssl.com/wp-content/uploads/sites/37/2017/02/IAFOR-Blank-Avatar-Image.jpg"></b-img>

                                    </b-col>

                                </b-row>
                                <b-row class="text-center justify-content-center">
                                    <b-col cols="3">
                                        <Upload
                                            ref="upload"
                                            :headers="{'x-csrf-token' : token, 'X-Requested-With' : 'XMLHttpRequest'}"
                                            name="image"
                                            type="drag"
                                            :format="['jpg','jpeg','png']"
                                            :max-size="2048"
                                            :on-format-error="handleFormatError"
                                            :on-error="handleError"
                                            :on-success="handleSuccess"
                                            :on-exceeded-size="handleMaxSize"
                                            :before-upload="handleBeforeUpload"
                                            :on-remove="deleteProfileImage"
                                            action="api/user/updateImageProfile">

                                            <Button icon="ios-cloud-upload-outline">Upload files</Button>
                                        </Upload>
                                        <div v-if="imageUpdate !== null">File: {{ imageUpdate.name }}</div>
                                    </b-col>
                                </b-row>

                            </b-form-group>
                            <b-row class="text-center justify-content-center" >

                                <b-col cols="4">
                                    <b-button type="button"
                                              variant="primary"
                                              @click="updateInfo"

                                    >Update</b-button>
                                </b-col>
                            </b-row>

                        </b-form>


                    </div>
                </div>


            </div>
        </div>
    </div>
</template>

<script>


export default {

    data () {
        return {
            userId: '',
            name: '',
            email: '',
            phone_number: '',
            avatar: '',
            address: '',
            imageUpdate: null,
            loadingStatus: false,
            uploadList: [],
            base64Img: null,
            modal: false,
            token: '',
        }
    },
    methods: {
        async initData () {
            this.token = window.Laravel.csrfToken;
            let params = {
                id: 1
            }
            // Toto: recall action  axios
            let response = await this.callApi('get','user', params);
            if (response.status === 200) {
                let data = response.data.data;
                this.userId = data.id;
                this.name = data.name;
                this.email = data.email;
                this.phone_number = data.phone_number;
                this.avatar = data.avatar;
                this.address = data.address;
            } else {
                this.error(response.statusText);
            }
        },

        async updateInfo() {
            console.log('updateInfo')

            let params = {
                name: this.name,
                email: this.email,
                phone_number: this.phone_number,
                address: this.address
            }
            let response = await this.callApi('post','user/' + this.userId, params);
            if (response.status === 200) {
                this.file = null;
                this.loadingStatus = false;
                console.log(response);
                this.success(response.data.message);
            } else {
                this.error(response.data.message);
            }
        },

        async upload (event) {
            this.loadingStatus = true;
            console.log('file ' + this.file)
            let params = {
                image: this.imageUpdate,
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
        async handleSuccess (res, file) {
            if (res.success) {
                let params = {
                    hello: 'hello'
                }
                let result = await this.callApi('get', 'user/getAvatar/' + this.userId, params);
                if (result.status === 200) {
                    this.avatar = result.data.data.avatar

                }
            } else {

            }
            // console.log('file handleSuccess', file)
            // console.log('res handleSuccess', res)
        },

        async deleteProfileImage () {
            let result = await this.callApi('post', 'user/deleteAvatar/' + this.userId);
            console.log(result)
            if (result.status === 200) {
                let resultUpdate = await this.callApi('get', 'user/getAvatar/' + this.userId);
                if (resultUpdate.status === 200) {
                    this.avatar = resultUpdate.data.data.avatar
                }
            }
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
        handleBeforeUpload(file) {

            return true;
        }


    },
    mounted () {
        // this.uploadList = this.$refs.upload.fileList;
    },
    created() {
        this.initData();
    }

}
</script>


<style scoped>

</style>
