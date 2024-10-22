const express = require('express');
const router = express.Router();
const exacerbationRouter = require('../../controller/ambulance/exacerbationController');
const authenticateToken = require('../../middleware/authMiddleware');

router.get('/get_case/:id', authenticateToken, exacerbationRouter.getCase);
router.get('/get_tool/:id', authenticateToken, exacerbationRouter.getTool);
router.post('/confirm', authenticateToken, exacerbationRouter.confirm);

module.exports = router;