const express = require('express');
const router = express.Router();
const hospitalRouter = require('../controller/hospitalController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, hospitalRouter.index,);
router.post("/insert", authenticateToken, hospitalRouter.insert);
router.put("/update", authenticateToken, hospitalRouter.update);
router.delete("/delete/:id", authenticateToken, hospitalRouter.delete);


module.exports = router;