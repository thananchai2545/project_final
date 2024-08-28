import { createApp } from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import 'viewerjs/dist/viewer.css'
import VueViewer from 'v-viewer'
// Create and mount the app
const app = createApp(App)
app.use(router)
app.use(store)
app.use(VueViewer)
app.mount('#app')




