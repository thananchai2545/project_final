const express = require('express');
const router = express.Router();
const infectiousRouter = require('../../controller/ambulance/infectiousController');
const authenticateToken = require('../../middleware/authMiddleware');

router.get('/get_case/:id', authenticateToken, infectiousRouter.getCase);
router.get('/get_tool/:id', authenticateToken, infectiousRouter.getTool);
router.post('/confirm', authenticateToken, infectiousRouter.confirm);


module.exports = router;