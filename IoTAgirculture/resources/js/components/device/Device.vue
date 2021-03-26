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
    let dataPost = await this.callApi('post', '/api/device', {id: 123});

    console.log(dataPost);
    if (dataPost.status === 200) {
      console.log('dataPost.status === 200');
    } else {
      console.log('Error dataPost.status === ' + dataPost.status);
    }
  },

}

</script>
