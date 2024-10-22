const express = require('express');
const router = express.Router();
const caseRouter = require('../controller/caseController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, caseRouter.indexAll);
router.get("/index/:id", authenticateToken, caseRouter.index);
router.post("/get_ambulance", authenticateToken, caseRouter.getAmbulance);
router.post("/select_ambulance", authenticateToken, caseRouter.selectAmbulance,);
module.exports = router;