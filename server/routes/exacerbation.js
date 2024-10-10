const express = require('express');
const router = express.Router();
const exacerbationRouter = require('../controller/exacerbationController');
const authenticateToken = require('../middleware/authMiddleware');

router.get("/", authenticateToken, exacerbationRouter.index,);

module.exports = router;