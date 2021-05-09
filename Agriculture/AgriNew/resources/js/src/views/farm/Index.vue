<template>
    <div>
        <div class="content">
            <div class="container-fluid">
                <div class="block-btn-add-item">
                    <b-row align-h="end">
                        <b-col cols="2" align-self="center"
                               align-content="end">
                            <Button type="primary" @click="showModal"><Icon type="ios-add" />Add farm</Button>
                        </b-col>

                    </b-row>

                </div>
                <div>
                    <b-table striped hover bordered
                             @row-dblclicked="expandAdditionalInfo"
                             :items="farms"
                             :fields="columnsTable"
                             v-if="farms.length > 0">
                        <template>

                        </template>

                    </b-table>

                </div>

            </div>

        <!--    Farm Modal        -->

            <div>
                <Modal
                    v-model="modal"
                    title="Farm information"
                    ok-text="Ok"
                    @on-ok="save()"
                    cancel-text="Cancel"
                    @on-cancel="cancel()"
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
                                        <Radio label="maintain">
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
            farm_type_id: '',
            farms: '',
            columnsTable: [
                {
                    label: 'Name',
                    key: 'name',
                    sortable: true
                },
                {
                    label: 'Area',
                    key: 'area',
                    sortable: true
                },
                {
                    label: 'Status',
                    key: 'status',
                    sortable: true
                },

            ],
            farmId: '',


            // ]
        }
    },
    created() {
         this.getFarms()
    },
    methods: {

        async save() {
            this.postStatus();
            let response = '';
            let params = {
                name: this.name,
                area: this.area,
                status: this.status
            };
            if (this.farmId) {
                response = await this.callApi('put','farm/' + this.farmId, params);
            } else {
                response = await this.callApi('post','farm', params);
            }
            if (response.status === 200) {
                this.success(response.statusText);
                await this.getFarms();
            } else {
                this.error(response.statusText);
            }
        },
        showModal() {
            this.resetModal()
            this.modal = !this.modal
        },
        cancel() {
            this.resetModal();
        },
        resetModal() {
            this.farmId = '';
            this.status = '';
            this.name = '';
            this.area = '';
        },
        postStatus () {
            if (this.status === globalProperties.ACTIVATE_STATUS.value) {
                this.status = globalProperties.ACTIVATE_STATUS.key
            } else {
                if (this.status === globalProperties.DEACTIVATE_STATUS.value) {
                    this.status = globalProperties.DEACTIVATE_STATUS.key
                } else {
                    this.status = globalProperties.MAINTAIN_STATUS.key
                }
            }
            console.log(this.status)
        },
        async getFarms() {
            let response = await this.callApi('get','farm');
            if (response.status === 200) {
                let dataResult = response.data.data;

                dataResult.forEach((item, index) => {
                    this.statusKeyToValue(item)

                });

                this.farms = dataResult
                // console.log(this.farms);
                this.success(response.statusText);
                // return dataResult;
                /* Three action return message ok*/
                // this.error(response.statusText);
                // this.warning(response.statusText);
                // this.info(response.statusText);
            } else {
                this.error(response.statusText);
                // return '';
            }
        },
        // Todo: watch video


        async expandAdditionalInfo(row) {
            this.modal = ! this.modal
            console.log(row);
            let response = await this.callApi('get','farm/' + row.id);
            if (response.status === 200) {
                let farm = this.statusKeyToValue(response.data.data);
                this.name = farm.name
                this.area = farm.area
                this.status = farm.status
                this.farmId = farm.id
            } else {
                this.error(response.statusText);
            }
        },

        statusKeyToValue (item) {
            if (item.status === globalProperties.ACTIVATE_STATUS.key) {
                item.status = globalProperties.ACTIVATE_STATUS.value
            } else {
                if (item.status === globalProperties.DEACTIVATE_STATUS.key) {
                    item.status = globalProperties.DEACTIVATE_STATUS.value
                } else {
                    item.status = globalProperties.MAINTAIN_STATUS.value
                }
            }
            return item;
        }


    },
}
</script>
