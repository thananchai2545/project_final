<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>ข้อมูลโรงพยาบาล</h4>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <button
                    type="button"
                    class="btn btn-primary"
                    @click="openModal"
                  >
                    เพิ่มข้อมูลโรงพยาบาล
                  </button>
                </ol>
              </div>
            </div>
          </div>
        </section>
        <section class="content">
          <!-- Default box -->
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">ตางรางแสดงข้อมูลโรงพยาบาล</h3>

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
                    <th style="width: 25%">ชื่อโรงพยาบาล</th>
                    <th style="width: 15%">ตำบล</th>
                    <th style="width: 15%">อำเภอ</th>
                    <th style="width: 15%">จังหวัด</th>
                    <!-- <th style="width: 45%">เครื่องมือ</th> -->
                    <th style="width: 25%" class="text-center">จัดการ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(hospital, index) in hospital" :key="index">
                    <td class="text-center">{{ index + 1 }}</td>
                    <td>{{ hospital.hospital_name }}</td>
                    <td>{{ hospital.sub_district }}</td>
                    <td>{{ hospital.district }}</td>
                    <td>{{ hospital.province }}</td>
                    <td class="text-center">
                      <button
                        type="button"
                        @click="openModalEdit(hospital)"
                        class="btn btn-warning"
                      >
                        แก้ไข</button
                      >&nbsp;
                      <button
                        type="button"
                        @click="handleDelete(hospital)"
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
import { GoogleMap, Marker, CustomMarker } from "vue3-google-map";
import { ref } from "vue";
import axios from "axios";
import Swal from "sweetalert2";
import Jq from "jquery";
import "datatables.net";
import "datatables.net-bs4";
import "datatables.net-bs4/css/dataTables.bootstrap4.css";
const token = localStorage.getItem("token");
const edit = ref(true);
export default {
  components: {
    Layout,
    GoogleMap,
    Marker,
    CustomMarker, // FontAwesomeIcon,
  },
  setup() {
    const center = ref({
      lat: null,
      lng: null,
    });

    const markerPosition = ref(center);

    const mapClicked = (event) => {
      markerPosition.value = {
        lat: event.latLng.lat(),
        lng: event.latLng.lng(),
      };
    };
    return {
      center,
      markerPosition,
      mapClicked,
    };
  },
  data() {
    const mapKey = import.meta.env.VITE_MAP_KEY;
    return {
      mapKey,
      hospital: [],
      hospital_name: "",
      district: "",
      sub_district: "",
      province: "",
      error: null,
      edit,
    };
  },
  async mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
    //get current position
    await this.getCurrentposition();
    await this.getHospital();
    await this.initDataTable();
  },
  methods: {
    openModal() {
      edit.value = false;
      this.id = "";
      this.hospital_name = "";
      this.sub_district = "";
      this.district = "";
      this.province = "";
      this.getCurrentposition();
      $("#exampleModal").modal("show");
    },
    openModalEdit(hospital) {
      console.log();
      edit.value = true;
      this.id = hospital.id;
      this.hospital_name = hospital.hospital_name;
      this.sub_district = hospital.sub_district;
      this.district = hospital.district;
      this.province = hospital.province;
      this.center = {
        lat: parseFloat(hospital.lat),
        lng: parseFloat(hospital.lng),
      };
      $("#exampleModal").modal("show");
    },
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    async handleInsertHospital() {
      const lat = this.center.lat;
      const lng = this.center.lng;
      await axios
        .post(
          import.meta.env.VITE_API_URL + "/hospitalRoutes/insert",
          {
            // id: this.id,
            hospital_name: this.hospital_name,
            sub_district: this.sub_district,
            district: this.district,
            province: this.province,
            lat: lat,
            lng: lng,
          },
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        )
        .then((res) => {
          location.reload();
        });
    },
    async handleEditHospital() {
      await axios
        .put(
          import.meta.env.VITE_API_URL + "/hospitalRoutes/update",
          {
            id: this.id,
            hospital_name: this.hospital_name,
            sub_district: this.sub_district,
            district: this.district,
            province: this.province,
            lat: this.center.lat,
            lng: this.center.lng,
          },
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        )
        .then((res) => {
          location.reload();
        });
    },
    handleDelete(hospital) {
      const id = hospital.id;
      Swal.fire({
        title: "คุณต้องการลบข้อมูลนี้ใช่หรือไม่ ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก",
      }).then(async (result) => {
        if (result.isConfirmed) {
          await axios
            .delete(
              import.meta.env.VITE_API_URL + "/hospitalRoutes/delete/" + id,
              {
                headers: {
                  Authorization: `Bearer ${token}`,
                },
              }
            )
            .then((res) => {
              location.reload();
            });
        }
      });
    },
    getCurrentposition() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          (pos) => {
            this.center = {
              lat: pos.coords.latitude,
              lng: pos.coords.longitude,
            };
            this.error = null;
          },
          (err) => {
            this.error = `Error: ${err.message}`;
          }
        );
      } else {
        this.error = "Geolocation is not supported by this browser.";
      }
    },
    async getHospital() {
      await axios
        .get(import.meta.env.VITE_API_URL + "/hospitalRoutes/", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.hospital = res.data.hospital;
        });
    },
    initDataTable() {
      Jq(this.$el).find("#example").DataTable({
        paging: true,
        searching: true,
        responsive: true,
      });
    },
  },
};
</script>

<style>
.map {
  position: relative;
  width: 100%;
  height: 500px;
}

.map::after {
  position: absolute;
  content: "";
  width: 1px;
  height: 100%;
  top: 0;
  left: 50%;
  background: red;
}
</style>
