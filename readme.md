### Catch all route laravel
  https://mauricius.dev/laravel-catch-all-route-for-vue-single-page-applications/ : Uy tin luon

### Laravel Generator:
https://www.infyom.com/open-source/laravelgenerator/docs/7.0/installation : : Uy tin luon
  

### Issue Sass in project
Document Link: 
1: https://cli.vuejs.org/guide/css.html#pre-processors
2: https://github.com/yenshih/style-resources-loader

Current Link: 2
Position: "Prepends variables and mixins to all scss files with default resources injector."




###Link: demo project

###Document:
+ Vuejs:
  - Vietnamese: https://vi.vuejs.org/v2/guide/
  - English: https://vuejs.org/v2/guide/
+ Laravel:
  - Laravel 7.x:

+ Video: become full stack developer
  - Link: https://www.youtube.com/watch?v=-o5mgphZfWc&list=PLKpfEl4N7tRqIx4VZmuZBnUQ6vG4uDgq7&index=15
  - Current time: 00:00


+ Axios: Doc
  https://github.com/axios/axios

+ UI
  https://www.iviewui.com/components/icon-en

- php artisan serve --port=numberPort
- sudo npm install
- sudo npm install vue


#### Command run
- php artisan serve --port=8200
- sudo npm run watch

### Postman
Content-Type: application/json
X-Requested-With: XMLHttpRequest


###### Mutations
https://viblo.asia/p/vuex-va-vi-du-don-gian-GrLZDpzgZk0

Error: https://css-tricks.com/how-to-import-a-sass-file-into-every-vue-component-in-an-app/
Not Map SaSS in project




:Access Token
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODIwMFwvYXBpXC9sb2dpbiIsImlhdCI6MTYxNjg4NzU3OSwiZXhwIjoxNjE2OTczOTc5LCJuYmYiOjE2MTY4ODc1NzksImp0aSI6IjlEWURjMUFCN2VEbWRtdUMiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.WEFGeOGG_FgIV_JgDHkyXLPaw8XBegUKYEtmITy8jko


## Import all sass in file resource/sass/main.scss

Doing in --

https://laravel.com/docs/7.x/passport



<code in  App.vue project>
<div>
            <!--========== ADMIN SIDE MENU one ========-->
<!--            <div class="_1side_menu" >-->
<!--                <div class="_1side_menu_logo">-->
<!--                    <h3 style="text-align:center;">Logo Image</h3>-->
<!--                    &lt;!&ndash;<img src="/img/logo.jpg" style="width: 108px;margin-left: 68px;"/>&ndash;&gt;-->
<!--                </div>-->

<!--                &lt;!&ndash;~~~~~~~~ MENU CONTENT ~~~~~~~~&ndash;&gt;-->
<!--&lt;!&ndash;                <div class="_1side_menu_content">&ndash;&gt;-->
<!--&lt;!&ndash;                    <div class="_1side_menu_img_name">&ndash;&gt;-->
<!--&lt;!&ndash;                        <p class="_1side_menu_name">Admin</p>&ndash;&gt;-->
<!--&lt;!&ndash;                    </div>&ndash;&gt;-->

<!--&lt;!&ndash;                    &lt;!&ndash;~~~ MENU LIST ~~~~~~&ndash;&gt;&ndash;&gt;-->
<!--&lt;!&ndash;                    <div class="_1side_menu_list">&ndash;&gt;-->
<!--&lt;!&ndash;                        <ul class="_1side_menu_list_ul">&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="home"><Icon type="md-home" /> Home</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="user"><Icon type="md-contact" /> User</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="farm"><Icon type="ios-map" /> Farm</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="device"><Icon type="md-hammer" /> Device</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="plant"><Icon type="ios-snow" /> Plant</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><router-link to="setting-agriculture"><Icon type="ios-settings" /> Setting Agriculture</router-link></li>&ndash;&gt;-->
<!--&lt;!&ndash;                            <li><a href="/logout"><Icon type="md-arrow-back" /> Logout</a></li>&ndash;&gt;-->

<!--&lt;!&ndash;                        </ul>&ndash;&gt;-->
<!--&lt;!&ndash;                    </div>&ndash;&gt;-->
<!--&lt;!&ndash;                </div>&ndash;&gt;-->
<!--            </div>-->
            <!--========== ADMIN SIDE MENU ========-->

            <!--========= HEADER ==========-->

            <!--========= HEADER ==========-->
        </div>




New app.vue

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
                    <ul class="navbar-nav ml-auto" v-if="userId == null" >
                        <li class="nav-item" style="margin-right: 30px;">
                            <router-link to="login" style="color: #6c757d"> Login</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="register" style="color: #6c757d"> Register</router-link>
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
