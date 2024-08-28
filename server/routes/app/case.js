const express = require('express');
const path = require('path');
const router = express.Router();
const caseRouter = require('../../controller/app/caseController');
const authenticateToken = require('../../middleware/authMiddleware');

const multer = require('multer');
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'upload/case_uploads');
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Append the file extension
    }
});
// var upload = multer({ dest: 'upload/' });
const upload = multer({ storage: storage });
// router.get("/login", member.create, authenticateToken);
var type = upload.array('case_image', 6);

router.get("/:id", authenticateToken, caseRouter.index);
router.post("/create", type, authenticateToken, caseRouter.create);

module.exports = router;
// authenticateToken
// , caseRoter.create,