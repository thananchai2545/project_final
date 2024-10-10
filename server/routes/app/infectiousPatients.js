const express = require('express');
const router = express.Router();
const authenticateToken = require('../../middleware/authMiddleware');
const infectiousRouter = require('../../controller/app/infectiousPatientsController');
router.post("/create", authenticateToken, infectiousRouter.create);

module.exports = router;