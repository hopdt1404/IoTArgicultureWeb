<template>
    <div class="navbar">
        <div class="nav-layout">
            <navbar></navbar>

        </div>

        <div class="footer-layout">
            <footer></footer>
        </div>

    </div>
</template>

<script>
import Navbar from "./navbar";
import Footer from "./footer";

export default {
    components: {
        Footer,
        Navbar
    },
}
</script>
