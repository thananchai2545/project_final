<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>ผู้ป่วยโรคติดต่อ</h4>
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
              <h3 class="card-title">ตางรางแสดงข้อมูล</h3>
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
                    <th class="text-center">#</th>
                    <th>ชื่อ - นามสกุล</th>
                    <th>เบอร์โทรศัพท์</th>
                    <th>ประเภท</th>
                    <th>สถานะ</th>
                    <!-- <th style="width: 45%">เครื่องมือ</th> -->
                    <th style="width: 20%" class="text-center">จัดการ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(item, index) in infectious" :key="item.id">
                    <td class="text-center">{{ index + 1 }}</td>
                    <td>{{ item.name_lastname }}</td>
                    <td>{{ item.tel }}</td>
                    <td>ผู้ป่วยโรคติดต่อ</td>
                    <td>
                      <div v-if="item.status === 'inform'">
                        รอการอนุมัติเหตุ
                      </div>
                      <div v-if="item.status === 'receive'">
                        เตรียมอุปกรณ์ออกไปรับผู้ป่วย
                      </div>
                      <div v-if="item.status === 'departure'">
                        กำลังออกไปรับผู้ป่วย
                      </div>
                      <div v-if="item.status === 'destination'">
                        ถึงจุดหมายไปรับผู้ป่วย
                      </div>
                      <div v-if="item.status === 'hospital'">
                        กำลังนำส่งโรงพยาบาล
                      </div>
                      <div v-if="item.status === 'complete'">เสร็จสิ้น</div>
                    </td>

                    <td class="">
                      <div class="row d-flex justify-content-center">
                        <div class="col-6">
                          <button
                            @click="case_detail(item.id)"
                            type="button"
                            class="btn btn-primary"
                          >
                            ดูเพิ่มเติม <i class="fas fa-eye"></i>
                          </button>
                        </div>
                      </div>
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
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel" v-if="edit">
                แก้ไขข้อมูลโรงพยาบาล
              </h5>
              <h5 class="modal-title" id="exampleModalLabel" v-else>
                เพิ่มข้อมูลโรงพยาบาล
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
              <!-- <input type="hidden" v-model="id" /> -->
              <div class="form-row">
                <div class="col">
                  <label for="">ชื่อโรงพยาบาล</label>
                  <input type="hidden" v-model="id" />
                  <input
                    v-model="hospital_name"
                    type="text"
                    class="form-control"
                    placeholder="ชื่อโรงพยาบาล"
                  />
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-4">
                  <label for="">ตำบล</label>
                  <input
                    v-model="sub_district"
                    type="text"
                    class="form-control"
                    placeholder="ชื่อโรงพยาบาล"
                  />
                </div>
                <div class="col-4">
                  <label for="">อำเภอ</label>
                  <input
                    v-model="district"
                    type="text"
                    class="form-control"
                    placeholder="ชื่อโรงพยาบาล"
                  />
                </div>
                <div class="col-4">
                  <label for="">จังหวัด</label>
                  <input
                    v-model="province"
                    type="text"
                    class="form-control"
                    placeholder="ชื่อโรงพยาบาล"
                  />
                </div>
              </div>
              <div class="form-row mt-2">
                <div class="col">
                  <label for="">ตำแหน่งโรงพยาบาล</label>
                  <div v-if="error == null">
                    <GoogleMap
                      api-key="AIzaSyCi3XMeHy_-6ikL9-XokRb8B00HaZgENUU"
                      :center="center"
                      :zoom="18"
                      map-type-id="roadmap"
                      style="width: 100%; height: 300px"
                      @click="mapClicked"
                    >
                      <CustomMarker
                        :options="{
                          position: center,
                          anchorPoint: 'BOTTOM_CENTER',
                        }"
                      >
                        <div style="text-align: center">
                          <i
                            class="fas fa-map-marker-alt"
                            style="font-size: 300%; color: #cc0033"
                          ></i>
                        </div>
                      </CustomMarker>
                    </GoogleMap>
                  </div>
                  <div v-else>
                    <p>ผู้ใช้ถูกปฏิเสธการระบุตำแหน่งทางภูมิศาสตร์</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <!--  data-dismiss="modal" -->
              <button
                type="button"
                @click="handleEditHospital"
                class="btn btn-warning"
                v-if="edit"
              >
                บันทึก
              </button>
              <button
                type="button"
                @click="handleInsertHospital"
                class="btn btn-primary"
                v-else
              >
                บันทึก
              </button>
              <button type="button" class="btn btn-danger" @click="closeModal">
                ปิด
              </button>
            </div>
          </div>
        </div>
      </div>
    </template>
  </Layout>
</template>

<script>
import Layout from "../layouts/Layout.vue";
import Jq from "jquery";
import axios from "axios";
import "datatables.net";
import "datatables.net-bs4";
import "datatables.net-bs4/css/dataTables.bootstrap4.css";

export default {
  components: {
    Layout,
  },
  data() {
    return {
      infectious: "",
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
    this.getData();
  },
  methods: {
    async getData() {
      const token = localStorage.getItem("token");
      await axios
        .get(import.meta.env.VITE_API_URL + "/infectious/", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.infectious = res.data.infectious;
          console.log(this.infectious);
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
    case_detail(id) {
      console.log(id);

      this.$router.push({
        path: `/case/infectious/` + id,
      });
      // console.log(id);
    },
  },
};
</script>