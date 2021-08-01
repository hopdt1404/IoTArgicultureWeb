<template>
    <div class="navbar">
        <div class="nav-layout">
            <navbar></navbar>
        </div>
        <div class="nav-vertical">
            <navbar-vertical></navbar-vertical>
        </div>

        <div class="footer-layout">
            <footer></footer>
        </div>

    </div>
</template>

<script>
import Navbar from "./navbar";
import Footer from "./footer";
import NavbarVertical from './navbarVertical'

export default {
    components: {
        Footer,
        Navbar,
        NavbarVertical
    },
}
</script>
