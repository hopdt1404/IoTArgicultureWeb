<template>
    <div class="navbar-page">
        <div class="navbar-block">
            <div class="row">
                <div class="navbar-menu">
                    <div class="nav-item">
                        <!--                    Todo add icon and create css -->
                        <router-link to="/home">Home</router-link>
                    </div>
                    <div class="nav-item">
                        <router-link to="/user">User</router-link>
                    </div>

                    <div class="nav-item">
                        <router-link to="/farm">Farm</router-link>
                    </div>
                    <div class="nav-item">
                        <router-link to="/device">Device</router-link>
                    </div>
                    <div class="nav-item">
                        <router-link to="/plant">Plant</router-link>
                    </div>
                    <div class="nav-item">
                        <router-link to="/setting-agriculture">Setting Agriculture</router-link>
                    </div>


                </div>
            </div>

        </div>

    </div>
</template>

<style lang="sass">
    @import "resources/sass/layouts/navbar.scss"


</style>
