<template>
    <div>
        <div class="content">
            <div class="container-fluid">
                Page farm inside App.vue
            </div>

        <!--    Farm Modal        -->
            <Button type="primary" @click="modal = true">Display dialog box</Button>
            <div>
                <Modal
                    v-model="modal"
                    title="Farm infomation"
                    ok-text="Ok"
                    @on-ok="save()"
                    cancel-text="Cancel"
                    >
                    <div class="dialog-content">
                        <div class="dialog-item">
                            <b-row>
                                <b-col cols="12">
                                    <lable class="input-title" for="name">Name</lable>
                                </b-col>
                                <b-col cols="12">
                                    <Input id="name" v-model="farmName" placeholder="Enter something..." style="width: 100%" />
                                </b-col>
                            </b-row>
                        </div>
                        <div>
                            <b-row>
                                <b-col cols="12">Name</b-col>
                                <b-col cols="12">
                                    <Input v-model="farmName" placeholder="Enter something..." style="width: 100%" />
                                </b-col>
                            </b-row>
                        </div>

                    </div>


                </Modal>
            </div>
        </div>

    </div>
</template>


<script>
export default {

    data() {
        return {
            modal: false,
            farmName: '',
            area: '',
            status: '',
            farm_type_id: ''
        }
    },
     created() {

    },
    methods: {
        async save() {
            let params = {
                hello: 'stringHello',
                number: 3,
                floatValue: 3.1
            }
            console.log("hello")
            let response = await this.callApi('post','farm', params);
            console.log(response);
            if (response.status === 200) {
                this.success(response.statusText);
                /* Three action return message ok*/
                // this.error(response.statusText);
                // this.warning(response.statusText);
                // this.info(response.statusText);
            } else {
                this.error(response.statusText);
            }
        }
    },
}
</script>
