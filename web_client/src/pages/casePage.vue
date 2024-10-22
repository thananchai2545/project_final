<template lang="">
<Layout>
    <template v-slot:default>
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>ข้อมูลเคส</h4>
                        </div>
                        <!-- <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <button type="button" class="btn btn-primary" @click="openModal">
                    เพิ่มข้อมูลอาการ
                  </button>
                </ol>
              </div> -->
                    </div>
                </div>
            </section>
            <section class="content">
                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">ตางรางแสดงข้อมูลเคส</h3>

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
                                    <th class="text-center">#</th>
                                    <th>ชื่อ - นามสกุล</th>
                                    <th>เบอร์โทรศัพท์</th>
                                    <!-- <th>เลขบัตรประชาชน</th> -->
                                    <th>ประเภท</th>
                                    <th>สถานะ</th>
                                    <!-- <th style="width: 45%">เครื่องมือ</th> -->
                                    <th style="width: 20%" class="text-center">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in case">
                                    <td class="text-center">{{ index +1  }}</td>
                                    <td>{{ item.case_name }}</td>
                                    <td>{{ item.case_tel }}</td>
                                    <!-- <td> {{ item.case_idcard }}</td> -->
                                    <td>
                                        <div v-if="item.case_type === 'accident'">
                                            อุบัติเหตุ
                                        </div>
                                    </td>
                                     <td >
                                     <div v-if="item.case_status === 'inform'">รอการอนุมัติเหตุ</div>
                                     <div v-if="item.case_status === 'receive'">เตรียมอุปกรณ์ออกไปรับผู้ป่วย</div>
                                     <div v-if="item.case_status === 'departure'">กำลังออกไปรับผู้ป่วย</div>
                                     <div v-if="item.case_status === 'destination'">ถึงจุดหมายไปรับผู้ป่วย</div>
                                     <div v-if="item.case_status === 'hospital'">กำลังนำส่งโรงพยาบาลรับผู้ป่วย</div>
                                     <div v-if="item.case_status === 'complete'">เสร็จสิ้น</div>
                                     </td>
                                    
                                    

                                    <td class="text-center">

                                        <button @click="case_detail(item.id)" type="button" class="btn btn-primary">
                                            ดูเพิ่มเติม <i class="fas fa-eye"></i>
                                        </button>

                                        <!-- <router-link to="/case/detail" class="btn btn-primary">
                                            ดูเพิ่มเติม <i class="fas fa-eye"></i>
                                        </router-link> -->

                                        <!-- &nbsp;
                                        <button type="button" @click="openModal(item)" class="btn btn-warning">
                                            รับเคส
                                        </button> -->
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
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <Form>
                        <div class="modal-header">

                            <h5 class="modal-title" id="exampleModalLabel">เคส</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body m-3">
                            <!-- <input type="hidden" v-model="id" /> -->
                            <div class="row d-flex justify-content-between">
                                <div>
                                    <b>ชื่อ - นามสกุล &nbsp;</b>
                                </div>
                                <div>
                                    {{ case_name }}
                                </div>
                            </div>
                            <div class="row d-flex justify-content-between">
                                <div>
                                    <b>เบอร์โทรศัพท์</b>
                                </div>
                                <div>
                                    {{ case_tel }}
                                </div>
                                <!-- เบอร์โทรศัพท์ &nbsp; {{ case_tel }} -->
                            </div>
                            <div class="row d-flex justify-content-between">
                                <div>
                                    <b>หมายเลขบัตรประชาชน</b>
                                </div>
                                <div>
                                    {{ case_idcard }}
                                </div>
                                <!-- หมายเลขบัตรประชาชน &nbsp; {{ case_idcard }} -->
                            </div>
                            <div class="row d-flex justify-content-between">
                                <b>
                                    ประเภท
                                </b>
                                <div v-if="case_type == 'accident'">
                                    อุบัติเหตุ
                                </div>

                            </div>
                            <div class="row d-flex justify-content-between p-0">
                                <b>อาการเบื้องต้น</b>

                                <div class="col-12" v-for="case_symptom in case_symptom" :key="case_symptom.id">
                                    {{ case_symptom.symptom_name }}

                                </div>

                            </div>
                            <div class="row d-flex justify-content-between p-0">
                                <b>เครื่องมือ</b>

                                <div class="col-12" v-for="case_tool in case_tool" :key="case_symptom.id">
                                    {{ case_tool.tool_name }}

                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" @click="handleInsertsymptom" class="btn btn-warning">
                                รับเคส
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
import { ref } from "vue";
const edit = ref(true);
export default {
  components: {
    Layout,
  },

  data() {
    return {
      case_name: "",
      case_tel: "",
      case_idcard: "",
      case_type: "",
      case_symptom: [],
      case_tool: [],
      case: [],
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
    this.caseData();

    // console.log(tool);
  },
  methods: {
    async caseData() {
      const token = localStorage.getItem("token");
      await axios
        .get(import.meta.env.VITE_API_URL + "/caseRoutes", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.case = res.data.case;

          // console.log(res.data.case);
          // console.log(res.data.tool);
        });
      await this.initDataTable();
    },
    initDataTable() {
      Jq(this.$el).find("#example").DataTable({
        paging: true,
        searching: true,
        responsive: true,
      });
    },
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    openModal(item) {
      // edit.value = true;
      // this.setToolOption = [];
      // item.symptom_tool_arr.map((data) => {
      //     this.setToolOption.push(data.tool_id);
      // });

      // this.id = item.id;
      // this.symptom_name = item.symptom_name;
      let case_tel = item.case_tel
        .replace(/\D/g, "")
        .match(/(\d{0,3})(\d{0,3})(\d{0,4})/)
        .splice(1, 3)
        .toString();

      let case_idcard = item.case_idcard
        .replace(/\D/g, "")
        .match(/(\d{0,1})(\d{0,4})(\d{0,5})(\d{0,2})(\d{0,1})/)
        .splice(1, 5)
        .toString();

      this.case_name = item.case_name;
      this.case_tel = case_tel.replaceAll(",", " ");
      this.case_idcard = case_idcard.replaceAll(",", " ");
      this.case_type = item.case_type;
      this.case_symptom = item.case_symptom;
      this.case_tool = item.case_tool;
      // console.log(this.case_tool);

      $("#exampleModal").modal("show");
    },

    case_detail(id) {
      this.$router.push({
        path: `/case/detail/` + id,
      });

      // console.log(id);
    },
  },
};
</script>

<style lang="stylus" scoped></style>
