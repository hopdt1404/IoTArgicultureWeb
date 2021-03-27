<template>
  <div>
    <div>
      this is device page
    </div>
  </div>
</template>

<script>
// import

export default {
  data() {
    return {

    }
  },
  methods() {


  },
  async created() {
    let dataGet = await this.callApi('get', '/api/device');
    console.log('dataGet');
    console.log(dataGet);

    let paramGet = {
      'name': 'A'
    };
    let dataGetParams = await this.callApi('get', '/api/device', paramGet);
    console.log('dataGetParams');
    console.log(dataGetParams);

    let dataPost = await this.callApi('post', '/api/device', paramGet);
    console.log('dataPostParams');
    console.log(dataPost);

    let deviceId = 1;
    let bodyData = {
      status : '521'
    };
    let dataUpdate = await this.callApi('put', `/api/device/${deviceId}`, bodyData);
    console.log('dataUpdate');
    console.log(dataUpdate);
  },

}

</script>
