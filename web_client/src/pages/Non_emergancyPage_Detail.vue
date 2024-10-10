<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>ผู้ป่วยไม่ฉุกเฉิน</h4>
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
              <div class="row" v-for="item in non_emergancy" :key="item.id">
                <div class="col-6">
                  <div class="row d-flex justify-content-between mt-0 mr-4">
                    ข้อมูลผู้ป่วย
                    <div class="col-12 mx-3 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">สถานะ</b>
                        <div v-if="item.status == 'pending'">รอดำเนินการ</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ข้อมูลผู้ป่วย</b>
                        <div>
                          <div>ผู้ป่วยไม่ฉุกเฉิน</div>
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
                    </div>
                  </div>

                  <div class="row d-flex justify-content-between mt-3 mr-4">
                    ข้อมูลอาการ
                    <div class="col-12 mx-3 mt-2">
                      <div class="row d-flex justify-content-between">
                        <b class="">อาการเบื้องต้น</b>
                        {{ item.symptom }}
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>โรคประจำตัว</b>
                        <div v-if="item.disease == ''">-</div>
                        <div v-else>{{ item.disease }}</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between">
                        <b>ประวัติแพ้ยา</b>
                        <div v-if="item.drug_allergy == ''">-</div>
                        <div v-else>{{ item.drug_allergy }}</div>
                      </div>
                      <hr class="mt-1 mb-1" />
                      <div class="row d-flex justify-content-between mb-2">
                        <b>แพทย์รักษาประจำ</b>
                        <div v-if="item.doctor == ''">-</div>
                        <div v-else>{{ item.doctor }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-6 pr-4">
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
                        :center="center"
                        :zoom="15"
                      >
                        <Marker :options="{ position: center }" />
                      </GoogleMap>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 mt-3 d-flex justify-content-end">
                  <button type="submit" class="btn btn-danger mr-3">
                    ปฎิเสธ
                  </button>
                  <button
                    @click="case_status()"
                    type="submit"
                    class="btn btn-primary"
                  >
                    แก้ไขสถานะ
                  </button>
                </div>
              </div>
            </div>
          </div>
        </section>
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
const center = {
  lat: 16.744754,
  lng: 460.202536,
};
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
      non_emergancy: "",
      center,
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
    // this.symptom_data();
    // this.tool_data();
  },
  methods: {
    async case_data() {
      const id = this.$route.params.id;
      await axios
        .get(import.meta.env.VITE_API_URL + "/non_emergancy/" + id, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.non_emergancy = res.data.non_emergancy;
        });
    },
    case_status() {
      console.log("adad");
    },
  },
});
</script>

<style>
</style>
