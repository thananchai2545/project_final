<template>
<Layout>
    <template v-slot:default>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>ข้อมูลเครื่องมือ</h4>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <button type="button" class="btn btn-primary" @click="openModal">
                                    เพิ่มเครื่องมือ
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
                        <h3 class="card-title">ตางรางแสดงข้อมูลเครื่องมือ</h3>
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
                                    <th class="text-center" style="width: 5%">#</th>
                                    <th class="text-center" style="width: 10%;">รูปภาพ</th>
                                    <th style="width: 20%">ชื่อเครื่องมือ</th>
                                    <th style="width: 40%">คำอธิบาย</th>
                                    <th style="width: 20%" class="text-center">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in tool" :key="item.id">
                                    <td class="text-center">{{ index + 1 }}</td>
                                    <td class="d-flex justify-content-center"> <img style=" padding: 5px; width: 100px; " :src="img_+item.tool_img" alt=""> </td>
                                    <td>{{ item.tool_name }}</td>
                                    <td>{{ item.tool_description }}</td>
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
                            <h5 class="modal-title" id="exampleModalLabel" v-if="edit">
                                แก้ไขเครื่องมือ
                            </h5>
                            <h5 class="modal-title" id="exampleModalLabel" v-else>เพิ่มเครื่องมือ</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" v-model="id" />
                            <div class="form-row mt-2">
                                <div class="col">
                                    <label for="">ชื่อเครื่องมือ</label>
                                    <input v-model="tool_name" type="text" class="form-control" placeholder="ชื่อเครื่องมือ" />
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <div class="col">
                                    <label>คำอธิบาย</label>
                                    <textarea v-model="tool_description" class="form-control" rows="3" placeholder="คำอธิบายเครื่องมือ"></textarea>
                                    <!-- <input  type="text" class="form-control" placeholder="ชื่อเครื่องมือ" /> -->
                                </div>
                            </div>
                            <div class="form-row mt-2">
                                <label for="">รูปภาพ</label>
                                <!-- -->
                                <input type="file" class="dropify" @change="onFileChange" />
                            </div>
                        </div>

                        <div class="modal-footer">
                            <!--  data-dismiss="modal" -->
                            <button type="button" @click="handleEdittool" class="btn btn-warning" v-if="edit">
                                บันทึก
                            </button>
                            <button type="button" @click="handleInserttool" class="btn btn-primary" v-else>
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
import "dropify";
import "dropify/dist/css/dropify.css";
import {
    ref
} from "vue";
const img_ =
    import.meta.env.VITE_URL_IMG
const edit = ref(true);

export default {
    name: "HomePage",
    name: "FileUploader",
    components: {
        Layout,
    },

    data() {
        return {
            tool: [],
            edit,
            img_,
            selectedFile: null,
            id: "",
            tool_name: "",
            tool_description: "",
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
        Jq(".dropify").dropify({
            messages: {
                default: "เพิ่มรูปภาพ",
                replace: "คลิกเพื่อเปลี่ยนหรือลบรูปภาพ",
                remove: "ลบรูปภาพเครื่องมือ",
                error: "Ooops, something wrong happened.",
            },
        });

        // Handle Dropify events
        const drEvent = Jq(".dropify").dropify();
        // drEvent.on('dropify.afterClear', function (event, element) {
        //     // alert('File deleted');
        // });
        drEvent.on("dropify.errors", function (event, element) {
            console.log("Has Errors");
        });
    },
    methods: {
        onFileChange(event) {
            this.selectedFile = event.target.files[0];
        },
        initDataTable() {
            Jq(this.$el).find("#example").DataTable({
                paging: true,
                searching: true,
                responsive: true,
                // Add more DataTables options here
            });
        },
        async readData() {
            const token = localStorage.getItem("token");
            await axios
                .get(
                    import.meta.env.VITE_API_URL + "/tool/", {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    })
                .then((res) => {
                    this.tool = res.data.data;
                });
            this.initDataTable();
        },
        async handleInserttool() {
            const formData = new FormData();
            formData.append("tool_name", this.tool_name);
            formData.append("tool_description", this.tool_description);
            formData.append("tool_img", this.selectedFile);
            try {
                const token = localStorage.getItem("token");
                axios
                    .post(
                        import.meta.env.VITE_API_URL + "/tool/store", formData, {
                            headers: {
                                "Content-Type": "multipart/form-data",
                                Authorization: `Bearer ${token}`,
                            },
                        })
                    .then(function (response) {
                        window.location.reload();
                    });
            } catch (error) {
                console.error("There was an error uploading the file:", error);
            }
        },
        openModal() {
            this.id = "";
            this.tool_name = "";
            this.tool_description = "";
            edit.value = false;
            $("#exampleModal").modal("show");
        },
        closeModal() {
            $("#exampleModal").modal("hide");
        },
        openModalEdit(item) {
            this.id = item.id;
            this.tool_name = item.tool_name;
            this.tool_description = item.tool_description;

            edit.value = true;
            $("#exampleModal").modal("show");
        },
        handleEdittool() {
            const token = localStorage.getItem("token");
            const formData = new FormData();
            formData.append("id", this.id);
            formData.append("tool_name", this.tool_name);
            formData.append("tool_description", this.tool_description);
            formData.append("tool_img", this.selectedFile);
            axios
                .post(
                    import.meta.env.VITE_API_URL + "/tool/update", formData, {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    }
                )
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
                            import.meta.env.VITE_API_URL + "/tool/delete", {
                                id: item.id,
                                tool_img : item.tool_img
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
#preview {
    display: flex;
    justify-content: center;
    align-items: center;
}

#preview img {
    width: 150px;
    height: 150px;
    object-fit: contain;
}
</style>
