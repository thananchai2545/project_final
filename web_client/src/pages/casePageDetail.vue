<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <section class="content-header">
          <!-- <div class="container-fluid">
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
                </div> -->
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
              <div class="row" v-for="item in data" :key="item.name">
                <div class="col-6 border rounded pt-3 pr-4 pl-4 pb-3">
                  <div class="row d-flex justify-content-between">
                    <b>ข้อมูลผู้ป่วย</b>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b class="">สถานะ</b>
                    <div v-if="item.case_status === 'inform'">
                      รอการอนุมัติเหตุ
                    </div>
                    <div v-if="item.case_status === 'receive'">
                      เตรียมอุปกรณ์ออกไปรับผู้ป่วย
                    </div>
                    <div v-if="item.case_status === 'departure'">
                      กำลังออกไปรับผู้ป่วย
                    </div>
                    <div v-if="item.case_status === 'destination'">
                      ถึงจุดหมายไปรับผู้ป่วย
                    </div>
                    <div v-if="item.case_status === 'hospital'">
                      กำลังนำผู้ป่วยส่งโรงพยาบาล
                    </div>
                    <div v-if="item.case_status === 'complete'">เสร็จสิ้น</div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b>วันที่แจ้งเหตุ</b>
                    {{ item.date_receive }}
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b>ประเภท</b>
                    <div v-if="item.case_type == 'accident'">อุบัติเหตุ</div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b class="">การหายใจ</b>
                    <div v-if="item.case_breathing == 'breathe'">หายใจ</div>
                    <div v-else-if="item.case_breathing == 'not_breathe'">
                      ไม่หายใจ
                    </div>
                    <div v-else>ไม่แน่ใจ</div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b class="">อาการอื่นๆ เพิ่มเติม</b>
                    <div v-if="item.case_other_symptom == ''">ไม่ระบุ</div>
                    <div v-else>
                      {{ item.case_other_symptoms }}
                    </div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row mt-2">
                    <div class="col-12">
                      <b>อาการเบื้องต้น</b>
                      <div class="col-12">
                        <div class="row">
                          <div
                            class="col-xl-6 col-sm-6 col-md-6 col-lg-4"
                            v-for="symptom in symptom"
                            :key="symptom.symptom_id"
                          >
                            <input
                              class="m-2"
                              type="checkbox"
                              :id="symptom.id"
                              :value="symptom.id"
                              v-model="setSymptomOption"
                              disabled
                            />
                            <label :for="symptom.id">{{
                              symptom.symptom_name
                            }}</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row">
                    <div class="col-12 mb-2"><b>รูปภาพประกอบ</b></div>
                    <div class="col-12">
                      <div class="row">
                        <div
                          v-for="image in item.case_image"
                          :key="image.id"
                          v-viewer
                        >
                          <img
                            style="padding: 0; width: 100px"
                            :src="img_ + '/' + image.case_image_path"
                            alt=""
                          />
                        </div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>เจ้าหน้าที่รับเคส</b>
                        <div v-if="item.user_id == null">-</div>
                        <div v-else>
                          {{ item.user_name }} {{ item.user_lastname }}
                        </div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>รถพยาบาลที่ไปรับผู้ป่วย</b>
                        <div v-if="item.ambulance_id == null">-</div>
                        <div v-else>
                          {{ item.ambulance_driver_name }}
                          ({{ item.ambulance_registration }})
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-6 border rounded pt-3 pr-4 pl-4 pb-3">
                  <div class="row">
                    <div class="col-12">
                      <div class="row mt-2">
                        <b>ผู้ติดต่อ</b>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ชื่อ - นามสกุล</b>
                        <div>{{ item.case_name }}</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>เบอร์โทรศัพท์</b>
                        <div>
                          {{ item.case_tel }}
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr class="mt-1 mb-1" />
                  <div class="row d-flex justify-content-between">
                    <b>สถานที่เกิดเหตุ</b>
                    <div
                      v-if="
                        item.case_location_landmark == null ||
                        item.case_location_landmark == ''
                      "
                    >
                      ไม่ระบุ
                    </div>
                    <div v-else>{{ item.case_location_landmark }}</div>
                  </div>
                  <div class="row">
                    <div class="col-12" id="map">
                      <GoogleMap
                        api-key="AIzaSyCi3XMeHy_-6ikL9-XokRb8B00HaZgENUU"
                        style="width: 100%; height: 350px"
                        :center="{
                          lat: Number(item.case_lat),
                          lng: Number(item.case_lng),
                        }"
                        :zoom="15"
                      >
                        <Marker
                          :options="{
                            position: {
                              lat: Number(item.case_lat),
                              lng: Number(item.case_lng),
                            },
                          }"
                        />
                      </GoogleMap>
                      {{ item.case_lat }}
                      <!-- <GoogleMap :key="index" v-for="(m, index) in markers" :draggable="false" api-key="AIzaSyCi3XMeHy_-6ikL9-XokRb8B00HaZgENUU" :location="m.position" width="100%" height="375px" /> -->
                    </div>
                  </div>
                </div>
                <div class="col-12 mt-2">
                  <div class="col-12 d-flex justify-content-end">
                    <button
                      class="btn btn-primary"
                      v-if="item.user_id == null"
                      @click="openModal()"
                      type="submit"
                    >
                      อนุมัติ
                    </button>
                    <button
                      class="btn btn-primary"
                      v-else
                      @click="openModal()"
                      type="submit"
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
import axios from "axios";
import { defineComponent } from "vue";
const img_ = import.meta.env.VITE_URL_IMG;
const token = localStorage.getItem("token");
export default defineComponent({
  components: {
    Layout,
    GoogleMap,
    Marker,
    // GoogleMap
  },
  data() {
    return {
      data: [],
      img_,
      case_symptom: [],
      symptom: [],
      setSymptomOption: [],
      tool: [],
      setToolOption: [],
      ambulance: "",
      ambulance_id: "",
      car_ambulance: "เลือกรถพยาบาล",
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
    this.symptom_data();
    this.tool_data();
    this.getAmbulance();
  },
  methods: {
    closeModal() {
      $("#exampleModal").modal("hide");
    },
    openModal() {
      $("#exampleModal").modal("show");
    },
    handleSelectAmbulance() {
      if (this.car_ambulance == "เลือกรถพยาบาล") {
        alert("กรุณาเลือกรถพยาบาล");
      } else if (this.setToolOption.length == 0) {
        alert("กรุณาเลือกอุปกรณ์");
      } else {
        const id = this.$route.params.id;
        //   console.log(id);
        const user_id = localStorage.getItem("id");
        axios
          .post(
            import.meta.env.VITE_API_URL + "/caseRoutes/select_ambulance",
            {
              id: id,
              user_id: user_id,
              ambulance_id: this.ambulance_id,
              tool: this.setToolOption,
            },
            {
              headers: {
                Authorization: `Bearer ${token}`,
              },
            }
          )
          .then((res) => {
            if (res.data.status == "success") {
              alert("รับเคสสําเร็จ");
              location.reload();
            }
          });
      }
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
    async case_data() {
      const id = this.$route.params.id;
      // const token = localStorage.getItem("token");
      await axios
        .get(import.meta.env.VITE_API_URL + "/caseRoutes/index/" + id, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.data = res.data.case;
          for (const case_symptom_id in this.data[id].case_symptom) {
            this.setSymptomOption.push(case_symptom_id);
          }
        });
      // this.initDataTable();
    },
    async symptom_data() {
      // const id = this.$route.params.id
      await axios
        .get(import.meta.env.VITE_API_URL + "/symptom", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.symptom = res.data.data_symptom;
        });
      // this.initDataTable();
    },
    async tool_data() {
      await axios
        .get(import.meta.env.VITE_API_URL + "/tool", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.tool = res.data.data;
        });
      // this.initDataTable();
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
  },
});
</script>

<style>
</style>
