<template>
    <div>
        <div class="content">
            <div class="container-fluid">
                <div>
                    <b-row align-h="end">
                        <b-col cols="2" align-self="center">
                            <Button type="primary" @click="modal = true"><Icon type="ios-add" />Add farm</Button>
                        </b-col>

                    </b-row>

                </div>
                Page farm inside App.vue
            </div>

        <!--    Farm Modal        -->

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
                                    <label class="input-title" for="name">Name</label>
                                </b-col>
                                <b-col cols="12">
                                    <Input id="name" v-model="name" placeholder="Enter something..." style="width: 100%" />
                                </b-col>
                            </b-row>
                        </div>
                        <div class="dialog-item">
                            <b-row>
                                <b-col class="" cols="12">
                                    <label class="input-title" for="area">Area</label>
                                </b-col>
                                <b-col cols="12">
                                    <Input id="area" v-model="area" type="number" placeholder="Enter something..." style="width: 100%" />
                                </b-col>
                            </b-row>
                        </div>
                        <div class="dialog-item">
                            <b-row>
                                <b-col class="" cols="12">
                                    <label class="input-title" for="status">Status</label>
                                </b-col>
                                <b-col cols="12">
                                    <RadioGroup id="status" v-model="status">
                                        <Radio label="activate">
                                            <Icon type="logo-apple"></Icon>
                                            <span>Activate</span>
                                        </Radio>
                                        <Radio label="deactivate">
                                            <Icon type="logo-android"></Icon>
                                            <span>Deactivate</span>
                                        </Radio>
                                        <Radio label="maintenance">
                                            <Icon type="logo-windows"></Icon>
                                            <span>Maintain</span>
                                        </Radio>
                                    </RadioGroup>
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
import globalProperties from "../../assets/globalProperties/globalProperties";
export default {
    components: {
        globalProperties
    },

    data() {
        return {
            modal: false,
            name: '',
            area: '',
            status: '',
            farm_type_id: ''
        }
    },
     created() {
         this.getFarms();
    },
    methods: {

        async save() {
            this.getStatus()
            let params = {
                name: this.name,
                area: this.area,
                status: this.status
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
        },
        getStatus () {
            if (this.status === 'activate') {
                this.status = globalProperties.ACTIVATE_STATUS
            } else {
                if (this.status === 'deactivate') {
                    this.status = globalProperties.DEACTIVATE_STATUS
                } else {
                    this.status = globalProperties.MAINTAIN_STATUS
                }
            }
        },
        async getFarms() {
            let response = await this.callApi('get','farm');
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
