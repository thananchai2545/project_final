const express = require('express');
const router = express.Router();
const accidentRouter = require('../../controller/ambulance/accidentController');
const authenticateToken = require('../../middleware/authMiddleware');

router.get('/get_case/:id', authenticateToken, accidentRouter.index);
router.post('/get_symptom', authenticateToken, accidentRouter.getSymptom);
router.post('/get_tool/:id', authenticateToken, accidentRouter.getTool);
router.post('/get_image', authenticateToken, accidentRouter.getImage);
router.post('/confirm', authenticateToken, accidentRouter.confirm);
module.exports = router;