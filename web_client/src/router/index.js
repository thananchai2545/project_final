import { createRouter, createWebHistory } from 'vue-router'
// import store from '../store' 

// Import Vue components
import userPage from '../pages/userPage.vue'
// import AboutPage from '../pages/AboutPage.vue'
import LoginPage from '../pages/LoginPage.vue'
import TestPage from '../pages/TestPage.vue'
import toolPage from '../pages/toolPage.vue'
import symptomPage from '../pages/symptomPage.vue'
import casePage from '../pages/casePage.vue'
import casePageDetail from '../pages/casePageDetail.vue'
import hospitalPage from '../pages/hospitalPage.vue'
import exacerbationPage from '../pages/ExacerbationPage.vue'
import exacerbationPage_Detail from '../pages/ExacerbationPage_Detail.vue'
import non_emergancyPage from '../pages/Non_emergancyPage.vue'
import non_emergancyPage_Detail from '../pages/Non_emergancyPage_Detail.vue'
import infectiousPage from '../pages/infectiousPage.vue'
import infectiousPage_Detail from '../pages/infectiousPage_Detail.vue'
import AmbulancePage from '../pages/AmbulancePage.vue'
// import { image } from '@vee-validate/rules'
import axios from 'axios'
// import store from '../store'
// import { isAuthenticated } from '@/services/AuthService';

// Define routes
const routes = [

    { path: '/', component: LoginPage },
    { path: '/user', component: userPage, meta: { requiresAuth: true } },
    { path: '/tool', component: toolPage, meta: { requiresAuth: true } },
    { path: '/symptom', component: symptomPage, meta: { requiresAuth: true } },
    // { path: '/case', component: casePage, meta: { requiresAuth: true } },ambulance
    { path: '/case/accident', component: casePage, meta: { requiresAuth: true } },
    { path: '/case/exacerbation', component: exacerbationPage, meta: { requiresAuth: true } },
    { path: '/case/exacerbation/:id', component: exacerbationPage_Detail, meta: { requiresAuth: true } },
    { path: '/case/non_emergency', component: non_emergancyPage, meta: { requiresAuth: true } },
    { path: '/case/non_emergency/:id', component: non_emergancyPage_Detail, meta: { requiresAuth: true } },
    { path: '/case/infectious', component: infectiousPage, meta: { requiresAuth: true } },
    { path: '/case/infectious/:id', component: infectiousPage_Detail, meta: { requiresAuth: true } },
    { path: '/ambulance', component: AmbulancePage, meta: { requiresAuth: true } },
    { path: '/hospital', component: hospitalPage, meta: { requiresAuth: true } },
    { path: '/case/detail/:id', component: casePageDetail, meta: { requiresAuth: true } },
    { path: '/test', component: TestPage }
]

// Create router instance
const router = createRouter({
    history: createWebHistory(),
    routes
})

router.beforeEach((to, from, next) => {
    const token = localStorage.getItem('token');
    if (to.matched.some(record => record.meta.requiresAuth)) {
        axios.get(import.meta.env.VITE_API_URL + '/auth/validate', {
            headers: {
                Authorization: `Bearer ${token}`,
            },
        }).then((response) => {
            // console.log(response);
            next();
        }).catch(error => {
            localStorage.removeItem('token');
            next({
                path: '/',
                query: { redirect: to.fullPath }
            });
        });
    } else {
        next(); // Proceed to non-protected routes
    }
});

export default router
