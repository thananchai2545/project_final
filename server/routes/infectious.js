const express = require('express');
const router = express.Router();
const infectiousRouter = require('../controller/infectiousController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, infectiousRouter.index,);
router.get("/:id", authenticateToken, infectiousRouter.indexId,);
router.put("/update_status", authenticateToken, infectiousRouter.updateStatus,);
router.post("/select_ambulance", authenticateToken, infectiousRouter.selectAmbulance,);
router.post("/get_tool", authenticateToken, infectiousRouter.getTool,);

module.exports = router;