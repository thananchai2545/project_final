const express = require('express');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });  // Note: without options, multer will use memory storage

const app = express();

app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

app.post('/upload', upload.single('file'), (req, res) => {
    console.log(req.file); // file information
    console.log(req.body); // other form-data
    res.send('File and form data received adadadadasdasdasdsad');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});