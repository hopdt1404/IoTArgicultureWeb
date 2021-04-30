<template>
    <div>
        This is file App.vue
        // Define navbar component in this file
        <template>

                <b-row class="row-ag" align-v="center" align-h="between">
                    <b-col cols="4" align-self="center" >
                        <b-img class='logo-image-size' :src=" require('./src/assets/images/logo/logo.jpg')"></b-img>
<!--                        <b-img class="logo-img-size"></b-img>-->
                    </b-col>
                    <b-col cols="4" align-self="center">
                        <div>
                            <b-nav>
                                <b-nav-item>
                                    <router-link class="nav-item" to="/home">Home</router-link>
                                </b-nav-item>

                                <b-nav-item>
                                    <router-link class="nav-item" to="/user">User</router-link>
                                </b-nav-item>

                                <b-nav-item>
                                    <router-link class="nav-item" to="/farm">Farm</router-link>
                                </b-nav-item>

                                <b-nav-item>
                                    <router-link class="nav-item" to="/device">Device</router-link>
                                </b-nav-item>
                                <b-nav-item>
                                    <router-link class="nav-item" to="/plant">Plant</router-link>
                                </b-nav-item>

                                <b-nav-item>
                                    <router-link class="nav-item" to="/setting_agriculture">Setting Agriculture</router-link>
                                </b-nav-item>

                            </b-nav>
                        </div>

                    </b-col>
                    <div class="navbar-page">


                    </div>
                </b-row>


        </template>
        <router-view></router-view>
    </div>
</template>

<style lang="scss">
.row-ag {
    margin-left: 0;
}
.logo-image-size {
    max-width: 6em;
}

</style>
