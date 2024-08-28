const express = require('express');
const router = express.Router();
const multer = require('multer');
// const upload = multer({ dest: 'uploads/' });
const path = require('path');

// Configure multer for file upload
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Append the file extension
    }
});


const upload = multer({ storage: storage });

router.get('/', (req, res) => {
    res.send('asdasd');
});

module.exports = router;