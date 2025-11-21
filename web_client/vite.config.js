import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],

  define: {
    'process.env': process.env
  },
  server: {
    host: '0.0.0.0',
    port: 80,
    proxy: {
      '/api': {
        target: process.env.VITE_API_URL,
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      },
      '/uploads': {
        target: process.env.VITE_URL_IMG,
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\//, '')
      }
    }
  },

})
