const express = require('express');
const router = express.Router();
const ambulanceRouter = require('../../controller/ambulance/ambulanceController');
const authenticateToken = require('../../middleware/authMiddleware');
router.get('/validate', authenticateToken, (req, res) => {

    res.json({
        status: true
    })
});
router.post('/login', ambulanceRouter.login);
router.post('/status', authenticateToken, ambulanceRouter.status);
router.get('/get_case/:id', authenticateToken, ambulanceRouter.getCase);
router.get('/get_ambulance/:id', authenticateToken, ambulanceRouter.getAmbulance);

module.exports = router;