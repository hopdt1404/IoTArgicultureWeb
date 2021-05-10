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
                            :before-upload="handleUpload"
                            action="this_is_action_post image">

                        <div class="block-content-upload">
                            <Icon class="icon-upload-color" type="ios-cloud-upload" size="52"></Icon>
                            <p>Click or drag files here to upload</p>

                        </div>

                    </Upload>
                    <div v-if="file !== null">
                        Upload file: {{ file.name }}
                        <Button type="text" @click="upload" :loading="loadingStatus">{{ loadingStatus ? 'Uploading' : 'Click to upload' }}</Button>
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
            loadingStatus: false,
            uploadList: []
        }
    },
    methods: {
        handleUpload (file) {
            this.file = file;
            return false;
        },
        async upload () {
            this.loadingStatus = true;
            let response = await this.callApi('post','user/' + this.farmId, params);
            setTimeout(() => {
                this.file = null;
                this.loadingStatus = false;
                this.success('Success upload image')
            }, 1500);
        },
        handleUploadMultiple (files) {
            console.log(typeof files)
            console.log(files)
            return false;
        }


    },
    mounted () {

    }

}
</script>
