<template>
    <div id="app">
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


                            <li><router-link to="home"><Icon type="md-home" /> Home</router-link></li>
                            <li><router-link to="user"><Icon type="md-contact" /> User</router-link></li>
                            <li><router-link to="farm"><Icon type="ios-map" /> Farm</router-link></li>
                            <li><router-link to="device"><Icon type="md-hammer" /> Device</router-link></li>
                            <li><router-link to="plant"><Icon type="ios-snow" /> Plant</router-link></li>
                            <li><router-link to="setting-agriculture"><Icon type="ios-settings" /> Setting Agriculture</router-link></li>

                            <li><a href="/logout"><Icon type="md-arrow-back" /> Logout</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <!--========== ADMIN SIDE MENU ========-->

            <!--========= HEADER ==========-->
            <div class="header">
                <div class="_2menu _box_shadow">
                    <div class="_2menu_logo">
                        <div v-if="userId != null">
                            <li >
                                <Icon type="ios-list" />
                            </li>
                            <li>

                            </li>


                        </div>
                        <b-row v-else class>

                                <router-link to="login" style="color: #6c757d"> Login</router-link>


                                <router-link to="register" style="color: #6c757d"> Register</router-link>

                        </b-row>
                        <ul class="open_button">


                            <li>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--========= HEADER ==========-->
        </div>
        <router-view></router-view>
    </div>
</template>

<script>
// import
export default {
    data() {
        return {
            userId: null,
            username: ''
        }
    },
    created() {

    },
    methods: {
        logout (event) {
            event.preventDefault();
            document.getElementById('logout-form').submit();
        }
    }

}
</script>


<style lang="scss">


</style>
