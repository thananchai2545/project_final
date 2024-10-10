const express = require('express');
const router = express.Router();
const authenticateToken = require('../../middleware/authMiddleware');
const exacerbationRouter = require('../../controller/app/exacerbationController');
router.post("/create", authenticateToken, exacerbationRouter.create);

module.exports = router;