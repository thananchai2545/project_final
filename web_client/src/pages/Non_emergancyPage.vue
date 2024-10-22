<template>
  <Layout>
    <template v-slot:default>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6">
                <h4>ผู้ป่วยทั่วไป</h4>
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
                  <tr v-for="(item, index) in non_emergancy" :key="item.id">
                    <td class="text-center">{{ index + 1 }}</td>
                    <td>{{ item.name_lastname }}</td>
                    <td>{{ item.tel }}</td>
                    <td>ผู้ป่วยทั่วไป</td>
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

                    <td class="text-center">
                      <button
                        @click="case_detail(item.id)"
                        type="button"
                        class="btn btn-primary"
                      >
                        ดูเพิ่มเติม <i class="fas fa-eye"></i>
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
      non_emergancy: "",
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
        .get(import.meta.env.VITE_API_URL + "/non_emergancy/", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.non_emergancy = res.data.non_emergancy;
          console.log(this.non_emergancy);
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
        path: `/case/non_emergency/` + id,
      });
      // console.log(id);
    },
  },
};
</script>