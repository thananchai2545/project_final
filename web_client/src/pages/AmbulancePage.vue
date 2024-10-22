<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>ข้อมูลรถพยาบาล</h4>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <button
                    type="button"
                    class="btn btn-primary"
                    @click="openModal"
                  >
                    เพิ่มข้อมูลรถพยาบาล
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
              <h3 class="card-title">ตางรางแสดงข้อมูลอาการ</h3>

              <div class="card-tools">
                <button
                  type="button"
                  class="btn btn-tool"
                  data-card-widget="collapse"
                  title="Collapse"
                >
                  <i class="fas fa-minus"></i>
                </button>
                <button
                  type="button"
                  class="btn btn-tool"
                  data-card-widget="remove"
                  title="Remove"
                >
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <table
                id="example"
                class="table table-striped table-sm table-bordered"
                style="width: 100%"
              >
                <thead>
                  <tr>
                    <th style="width: 5%" class="text-center">#</th>
                    <th style="width: 20%">ชื่อคนขับรถ</th>
                    <th>ป้ายรถพยาบาล</th>
                    <th>เครื่องมือ</th>
                    <th>สถานะ</th>
                    <th style="width: 30%" class="text-center">จัดการ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(item, key, index) in ambulance" :key="index">
                    <td class="text-center">{{ index + 1 }}</td>
                    <td>{{ item.ambulance_driver_name }}</td>
                    <td>{{ item.ambulance_registration }}</td>
                    <td>
                      <div
                        v-for="item1 in item.ambulance_tool_arr"
                        :key="item1.id"
                      >
                        {{ item1.tool_name }}
                      </div>
                    </td>
                    <td>
                      <div v-if="item.status == 'true'">พร้อมใช้งาน</div>
                      <div v-else>ไม่พร้อมใช้งาน</div>
                    </td>
                    <td class="text-center">
                      <button
                        type="button"
                        @click="openModalEdit(item)"
                        class="btn btn-warning"
                      >
                        แก้ไข</button
                      >&nbsp;
                      <button
                        type="button"
                        @click="handleDelete(item)"
                        class="btn btn-danger"
                      >
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
                <h5 class="modal-title" id="exampleModalLabel" v-if="edit">
                  แก้ไขรถพยาบาล
                </h5>
                <h5 class="modal-title" id="exampleModalLabel" v-else>
                  เพิ่มรถพยาบาล
                </h5>

                <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-label="Close"
                >
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <input type="hidden" v-model="id" />
                <div class="form-row">
                  <div class="col">
                    <label for="">ชื่อคนขับรถ</label>
                    <input
                      v-model="driver_name"
                      type="text"
                      class="form-control"
                      placeholder="ป้ายรถพยาบาล"
                    />
                  </div>
                </div>
                <div class="form-row mt-2">
                  <div class="col">
                    <label for="">ป้ายรถพยาบาล</label>
                    <input
                      v-model="ambulance_registration"
                      type="text"
                      class="form-control"
                      placeholder="ป้ายรถพยาบาล"
                    />
                  </div>
                </div>
                <div class="form-row mt-2">
                  <div class="col">
                    <label for="">เครื่องมือการปฐมพยาบาล</label>
                  </div>
                </div>
                <div v-for="item_tool in tool" :key="item_tool.id">
                  <div class="custom-control custom-checkbox">
                    <input
                      type="checkbox"
                      :value="item_tool.id"
                      v-model="setToolOption"
                    />
                    <label :for="item_tool.id">{{ item_tool.tool_name }}</label>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <!--  data-dismiss="modal" -->
                <button
                  type="button"
                  @click="handleEditAmbulance"
                  class="btn btn-warning"
                  v-if="edit"
                >
                  บันทึก
                </button>
                <button
                  type="button"
                  @click="handleInsertAmbulance"
                  class="btn btn-primary"
                  v-else
                >
                  บันทึก
                </button>
                <button
                  type="button"
                  class="btn btn-danger"
                  @click="closeModal"
                >
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
import { ref } from "vue";

const edit = ref(true);
const checkbox = false;
export default {
  name: "HomePage",
  components: {
    Layout,
  },

  data() {
    return {
      edit,
      ambulance_registration: "",
      driver_name: "",
      ambulance: [],
      tool: [],
      setToolOption: [],
      // checkedTool: []
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
    this.readData();
  },
  created() {
    setInterval(this.readData, 1000);
  },

  methods: {
    initDataTable() {
      Jq("#example").DataTable({
        paging: true,
        searching: true,
        responsive: true,
      });
    },
    async readData() {
      const token = localStorage.getItem("token");
      await axios
        .get(import.meta.env.VITE_API_URL + "/ambulance/", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.tool = res.data.data_tool;
          this.ambulance = res.data.data_ambulance;
          console.log(this.ambulance);
        });
    },
    handleInsertAmbulance() {
      // console.log();

      const token = localStorage.getItem("token");
      // console.log(1321);
      // console.log(this.symptom_name);
      if (this.ambulance_registration == "") {
        alert("ขออภัยไม่ได้ระบุป้ายทะเบียนรถ");
        return false;
      }

      if (this.setToolOption.length == 0) {
        alert("ขออภัยไม่ได้ระบุเครื่องมือ");
        return false;
      }
      axios
        .post(
          import.meta.env.VITE_API_URL + "/ambulance/insert",
          {
            driver_name: this.driver_name,
            ambulance_registration: this.ambulance_registration,
            tool_arr: this.setToolOption.sort(),
          },
          {
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
      this.driver_name = "";
      this.symptom_name = "";
      this.setToolOption = [];
      edit.value = false;
      $("#exampleModal").modal("show");
    },
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    openModalEdit(item) {
      edit.value = true;
      this.setToolOption = [];
      item.ambulance_tool_arr.map((data) => {
        this.setToolOption.push(data.tool_id);
      });

      this.id = item.id;
      this.driver_name = item.ambulance_driver_name;
      this.ambulance_registration = item.ambulance_registration;
      $("#exampleModal").modal("show");
    },
    handleEditAmbulance() {
      if (this.ambulance_registration == "") {
        alert("ขออภัยไม่ได้ระบุอาการ");
        return false;
      }

      if (this.setToolOption.length == 0) {
        alert("ขออภัยไม่ได้ระบุเครื่องมือ");
        return false;
      }

      // console.log(this.id, this.symptom_name, this.setToolOption);
      const token = localStorage.getItem("token");
      axios
        .post(
          import.meta.env.VITE_API_URL + "/infectious/update",
          {
            id: this.id,
            driver_name: this.driver_name,
            ambulance_registration: this.ambulance_registration,
            tool_arr: this.setToolOption,
          },
          {
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
      }).then(async (result) => {
        if (result.isConfirmed) {
          const token = localStorage.getItem("token");

          await axios
            .post(
              import.meta.env.VITE_API_URL + "/ambulance/delete",
              {
                ambulance_id: item.id,
              },
              {
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


