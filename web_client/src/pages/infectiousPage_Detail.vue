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
            </div>
          </div>
        </section>
        <section class="content">
          <!-- Default box -->
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">รายละเอียดการแจ้งเหตุ</h3>

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
              <div class="row" v-for="item in infectious" :key="item.id">
                <div class="col-6">
                  <div
                    class="row d-flex justify-content-between mr-2 p-2 border rounded"
                  >
                    ข้อมูลผู้ป่วย
                    <div class="col-12 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">สถานะ</b>
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
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ข้อมูลผู้ป่วย</b>
                        <div>
                          <div>ผู้ป่วยโรคติดต่อ</div>
                        </div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ชื่อ - นามสกุล</b>
                        {{ item.name_lastname }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>อายุ</b>
                        {{ item.age }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>เพศ</b>
                        <div v-if="item.sex == 'man'">ชาย</div>
                        <div v-if="item.sex == 'female'">หญิง</div>
                        <div v-if="item.sex == 'not_specified'">ไม่ระบุ</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>เบอร์โทรศัพท์</b>
                        {{ item.tel }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>เจ้าหน้าที่รับเคส</b>
                        <div v-if="item.user_id == null">-</div>
                        <div v-else>
                          {{ item.user_name }} {{ item.user_lastname }}
                        </div>
                      </div>
                    </div>
                  </div>

                  <div
                    class="row d-flex justify-content-between p-2 mt-2 mr-2 border rounded"
                  >
                    การวินิจฉัยโรค
                    <div class="col-12 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">ชื่อโรค</b>
                        {{ item.name_disease }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>อาการของโรค</b>
                        <div v-if="item.disease == ''">-</div>
                        <div v-else>{{ item.symptom }}</div>
                      </div>
                      <hr class="mt-1 mb-1" />

                      <div class="row d-flex justify-content-between mb-2">
                        <b>ระยะเวลาการติดเชื้อ</b>
                        <div v-if="item.period == ''">-</div>
                        <div v-else>{{ item.period }}</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between mb-2">
                        <b>โรงพยาบาลที่ต้องเดินทาง</b>
                        {{ item.hospital_name }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between mb-4">
                        <b>รถพยาบาลที่ไปรับ</b>
                        <div v-if="item.ambulance_id == null">-</div>
                        <div v-else>
                          {{ item.ambulance_driver_name }} ({{
                            item.ambulance_registration
                          }})
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-6 border p-4 rounded">
                  <div class="row d-flex justify-content-between">
                    <b> วันที่ต้องการใช้บริการ</b>
                    {{ item.date_service }}
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b> เวลาต้องการใช้บริการ</b>
                    {{ item.time_service }}
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b> ที่อยู่ปัจจุบัน</b>
                    {{ item.address }}
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between mb-2">
                    <b> จุดสังเกต</b>
                    {{ item.landmark }}
                  </div>
                  <div class="row">
                    <div class="col-12" id="map">
                      <GoogleMap
                        api-key="AIzaSyCi3XMeHy_-6ikL9-XokRb8B00HaZgENUU"
                        style="width: 100%; height: 300px"
                        :center="{
                          lat: Number(item.lat),
                          lng: Number(item.lng),
                        }"
                        :zoom="15"
                      >
                        <Marker
                          :options="{
                            position: {
                              lat: Number(item.lat),
                              lng: Number(item.lng),
                            },
                          }"
                        />
                      </GoogleMap>
                    </div>
                  </div>
                </div>
                <div class="col-11 mt-3">
                  <div class="d-flex justify-content-end">
                    <button
                      v-if="item.user_id == null"
                      @click="openModal()"
                      type="submit"
                      class="btn btn-warning mr-2"
                    >
                      อนุมัติเคส
                    </button>
                    <button
                      v-else
                      @click="openModal()"
                      type="submit"
                      class="btn btn-warning mr-2"
                      disabled
                    >
                      อนุมัติแล้ว
                    </button>
                  </div>

                  <div class="d-flex justify-content-end"></div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">รับเคส</h5>
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
                <label for="">เลือกรถพยาบาล</label>
                <input type="hidden" v-model="id" />
              </div>
              <div class="dropdown">
                <button
                  class="btn btn-secondary dropdown-toggle col-12"
                  type="button"
                  data-toggle="dropdown"
                  aria-expanded="false"
                >
                  {{ car_ambulance }}
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a
                    @click="setCar_ambulance(null, 'เลือกรถพยาบาล', '')"
                    class="dropdown-item"
                    href="#"
                    >เลือกรถพยาบาล</a
                  >
                  <div v-for="item in ambulance" :key="item.id">
                    <a
                      @click="
                        setCar_ambulance(
                          item.id,
                          item.driver_name,
                          item.ambulance_registration
                        )
                      "
                      class="dropdown-item"
                      href="#"
                      >{{ item.driver_name }} ({{
                        item.ambulance_registration
                      }})</a
                    >
                  </div>
                </div>
              </div>
              <div class="dropdown mt-2">
                <div v-for="item in tool" :key="item.id">
                  <input
                    class="mr-2"
                    type="checkbox"
                    :value="item.id"
                    v-model="setToolOption"
                  />
                  <label :for="item.id">{{ item.tool_name }}</label>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <!--  data-dismiss="modal" -->

              <button
                type="button"
                @click="handleSelectAmbulance"
                class="btn btn-warning"
              >
                รับเคส
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
// import Layout from '../layouts/Layout.vue';
import Layout from "../layouts/Layout.vue";
import { GoogleMap, Marker } from "vue3-google-map";
import Swal from "sweetalert2";
import axios from "axios";
import { defineComponent } from "vue";

// const img_ = import.meta.env.VITE_URL_IMG;
const token = localStorage.getItem("token");

export default defineComponent({
  components: {
    Layout,
    GoogleMap,
    Marker,
  },
  data() {
    return {
      infectious: "",
      status_name: "เลือกสถานะ",
      car_ambulance: "เลือกรถพยาบาล",
      ambulance: "",
      ambulance_id: "",
      status: "",
      tool: "",
      setToolOption: [],
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
    this.case_data();
    this.getAmbulance();
    this.getTool();
    // this.symptom_data();
    // this.tool_data();
  },
  methods: {
    getTool() {
      axios
        .post(
          import.meta.env.VITE_API_URL + "/infectious/get_tool",
          {},
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        )
        .then((response) => {
          this.tool = response.data.tool;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    setCar_ambulance(id, driver_name, ambulance_registration) {
      this.ambulance_id = id;
      console.log(id == null, driver_name);

      if (id == null) {
        this.car_ambulance = "เลือกรถพยาบาล";
      } else {
        this.car_ambulance = driver_name + " (" + ambulance_registration + ")";
      }
    },
    async getAmbulance() {
      await axios
        .get(import.meta.env.VITE_API_URL + "/ambulance/get_ambulance", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.ambulance = res.data.ambulance;
          console.log(this.ambulance);
        });
    },
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    openModal() {
      $("#exampleModal").modal("show");
    },
    update_status(text, status) {
      // console.log("status");
      Swal.fire({
        // title: "อัปเดตสถานะ " + text,
        text: "อัปเดตสถานะ " + text,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "ตกลง",
        cancelButtonText: "ยกเลิก",
      }).then((result) => {
        console.log(result);
        // Swal.fire({
        //   title: "success",
        //   text: "Your file has been deleted.",
        //   icon: "success",
        // });
        if (result.isConfirmed) {
          const id = this.$route.params.id;
          axios
            .put(
              import.meta.env.VITE_API_URL + "/infectious/update_status",
              {
                id: id,
                status: status,
              },
              {
                headers: {
                  Authorization: `Bearer ${token}`,
                },
              }
            )
            .then((res) => {
              Swal.fire({
                title: "success",
                text: "Your file has been deleted.",
                icon: "success",
              }).then((result) => {
                if (result.isConfirmed) {
                  location.reload();
                }
              });
            });
        }
      });
    },
    async case_data() {
      const id = this.$route.params.id;
      await axios
        .get(import.meta.env.VITE_API_URL + "/infectious/" + id, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.infectious = res.data.infectious;
        });
    },
    handleSelectAmbulance() {
      if (this.ambulance_id == "" || this.ambulance_id == null) {
        alert("ขออภัยไม่ได้เลือกรถพยาบาล");
        return false;
      } else {
        const id = this.$route.params.id;
        const user_id = localStorage.getItem("id");
        // console.log(this.setToolOption);

        axios
          .post(
            import.meta.env.VITE_API_URL + "/infectious/select_ambulance",
            {
              id: id,
              user_id: user_id,
              tool: this.setToolOption,
              ambulance_id: this.ambulance_id,
              status: "receive",
              // date_receive: new Date().toISOString().slice(0, 10),
            },
            {
              headers: {
                Authorization: `Bearer ${token}`,
              },
            }
          )
          .then((res) => {
            window.location.reload();
          });
      }
    },
  },
});
</script>

<style>
</style>
