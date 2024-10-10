const express = require('express');
const router = express.Router();
const authenticateToken = require('../../middleware/authMiddleware');
const nonEmergencyRouter = require('../../controller/app/nonEmergencyController');
router.post("/create", authenticateToken, nonEmergencyRouter.create);

module.exports = router;