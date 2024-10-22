const express = require('express');
const router = express.Router();
const mapRouter = require('../../controller/ambulance/mapController');
const authenticateToken = require('../../middleware/authMiddleware');

router.get('/get_location/:id', authenticateToken, mapRouter.getLocation);
router.post('/update_status', authenticateToken, mapRouter.updateStatus);


module.exports = router;