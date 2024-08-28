const express = require('express');
const router = express.Router();
const auth = require('../controller/authController');
const authenticateToken = require('../middleware/authMiddleware');

// const reading = fs.readFileSync('D:\Project\server\node_modules\bcrypt\bcrypt.js','utf-8')
router.get('/protected', authenticateToken, (req, res) => {
    res.send('This is a protected route');
});

router.get('/validate', authenticateToken, (req, res) => {
    res.json({
        status : true
    })
});

router.post("/login", auth.login);
// console.log(1234);
module.exports = router;