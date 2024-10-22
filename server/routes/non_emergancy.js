const express = require('express');
const router = express.Router();
const non_emergancyRouter = require('../controller/non_emergancyController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, non_emergancyRouter.index,);
router.get("/:id", authenticateToken, non_emergancyRouter.indexId,);
router.post("/select_ambulance", authenticateToken, non_emergancyRouter.selectAmbulance,);
router.put("/update_status", authenticateToken, non_emergancyRouter.updateStatus,);
router.post("/get_tool", authenticateToken, non_emergancyRouter.getTool,);

module.exports = router;