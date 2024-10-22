const express = require('express');
const router = express.Router();
const ambulanceRouter = require('../controller/ambulanceController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, ambulanceRouter.index,);
router.get("/get_ambulance", authenticateToken, ambulanceRouter.getAmbulance,);
router.post("/insert", authenticateToken, ambulanceRouter.insert);
router.post("/update", authenticateToken, ambulanceRouter.update);
router.post("/delete", authenticateToken, ambulanceRouter.delete);



module.exports = router;