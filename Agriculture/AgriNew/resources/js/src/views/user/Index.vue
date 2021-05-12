<template>
    <div>
        <div class="content">
            <div class="container-fluid">
<!--                 All content-->
                <div>

                </div>

<!--                upload file (image,textFile,... )-->
                <div>
                    <h4>Single upload</h4>
                    <Upload type="drag"
                            :format="['jpg','jpeg','png']"
                            name="image"
                            :max-size="2048"
                            :on-success="handleSuccess"
                            :on-format-error="handleFormatError"
                            :on-exceeded-size="handleMaxSize"
                            action="api/user/updateImageProfile">

                        <div class="block-content-upload">
                            <Icon class="icon-upload-color" type="ios-cloud-upload" size="52"></Icon>
                            <p>Click or drag files here to upload</p>

                        </div>

                    </Upload>
                    <div v-if="file !== null">
                        Upload file: {{ file.name }}
                        <Button type="text" @click="upload">Uploading</Button>
<!--                        <Button type="text" @click="upload" :loading="loadingStatus">{{ loadingStatus ? 'Uploading' : 'Click to upload' }}</Button>-->
                    </div>

                </div>
                <div>
                    <h4>Multiple upload research later</h4>
<!--                    <Upload type="drag"-->
<!--                            ref="upload"-->
<!--                            multiple-->
<!--                            :before-upload="handleUploadMultiple"-->
<!--                            action="upload">-->

<!--                        <div class="block-content-upload">-->
<!--                            <Icon class="icon-upload-color" type="ios-cloud-upload" size="52"></Icon>-->
<!--                            <p>Click or drag files here to upload</p>-->

<!--                        </div>-->

<!--                    </Upload>-->
<!--                    <div v-if="uploadList != null">-->
<!--                        Upload multi file: {{ }}-->

<!--                    </div>-->
                </div>

            </div>
        </div>
    </div>
</template>

<script>
export default {
    data () {
        return {
            file: null,
        }
    },
    methods: {

        // async upload (event) {
        //     this.loadingStatus = true;
        //     console.log('file ' + this.file)
        //     let params = {
        //         image: this.file,
        //         id: 1
        //     }
        //     let response = await this.callApi('post','user/updateImageProfile', params);
        //     if (response.status === 200) {
        //         this.file = null;
        //         this.loadingStatus = false;
        //         this.success(response.statusText);
        //     } else {
        //         this.error(response.statusText);
        //     }
        //
        // },
        handleSuccess (res, file) {
            this.file = {};
            this.file.res = res;
            this.file.name = file;
        },
        handleFormatError (file) {
            this.warning( 'The file format is incorrect',
                'File format of ' + file.name + ' is incorrect, please select jpg or png.');
        },
        handleMaxSize (file) {
            this.warning('Exceeding file size limit',
                'File  ' + file.name + ' is too large, no more than 2M.');
        },


    },
    mounted () {

    }

}
</script>
