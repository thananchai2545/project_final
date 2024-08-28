<template>
<div class="wrapper">
    <Navbar />
    <slot></slot>
    <Sidebar />
    <!-- <Footer /> -->
</div>
</template>

<script>
import Navbar from "../components/Navbar.vue";
import Sidebar from "../components/Sidebar.vue";
// import Footer from "../components/Footer.vue";
export default {
    name: "Layout",
    components: {
        Navbar,
        Sidebar,
        // Footer,
    },
    // mounted() {
    //     // document.body.classList.toggle('hold-transition', 'sidebar-mini','layout-fixed')
    //     document.body.classList.toggle("hold-transition");
    //     document.body.classList.toggle("sidebar-mini");
    //     document.body.classList.toggle("layout-fixed");
    // },
    methods: {
        initFunction: function () {
            document.body.classList.toggle("hold-transition");
            document.body.classList.toggle("sidebar-mini");
            document.body.classList.toggle("layout-fixed");
        },
    },
    created: async function () {
        await this.initFunction();
    },
};
</script>
