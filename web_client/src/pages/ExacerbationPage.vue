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
                    <th>เลขบัตรประชาชน</th>
                    <th>ประเภท</th>
                    <th>อาการ</th>
                    <th>เครื่องมือ</th>
                    <!-- <th style="width: 45%">เครื่องมือ</th> -->
                    <th style="width: 20%" class="text-center">จัดการ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(item, index) in exacerbation" :key="item.id">
                    <td class="text-center">{{ index + 1 }}</td>
                    <td>{{ item.name_lastname }}</td>
                    <td>{{ item.case_tel }}</td>
                    <td>{{ item.case_idcard }}</td>
                    <td>
                      {{ item.type }}
                    </td>
                    <td></td>
                    <td></td>

                    <td class="text-center">
                      <!-- <button
                        @click="case_detail(key)"
                        type="button"
                        class="btn btn-primary"
                      >
                        ดูเพิ่มเติม <i class="fas fa-eye"></i>
                      </button> -->

                      &nbsp;
                      <button
                        type="button"
                        @click="openModal(item)"
                        class="btn btn-warning"
                      >
                        รับเคส
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
      exacerbation: "",
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
        .get(import.meta.env.VITE_API_URL + "/exacerbation/", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          this.exacerbation = res.data.exacerbation;
          console.log(this.exacerbation);
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
  },
};
</script>