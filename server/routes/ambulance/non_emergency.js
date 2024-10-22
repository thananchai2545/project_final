const express = require('express');
const router = express.Router();
const non_emergencyRouter = require('../../controller/ambulance/non_emergencyController');
const authenticateToken = require('../../middleware/authMiddleware');

router.get('/get_case/:id', authenticateToken, non_emergencyRouter.getCase);
router.get('/get_tool/:id', authenticateToken, non_emergencyRouter.getTool);
router.post('/confirm', authenticateToken, non_emergencyRouter.confirm);

module.exports = router;