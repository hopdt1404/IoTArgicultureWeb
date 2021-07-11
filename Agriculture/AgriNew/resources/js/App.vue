<template>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">

                <a class="navbar-brand" href="/">
                        Iot Agri
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                    </ul>
                    <ul class="navbar-nav ml-auto" v-if="userId == null">
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href='register'>Register</a>
                        </li>
                    </ul>
                    <ul v-else>
                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ username}}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="logout"
                                   onclick="logout(event)">
                                    Logout
                                </a>
                                <form id="logout-form" action="logout" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
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
