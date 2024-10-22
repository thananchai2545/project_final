const express = require('express');
const router = express.Router();
const exacerbationRouter = require('../controller/exacerbationController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, exacerbationRouter.index,);
router.get("/:id", authenticateToken, exacerbationRouter.indexId,);
router.post("/get_ambulance", authenticateToken, exacerbationRouter.getAmbulance,);
router.post("/get_tool", authenticateToken, exacerbationRouter.getTool,);
router.post("/recieve_case", authenticateToken, exacerbationRouter.receiveCase,);
// router.post("/select_ambulance", authenticateToken, exacerbationRouter.selectAmbulance);
router.put("/update_status", authenticateToken, exacerbationRouter.updateStatus);

module.exports = router;