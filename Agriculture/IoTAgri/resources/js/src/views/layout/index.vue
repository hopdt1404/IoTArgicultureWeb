<template>
    <div className="container">
        <div className="header">
            <ul className="nav justify-content-center">
                <li className="nav-item">
                    <a href="" className="nav-link">
                        Home
                    </a>
                </li>
                <li className="nav-item">
                    <a href="" className="nav-link">
                        User
                    </a>
                </li>
            </ul>
        </div>

        <div className="main mt-4">
            <div className="row">
                <div className="col-md-8 offset-2 text-center">
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
