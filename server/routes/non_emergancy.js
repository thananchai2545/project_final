const express = require('express');
const router = express.Router();
const non_emergancyRouter = require('../controller/non_emergancyController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, non_emergancyRouter.index,);
router.get("/:id", authenticateToken, non_emergancyRouter.indexId,);

module.exports = router;