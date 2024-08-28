const express = require('express');
const router = express.Router();
const tool = require('../controller/toolController');
const authenticateToken = require('../middleware/authMiddleware');
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

router.get("/", tool.index, authenticateToken)
router.post("/store", upload.single('tool_img'), tool.insert ,authenticateToken)
router.post("/update", upload.single('tool_img'), tool.update ,authenticateToken)
router.post("/delete", tool.delete, authenticateToken)


module.exports = router;