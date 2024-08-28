const express = require('express');
const router = express.Router();
const symptom = require('../controller/symptomController');
const authenticateToken = require('../middleware/authMiddleware');



router.get("/", symptom.index, authenticateToken);
router.post("/store", symptom.insert, authenticateToken)
router.post("/delete", symptom.delete, authenticateToken)
router.post("/update", symptom.update, authenticateToken)

module.exports = router;