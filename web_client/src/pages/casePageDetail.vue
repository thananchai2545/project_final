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
                <div class="col-xs-12 col-xl-4">
                  <div class="row d-flex justify-content-between">
                    <b class="">สถานะ</b>
                    <div v-if="item.case_status == 'pending'">รอดำเนินการ</div>
                  </div>
                  <div class="row d-flex justify-content-between">
                    <b>ข้อมูลผู้ป่วย</b>
                    <div v-if="item.case_type == 'accident'">
                      <div>อุบัติเหตุ</div>
                    </div>
                  </div>
                  <div class="row d-flex justify-content-between">
                    <b>วันที่แจ้งเหตุ</b>
                    {{ item.case_date }}
                  </div>
                  <div class="row d-flex justify-content-between">
                    <b>จำนวนผู้ป่วย</b>
                    {{ item.case_number_patients }}
                  </div>
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
                        style="width: 100%; height: 500px"
                        :center="center"
                        :zoom="15"
                      >
                        <Marker :options="{ position: center }" />
                      </GoogleMap>
                      <!-- <GoogleMap :key="index" v-for="(m, index) in markers" :draggable="false" api-key="AIzaSyCi3XMeHy_-6ikL9-XokRb8B00HaZgENUU" :location="m.position" width="100%" height="375px" /> -->
                    </div>
                  </div>
                </div>
                <div class="col-xs-12 col-xl-5 px-4">
                  <div class="row d-flex justify-content-between">
                    <b class="">อาการอื่นๆ เพิ่มเติม</b>
                    <div v-if="item.case_other_symptom == ''">ไม่ระบุ</div>
                    <div v-else>
                      {{ item.case_other_symptoms }}
                    </div>
                  </div>
                  <div class="row mt-2">
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
                  <div class="row mt-2">
                    <b>เครื่องมือ</b>
                    <div class="col-12 mt-2">
                      <div class="row">
                        <div
                          class="col-xl-6 col-sm-6 col-lg-4 col-md-6 d-flex align-items-start"
                          v-for="tool in tool"
                          :key="tool.id"
                        >
                          <div class="m-2 d-flex align-items-center">
                            <input
                              type="checkbox"
                              :id="tool.id"
                              :value="tool.id"
                              v-model="setToolOption"
                              disabled
                            />
                          </div>
                          <label class="col-11" :for="tool.id">{{
                            tool.tool_name
                          }}</label>

                          <!-- <div class="col-1">
                                                        <input type="checkbox" :id="tool.id" :value="tool.id" disabled>
                                                    </div>
                                                    <div class="col-11">
                                                        <label class="m-1 " :for="tool.id">{{tool.tool_name}}</label>
                                                    </div> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xs-12 col-xl-3">
                  <div class="row">
                    <div class="col-12"><b>รูปภาพประกอบ</b></div>
                    <div class="col-12">
                      <div class="row">
                        <div
                          class="col-3"
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
                      <div class="row">
                        <div class="col-12">
                          <div class="row mt-2">
                            <b>ผู้ติดต่อ</b>
                          </div>
                          <div class="row d-flex justify-content-between">
                            <b>ชื่อ - นามสกุล</b>
                            <div>{{ item.case_name }}</div>
                          </div>
                          <div class="row d-flex justify-content-between">
                            <b>เบอร์โทรศัพท์</b>
                            <div>
                              {{ item.case_tel }}
                            </div>
                          </div>
                          <div class="row d-flex justify-content-between">
                            <b>หมายเลขบัตรประชาชน</b>
                            <div>{{ item.case_idcard }}</div>
                          </div>
                          <div class="row">
                            <div class="col-12 mt-2">
                              <button type="submit" class="btn btn-primary">
                                รับเคส
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
            <!-- <div class="card-footer">Footer</div> -->
            <!-- /.card-footer-->
          </div>
          <!-- /.card -->
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
      data: [],
      img_,
      case_symptom: [],
      symptom: [],
      setSymptomOption: [],
      tool: [],
      setToolOption: [],
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
    this.symptom_data();
    this.tool_data();
  },
  methods: {
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
          for (const case_tool_id in this.data[id].case_tool) {
            this.setToolOption.push(case_tool_id);
          }
          console.log(this.data[id]);
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

          console.log(this.tool);
        });
      // this.initDataTable();
    },
  },
});
</script>

<style>
</style>
