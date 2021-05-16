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
                                        <b-img v-if="avatar != null" center :src="'data:image/jpeg;base64, ' + this.avatar" class="avatar-image-size-display" fluid alt="Update avatar"></b-img>
                                        <b-img v-else src="https://4xucy2kyby51ggkud2tadg3d-wpengine.netdna-ssl.com/wp-content/uploads/sites/37/2017/02/IAFOR-Blank-Avatar-Image.jpg"></b-img>
                                    </b-col>
                                </b-row>

<!--                                <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>-->


                            </b-form-group>
                            <b-row class="text-center justify-content-center" >

                                <b-col cols="4">
<!--                                    <b-button type="reset" variant="warning">Reset</b-button>-->
                                    <b-button type="button"
                                              variant="primary"
                                              @click="updateInfo"

                                    >Update</b-button>
                                </b-col>
                            </b-row>

                        </b-form>


                    </div>
<!--                </div>-->

<!--&lt;!&ndash;                <div>&ndash;&gt;-->
<!--&lt;!&ndash;                    <h4>Update avatar user</h4>&ndash;&gt;-->
<!--&lt;!&ndash;                    <Upload type="drag"&ndash;&gt;-->
<!--&lt;!&ndash;                            :format="['jpg','jpeg','png']"&ndash;&gt;-->
<!--&lt;!&ndash;                            name="image"&ndash;&gt;-->
<!--&lt;!&ndash;                            :max-size="2048"&ndash;&gt;-->
<!--&lt;!&ndash;                            :on-success="handleSuccess"&ndash;&gt;-->
<!--&lt;!&ndash;                            :on-format-error="handleFormatError"&ndash;&gt;-->
<!--&lt;!&ndash;                            :on-error="handleError"&ndash;&gt;-->
<!--&lt;!&ndash;                            :on-exceeded-size="handleMaxSize"&ndash;&gt;-->
<!--&lt;!&ndash;                            :before-upload="handleUpload"&ndash;&gt;-->
<!--&lt;!&ndash;                            :show-upload-list="true"&ndash;&gt;-->
<!--&lt;!&ndash;                            action="api/user/maskFunction">&ndash;&gt;-->

<!--&lt;!&ndash;                        <div class="block-content-upload">&ndash;&gt;-->
<!--&lt;!&ndash;                            <Icon class="icon-upload-color" type="ios-cloud-upload" size="52"></Icon>&ndash;&gt;-->
<!--&lt;!&ndash;                            <p>Click or drag files here to upload</p>&ndash;&gt;-->

<!--&lt;!&ndash;                        </div>&ndash;&gt;-->

<!--&lt;!&ndash;                    </Upload>&ndash;&gt;-->
<!--&lt;!&ndash;                    <div v-if="this.imageUpdate.data != null">&ndash;&gt;-->
<!--&lt;!&ndash;                        <img alt="tmp" :src="'data:image/jpeg;base64, ' + this.imageUpdate.data" />&ndash;&gt;-->
<!--&lt;!&ndash;                    </div>&ndash;&gt;-->
<!--&lt;!&ndash;                    <div v-else-if="this.avatar != null">&ndash;&gt;-->
<!--&lt;!&ndash;                        <img alt="tmp" :src="'data:image/jpeg;base64, ' + this.avatar" />&ndash;&gt;-->
<!--&lt;!&ndash;                    </div>&ndash;&gt;-->

                </div>


            </div>
        </div>
    </div>
</template>

<script>
import globalProperties from "../../../../assets/globalProperties/globalProperties";

export default {
    components: {
        globalProperties
    },

    data () {
        return {
            userId: '',
            name: '',
            email: '',
            phone_number: '',
            avatar: '',
            address: '',
            imageUpdate: {
                name: null,
                res: null,
                data: null
            },
            uploadList: [],
            base64Img: null,
            mainPropsEmptyImage: {
                blank: true,
                blankColor: '#777',
                width: 75,
                height: 75,
                class: 'm1'
            }
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


<style scoped>

</style>
