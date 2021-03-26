<template>
  <div>
    This is test page
  </div>
</template>

<script>

import { mapState, mapActions } from "vuex";

export default {
  components: {

  },
  name: "TestComponent",
  props: {},
  beforeCreate() {
  },
  async created() {
    let data = await this.demoCallAPIBackend();
    console.log(data);
  },
  beforeMount() {
  },
  mounted() {
  },
  beforeUpdate() {
  },
  update() {
  },
  beforeDestroy() {
  },
  destroyed() {
  },

  data() {
    return {

    }

  },
  methods: {
    ...mapActions({
      demoCallAPIBackend: 'demo/demoCallAPIBackend',
    }),

  },

  computed: {
    ...mapState({
    }),
  },
  watch: {

  },

}
</script>
<style scoped>


</style>
