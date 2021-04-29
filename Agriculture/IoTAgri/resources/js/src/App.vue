<template>
    <div class="container">
        <div class="header">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a href="" class="nav-link">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">
                        User
                    </a>
                </li>
            </ul>
        </div>

        <div class="main mt-4">
            <div class="row">
                <div class="col-md-8 offset-2 text-center">
                    <p>This is App component</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'App',
}
</script>

<style>
.container {
    border: 1px solid #eee;
}
.active {
    color: red
}
</style>
