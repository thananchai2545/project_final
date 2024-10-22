<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>โรคกำเริบ</h4>
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
              <div class="row" v-for="item in exacerbation" :key="item.id">
                <div class="col-6">
                  <div
                    class="row d-flex justify-content-between mr-2 mt-0 p-2 border rounded"
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
                          ถึงจุดหมายของผู้ป่วย
                        </div>
                        <div v-if="item.status === 'hospital'">
                          กำลังนำผู้ป่วยส่งโรงพยาบาล
                        </div>
                        <div v-if="item.status === 'complete'">เสร็จสิ้น</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ข้อมูลผู้ป่วย</b>
                        <div>
                          <div>ผู้ป่วยโรคกำเริบ</div>
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
                      <div class="row d-flex justify-content-between mb-2">
                        <b>ประวัติการแพ้ยาหรือโรคประจำตัว</b>
                        {{ item.drug_allergy }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>การใช้ยาในปัจจุบัน</b>
                        <div>{{ item.prescription_drugs }}</div>
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
                    class="row d-flex justify-content-between mr-2 mt-2 p-2 border rounded"
                  >
                    ข้อมูลเหตุการณ์กำเริบ
                    <div class="col-12 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">วันที่และเวลาเกิดเหตุการณ์</b
                        >{{ item.date_incident }}
                      </div>

                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>สถานที่เกิดเหตุ</b>{{ item.location_incident }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ลักษณะอาการที่กำเริบ</b>
                        {{ item.symptom }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ระยะเวลาที่อาการกำเริบ</b>
                        {{ item.period }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>การดำเนินช่วยเหลือเบื้องต้น</b>{{ item.assistance }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between mb-1 mb-4">
                        <b>เวลาที่แจ้งเหตุ</b>{{ item.date_inform }}
                      </div>
                    </div>
                  </div>

                  <!-- <div class="row">
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
                  </div> -->
                </div>
                <div class="col-6 pr-4">
                  <div
                    class="row d-flex justify-content-between mt-2 p-2 border rounded"
                  >
                    ข้อมูลผู้แจ้งเหตุ
                    <div class="col-12 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">ชื่อ - นามสกุล ผู้แจ้ง</b
                        >{{ item.name_lastname_Informer }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ความสัมพันธ์กับผู้ป่วย</b>
                        {{ item.relationship }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>หมายเลขโทรศัพท์ติดต่อกลับ</b>
                        {{ item.tel }}
                      </div>
                    </div>
                  </div>
                  <div
                    class="row d-flex justify-content-between mt-2 p-2 border rounded"
                  >
                    <div class="col-12 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b>ที่อยู่ผู้ป่วย</b>
                        {{ item.address }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>จุดสังเกต</b>
                        {{ item.landmarks }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between mb-2">
                        <b>รถพยาบาลที่ไปรับผู้ป่วย</b>
                        <div v-if="item.ambulance_id == null">-</div>
                        <div v-else>
                          {{ item.ambulance_driver_name }}({{
                            item.ambulance_registration
                          }})
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-12 mb-1" id="map">
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
                  </div>
                </div>
                <div class="col-11 mt-3">
                  <div
                    class="d-flex justify-content-end"
                    v-if="item.user_id == null"
                  >
                    <button
                      @click="openModal()"
                      type="submit"
                      class="btn btn-warning mr-2"
                    >
                      อนุมัติ
                    </button>
                  </div>
                  <div class="d-flex justify-content-end" v-else>
                    <button
                      @click="openModal()"
                      type="submit"
                      class="btn btn-warning mr-2"
                      disabled
                    >
                      อนุมัติแล้ว
                    </button>
                  </div>
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
              <h5 class="modal-title" id="exampleModalLabel">เลือกอุปกรณ์</h5>
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
                      }})
                    </a>
                  </div>

                  <!-- <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a> -->
                </div>
              </div>
              <div v-for="item in tool" :key="item.id">
                <input
                  v-model="setToolOption"
                  :value="item.id"
                  type="checkbox"
                />
                <label class="ml-2" :for="item.id">{{ item.tool_name }}</label>
              </div>
            </div>
            <div class="modal-footer">
              <!--  data-dismiss="modal" -->

              <button
                type="button"
                @click="handleSelectApprove"
                class="btn btn-warning"
              >
                อนุมัติ
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
import { GoogleMap, Marker } from "vue3-google-map";
import Swal from "sweetalert2";
import axios from "axios";
import { defineComponent } from "vue";
const token = localStorage.getItem("token");
const center = {
  lat: 16.744754,
  lng: 460.202536,
};
export default {
  components: {
    Layout,
    GoogleMap,
    Marker,
  },
  data() {
    return {
      exacerbation: "",
      center,
      status_name: "เลือกสถานะ",
      car_ambulance: "เลือกรถพยาบาล",
      ambulance: "",
      ambulance_id: "",
      status: "",
      tool: "",
      isChecked: false,
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
    this.getAmbulance();
    this.case_data();
    this.getTool();
  },
  methods: {
    getTool() {
      console.log("getTool");
      axios
        .post(
          import.meta.env.VITE_API_URL + "/exacerbation/get_tool",
          {},
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        )
        .then((res) => {
          this.tool = res.data.tool;
        });
      // axios
      //   .post(import.meta.env.VITE_API_URL + "/exacerbation/get_tool", {
      //     headers: {
      //       Authorization: `Bearer ${token}`,
      //     },
      //   })
      //   .then((res) => {
      //     // this.tool = res.data.tool;
      //     console.log(res.data);
      //   });
    },
    openModal() {
      $("#exampleModal").modal("show");
    },
    setCar_ambulance(id, driver_name, ambulance_registration) {
      this.ambulance_id = id;
      console.log(id == null, driver_name);

      if (id == null) {
        this.car_ambulance = "เลือกรถพยาบาล";
      } else {
        this.car_ambulance =
          driver_name +
          " (" +
          ambulance_registration +
          ")" +
          "ต.หลักด่าน อ.น้ำหนาว จ.เพชรบูรณ์";
      }
    },
    set_Status(status_name, status) {
      if (status_name == null) {
        this.status_name = "เลือกรถพยาบาล";
        this.status = "";
      } else {
        this.status_name = status_name;
        this.status = status;
      }
    },
    handleSelectApprove() {
      console.log(this.setToolOption);

      // if (this.ambulance_id == "" || this.ambulance_id == null) {
      //   alert("ขออภัยไม่ได้เลือกรถพยาบาล");
      //   return false;
      // } else if (this.status == null || this.status == "") {
      //   alert("ขออภัยไม่ได้เลือกสถานะ");
      //   return false;
      // } else {
      const id = this.$route.params.id;
      //   console.log(id);
      const user_id = localStorage.getItem("id");

      axios
        .post(
          import.meta.env.VITE_API_URL + "/exacerbation/recieve_case",
          {
            id: id,
            user_id: user_id,
            tool: this.setToolOption,
            ambulance_id: this.ambulance_id,
            status: "2",
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
      // }
    },
    async getAmbulance() {
      console.log(1321);

      await axios
        .post(
          import.meta.env.VITE_API_URL + "/exacerbation/get_ambulance",
          {},
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        )
        .then((res) => {
          this.ambulance = res.data.ambulance;
          console.log(res.data);
        });
    },
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    async case_data() {
      const id = this.$route.params.id;
      await axios
        .get(import.meta.env.VITE_API_URL + "/exacerbation/" + id, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.exacerbation = res.data.exacerbation;
        });
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
        if (result.isConfirmed) {
          const id = this.$route.params.id;
          axios
            .put(
              import.meta.env.VITE_API_URL + "/exacerbation/update_status",
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
  },
};
</script>


