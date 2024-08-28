<template>
<Layout>
    <template v-slot:default>
        
        <div class="content-wrapper" >
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>ข้อมูลผู้ใช้งานระบบ</h4>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    เพิ่มผู้ใช้งาน
                                </button> -->
                                <button type="button" class="btn btn-primary" @click="openModal">
                                    เพิ่มผู้ใช้งาน
                                </button>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">
                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">ตางรางแสดงข้อมูลผู้ใช้ระบบ</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="example" class="table table-striped table-sm table-bordered" style="width: 100%">
                            <thead>
                                <tr>
                                    <th style="width: 10%">เลขผู้ใช้งาน</th>
                                    <th style="width: 40%">ชื่อ - นามสกุล</th>
                                    <!-- <th>Lastname</th> -->
                                    <th style="width: 15%">ตำแหน่ง</th>
                                    <th style="width: 15%">สิทการใช้งาน</th>
                                    <th style="width: 20%" class="text-center">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in $store.state.user" :key="item.id">
                                    <td class="text-center">{{ index + 1 }}</td>
                                    <td>{{ item.user_name + " " + item.user_lastname }}</td>
                                    <!-- <td>{{ item.user_lastname }}</td> -->

                                    <td>{{ item.user_position }}</td>
                                    <td>{{ item.user_role }}</td>
                                    <td class="text-center">
                                        <button type="button" @click="openModalEdit(item)" class="btn btn-warning">
                                            แก้ไข</button>&nbsp;
                                        <button type="button" @click="handleDelete(item)" class="btn btn-danger">
                                            ลบ
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                    <!-- <div class="card-footer">Footer</div> -->
                    <!-- /.card-footer-->
                </div>
                <!-- /.card -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <Form>
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" v-if="edit">แก้ไขผู้ใช้งาน</h5>
                            <h5 class="modal-title" id="exampleModalLabel" v-else>เพิ่มผู้ใช้งาน</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" v-model="id" />
                            <div class="form-row">
                                <div class="col">
                                    <input v-model="user_name" type="text" class="form-control" placeholder="ชื่อ" />
                                </div>
                                <div class="col">
                                    <input v-model="user_lastname" type="text" class="form-control" placeholder="นามสกุล" />
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <input v-model="username" type="text" class="form-control" placeholder="ชื่อผู้ใช้งาน" />
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <input v-model="password" type="password" class="form-control" placeholder="รหัสผ่าน" />
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <input v-model="user_position" type="text" class="form-control" placeholder="ตำแหน่ง" />
                                </div>
                            </div>
                            <div class="mt-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="option1" value="admin" v-model="user_role" />
                                    <label class="form-check-label" for="option1">Admin</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="option2" value="user" v-model="user_role" />
                                    <label class="form-check-label" for="option2">User</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <!--  data-dismiss="modal" -->
                            <button type="button" @click="handleEdituser" class="btn btn-warning" v-if="edit">บันทึก</button>
                            <button type="button" @click="handleInsertuser" class="btn btn-primary" v-else>
                                บันทึก
                            </button>
                            <button type="button" class="btn btn-danger" @click="closeModal">
                                ปิด
                            </button>
                        </div>
                    </Form>
                </div>
            </div>
        </div>
    </template>
</Layout>
</template>

<script>
import Layout from "../layouts/Layout.vue";
import axios from "axios";
import Swal from "sweetalert2";
import Jq from "jquery";
import "datatables.net";
import "datatables.net-bs4";
import "datatables.net-bs4/css/dataTables.bootstrap4.css";
// import { Form } from "vee-validate";
// import modal from "../components/modal.vue"
// import 'bootstrap/dist/css/bootstrap.css';
import {
    ref
} from "vue";

const edit = ref(true)
export default {
    name: "HomePage",
    components: {
        Layout,
    },

    data() {
        return {
            edit,
            id: "",
            user_name: "",
            user_lastname: "",
            username: "",
            // password : '',
            user_position: "",
            user_role: "",
            //  selectedOption: 'Option 2'
        };
    },
    mounted() {
        if (localStorage.getItem('reloaded')) {
            localStorage.removeItem('reloaded');
        } else {
            localStorage.setItem('reloaded', '1');
            location.reload();
        }
        this.readData();

    },
    methods: {
        initDataTable() {
            Jq(this.$el).find("#example").DataTable({
                paging: true,
                searching: true,
                responsive: true,
                // Add more DataTables options here
            });
        },
        async readData() {

            this.isLoading = true
            const token = localStorage.getItem("token");
            await axios
                .get(
                    import.meta.env.VITE_API_URL + "/user/", {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    })
                .then((res) => {
                    this.$store.commit("setUser", res.data.data);
                    this.items = res.data.data;
                    // location.reload()

                });
            this.initDataTable();
        },
        handleInsertuser() {
            const token = localStorage.getItem("token");
            axios
                .post(
                    import.meta.env.VITE_API_URL + "/user/store", {
                        user_name: this.user_name,
                        user_lastname: this.user_lastname,
                        username: this.username,
                        password: this.password,
                        user_position: this.user_position,
                        user_role: this.user_role,
                    }, {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    }
                )
                .then(function (response) {
                    window.location.reload();
                });
        },
        openModal() {
            this.id = "";
            this.user_name = "";
            this.user_lastname = "";
            this.username = "";
            this.password = "";
            this.user_position = "";
            this.user_role = "";
            edit.value = false
            $("#exampleModal").modal("show");
        },
        closeModal() {
            $("#exampleModal").modal("hide");
        },
        openModalEdit(item) {
            edit.value = true
            this.id = item.id;
            this.user_name = item.user_name;
            this.user_lastname = item.user_lastname;
            this.username = item.username;
            this.password = "";
            this.user_position = item.user_position;
            this.user_role = item.user_role;

            $("#exampleModal").modal("show");
        },
        handleEdituser() {
            const token = localStorage.getItem("token");
            axios
                .post(
                    import.meta.env.VITE_API_URL + "/user/update", {
                        id: this.id,
                        user_name: this.user_name,
                        user_lastname: this.user_lastname,
                        username: this.username,
                        password: this.password,
                        user_position: this.user_position,
                        user_role: this.user_role,
                    }, {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    })
                .then(function (response) {
                    window.location.reload();
                });
        },
        handleDelete(item) {
            Swal.fire({
                title: "คุณต้องการลบข้อมูลนี้ใช่หรือไม่ ?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "ยืนยัน",
                cancelButtonText: "ยกเลิก",
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    const token = localStorage.getItem("token");
                    axios
                        .post(
                            import.meta.env.VITE_API_URL + "/user/delete", {
                                id: item.id,
                            }, {
                                headers: {
                                    Authorization: `Bearer ${token}`,
                                },
                            }
                        )
                        .then(function (response) {
                            window.location.reload();
                        });
                }
            });
        },
    },
};
</script>

<style>
/* @import 'bootstrap/dist/css/bootstrap.css'; */
/* @import 'datatables.net-bs4/css/dataTables.bootstrap4.css'; */
</style>
