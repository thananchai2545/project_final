# Dockerfile
FROM node:20

WORKDIR /app

# คัดลอก package.json และติดตั้ง dependencies
COPY package*.json ./
RUN npm install

# คัดลอก source code
COPY . .

# เปิด port 5173 (Vite default) หรือ 8080 (Vue CLI)
EXPOSE 80

# รัน dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "80"]
