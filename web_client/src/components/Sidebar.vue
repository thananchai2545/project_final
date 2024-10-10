<template lang="">
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
        <!--
  Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image"> <img :src="profilePath" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info"> <a href="#" class="d-block">Alexander Pierce</a> </div>
        </div>
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <!-- <a href="user" class="nav-link" v-bind:class="activeMenu('user')">
                    </a>  -->
                    <router-link to="/user" class="nav-link" v-bind:class="activeMenu('user')">
                        <i class="nav-icon fas
  fa-user"></i>
                        <p> ข้อมูลผู้ใช้งานระบบ </p>
                    </router-link>
                </li>
                <li class="nav-item ">
                    <router-link to="/tool" class="nav-link" v-bind:class="activeMenu('tool')">
                        <i class="nav-icon fas fa-toolbox"></i>
                        <p> เครื่องมือ </p>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/symptom" class="nav-link" v-bind:class="activeMenu('symptom')"> <i class="nav-icon fas fa-copy"></i>
                        <p> อาการ
                        </p>
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/hospital" class="nav-link" v-bind:class="activeMenu('hospital')"> <i class="nav-icon fas fa-hospital"></i>
                        <p> โรงพยาบาล
                        </p>
                    </router-link>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" v-bind:class="activeMenu('case')">
                    <i class="nav-icon fas fa-chart-pie"></i>
                        <p> เคส <i class="right fas fa-angle-left"></i> </p>
                    </a>
                    
                    <ul class="nav nav-treeview" id="activeMenuChild">
                        <li class="nav-item"> 
                            <router-link to="/case/accident" class="nav-link" v-bind:class="activeMenuChild('accident')"><i class="far fa-circle nav-icon"></i>
                                <p> อุบัติเหตุ <i class="right fas fa-angle-left"></i> </p>
                            </router-link> 
                        </li>
                        <li class="nav-item"> 
                            <router-link to="/case/exacerbation" class="nav-link" v-bind:class="activeMenuChild('exacerbation')"><i class="far fa-circle nav-icon"></i>
                                <p> โรคกำเริบ <i class="right fas fa-angle-left"></i> </p>
                            </router-link> 
                        </li>
                        <li class="nav-item"> 
                            <router-link to="/case/non_emergancy" class="nav-link" v-bind:class="activeMenuChild('non_emergency')"><i class="far fa-circle nav-icon"></i>
                                <p> ผู้ป่วยไม่ฉุกเฉิน <i class="right fas fa-angle-left"></i> </p>
                            </router-link> 
                        </li>
                       <li class="nav-item"> 
                            <router-link to="/case/accident" class="nav-link" v-bind:class="activeMenuChild('infectious')"><i class="far fa-circle nav-icon"></i>
                                <p> ผู้ป่วยสภาวะแพร่เชื้อ <i class="right fas fa-angle-left"></i> </p>
                            </router-link> 
                        </li>
                    </ul>

                </li>

                <li @click="handleSignout" class="nav-item"> <a href="#" class="nav-link">
                        <i class="fas fa-sign-out-alt"></i>
                        <p> ออกจากระบบ </p>
                    </a> </li>
                
            </ul>
        </nav> <!-- /.sidebar-menu -->
    </div> <!-- /.sidebar -->
</aside>
</template>

<script>
import { ref } from "vue";

// import imageName from '/dist/img/AdminLTELogo.png'
export default {
  data() {
    return {
      logoImage: "AdminLTELogo.png",
      profileImage: "user2-160x160.jpg",
      segment1: new URL(location.href).pathname.split("/")[1],
    };
  },
  computed: {
    logoPath() {
      return `/dist/img/${this.logoImage}`;
    },
    profilePath() {
      return `/dist/img/${this.profileImage}`;
    },
  },
  methods: {
    initFunction: function () {
      console.log(new URL(location.href).pathname);
    },
    handleSignout() {
      // console.log(1234);
      this.$store.commit("clearToken");
      this.$router.push("/");
    },
    activeMenu(param) {
      let status = "";
      if (new URL(location.href).pathname.split("/")[1] == param) {
        status = "active";
        if (new URL(location.href).pathname.split("/")[2] == param) {
          status = "active menu-is-opening menu-open";
        }
      }
      return status;
    },
    activeMenuChild(param) {
      let status = "";
      if (new URL(location.href).pathname.split("/")[2] == param) {
        status = "active";
        var activeMenuChild = document.getElementById("activeMenuChild");
        // activeMenuChild.style.display = "block";
      }
      return status;
    },
  },
  mounted() {
    this.initFunction();
  },
};
</script>

<style ></style>
