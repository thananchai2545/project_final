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
    { path: '/case', component: casePage, meta: { requiresAuth: true } },
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
