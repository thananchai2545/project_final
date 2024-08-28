const express = require('express');
const router = express.Router();
const symptom = require('../../controller/app/symptomController');
const authenticateToken = require('../../middleware/authMiddleware');


router.get("/", symptom.index, authenticateToken);

module.exports = router;