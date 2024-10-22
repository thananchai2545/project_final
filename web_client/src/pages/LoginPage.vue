<template lang="">
<div class="login-box">
    <div class="login-logo"> <a href="../../index2.html"><b>Admin</b>LTE</a> </div> <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in
                to start your session</p>
            <Form :validation-schema="validationSchema" @submit="submitForm" methods="post">
                <div class="form-group">
                    <Field name="username" type="text" placeholder="Username" class="form-control" v-model="username" />
                    <ErrorMessage name="username" />
                </div>
                <div class="form-group">
                    <Field name="password" type="password" placeholder="Password" class="form-control" v-model="password" />
                    <ErrorMessage name="password" />
                </div>
                <div class="row">
                    <div class="col-12"> <button type="submit"  class="btn btn-primary btn-block">Sign In</button> </div>
                </div>
            </Form>
        </div>
    </div>
</div>
</template>

<script>
import { useRouter } from "vue-router";
import axios from "axios";
import { Form, Field, ErrorMessage } from "vee-validate";
import * as Yup from "yup";

const router = useRouter();

const validationSchema = Yup.object().shape({
  username: Yup.string().required("Username is required"),
  password: Yup.string().required("Password is required"),
  // Add more validation rules as needed
});

export default {
  components: {
    Form,
    Field,
    ErrorMessage,
  },
  setup() {
    return {
      validationSchema,
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      localStorage.removeItem("reloaded");
    } else {
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
  },
  methods: {
    initFunction: function () {
      document.body.classList.toggle("hold-transition");
      document.body.classList.toggle("login-page");
    },
    submitForm() {
      let self = this;

      axios
        .post(import.meta.env.VITE_API_URL + "/auth/login", {
          username: this.username,
          password: this.password,
        })
        .then(function (response) {
          //   localStorage.setItem("token",response.data.token)
          // console.log(response.data.data[0].id);
          self.$store.commit("setToken", response.data.token);
          self.$store.commit("setId", response.data.data[0].id);
          self.$router.push("/user");
        });
    },
  },

  created: function () {
    this.initFunction();
  },
};

methods: {
}
</script>
