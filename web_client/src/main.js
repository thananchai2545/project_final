import { createApp } from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import 'viewerjs/dist/viewer.css'
import VueViewer from 'v-viewer'
import 'admin-lte/dist/css/adminlte.min.css'
import 'admin-lte/dist/js/adminlte.min.js'
import '@fortawesome/fontawesome-free/css/all.min.css'
import '@fortawesome/fontawesome-free/js/all.js'

// Create and mount the app
const app = createApp(App)
app.use(router)
app.use(store)
app.use(VueViewer)
app.mount('#app')




