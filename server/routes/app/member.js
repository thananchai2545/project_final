const express = require('express');
const path = require('path');
const router = express.Router();
const member = require('../../controller/app/memberController');
const authenticateToken = require('../../middleware/authMiddleware');
const multer = require('multer');
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'member_upload/');
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Append the file extension
    }
});
// var upload = multer({ dest: 'upload/' });
const upload = multer({ storage: storage });
// router.get("/login", member.create, authenticateToken);
var type = upload.single('member_img');

router.post("/register", type, member.create);
router.post("/login", member.login);
router.get("/profile/:id", authenticateToken, member.index,);


router.get('/validate', authenticateToken, (req, res) => {
    res.json({
        status: true
    })
});

module.exports = router;