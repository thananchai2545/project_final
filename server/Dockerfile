# ใช้ Node.js LTS ล่าสุด
FROM node:20

# กำหนด working directory
WORKDIR /usr/src/app

# คัดลอก package.json และ package-lock.json
COPY package.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอก source code ทั้งหมด
COPY . .

# ถ้าใช้ port (เช่น Express) เปิด port
EXPOSE 3000

# รันแอป
CMD ["npm", "start"]
