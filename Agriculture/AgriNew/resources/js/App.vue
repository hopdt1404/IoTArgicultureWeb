<template>
    <div id="app">
        This is file App.vue
        // Define navbar component in this file
<!--        <template>-->

<!--                <b-row class="row-ag" align-v="center" align-h="between">-->
<!--                    <b-col cols="4" align-self="center" >-->
<!--                        <b-img class='logo-image-size' :src=" require('./src/assets/images/logo/logo.jpg')"></b-img>-->
<!--&lt;!&ndash;                        <b-img class="logo-img-size"></b-img>&ndash;&gt;-->
<!--                    </b-col>-->
<!--                    <b-col cols="4" align-self="center">-->
<!--                        <div>-->
<!--                            <b-nav>-->
<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/home">Home</router-link>-->
<!--                                </b-nav-item>-->

<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/user">User</router-link>-->
<!--                                </b-nav-item>-->

<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/farm">Farm</router-link>-->
<!--                                </b-nav-item>-->

<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/device">Device</router-link>-->
<!--                                </b-nav-item>-->
<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/plant">Plant</router-link>-->
<!--                                </b-nav-item>-->

<!--                                <b-nav-item>-->
<!--                                    <router-link class="nav-item" to="/setting_agriculture">Setting Agriculture</router-link>-->
<!--                                </b-nav-item>-->

<!--                            </b-nav>-->
<!--                        </div>-->

<!--                    </b-col>-->
<!--                    <div class="navbar-page">-->


<!--                    </div>-->
<!--                </b-row>-->


<!--        </template>-->
        <div>
            <!--========== ADMIN SIDE MENU one ========-->
            <div class="_1side_menu" >
                <div class="_1side_menu_logo">
                    <h3 style="text-align:center;">Logo Image</h3>
                    <!--<img src="/img/logo.jpg" style="width: 108px;margin-left: 68px;"/>-->
                </div>

                <!--~~~~~~~~ MENU CONTENT ~~~~~~~~-->
                <div class="_1side_menu_content">
                    <div class="_1side_menu_img_name">
                        <!-- <img class="_1side_menu_img" src="/pic.png" alt="" title=""> -->
                        <p class="_1side_menu_name">Admin</p>
                    </div>

                    <!--~~~ MENU LIST ~~~~~~-->
                    <div class="_1side_menu_list">
                        <ul class="_1side_menu_list_ul">
<!--                            <li v-for="(menuItem, i) in permission" :key="i" v-if="permission.length && menuItem.read">-->
<!--                                <router-link :to="'/'+menuItem.name"><Icon type="ios-speedometer" /> {{menuItem.resourceName}}</router-link>-->
<!--                            </li>-->


                            <li><router-link to="home"><Icon type="ios-speedometer" /> Home</router-link></li>
                            <li><router-link to="user"><Icon type="ios-speedometer" /> User</router-link></li>
                            <li><router-link to="farm"><Icon type="ios-speedometer" /> Farm</router-link></li>
                            <li><router-link to="device"><Icon type="ios-speedometer" /> Device</router-link></li>
                            <li><router-link to="plant"><Icon type="ios-speedometer" /> Plant</router-link></li>
                            <li><router-link to="setting-agriculture"><Icon type="ios-speedometer" /> Setting Agriculture</router-link></li>


                            <li><a href="/logout"><Icon type="ios-speedometer" /> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--========== ADMIN SIDE MENU ========-->

            <!--========= HEADER ==========-->
            <div class="header">
                <div class="_2menu _box_shadow">
                    <div class="_2menu_logo">
                        <ul class="open_button">
                            <li>
                                <Icon type="ios-list" />
                            </li>
                            <!--<li><Icon type="ios-albums" /></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <!--========= HEADER ==========-->
        </div>
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
