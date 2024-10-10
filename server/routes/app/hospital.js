const express = require('express');
const router = express.Router();
const authenticateToken = require('../../middleware/authMiddleware');
const hospitalRouter = require('../../controller/app/hospitalController');
router.get("/index", authenticateToken, hospitalRouter.index);

module.exports = router;