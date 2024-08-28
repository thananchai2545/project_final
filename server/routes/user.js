const express = require('express');
const router = express.Router();
const user = require('../controller/userController');
const authenticateToken = require('../middleware/authMiddleware');

// router.post('/login', userController.login);
// router.post('/items', userController.createItem);
// router.get('/items', userController.getItems);
// router.get('/items/:id', userController.getItemById);
// router.put('/items/:id', userController.updateItem);
// router.delete('/items/:id', userController.deleteItem);
router.get("/", user.index, authenticateToken);
router.post("/store", user.store, authenticateToken);
router.post("/update", user.update, authenticateToken); 
router.post("/delete", user.delete ,authenticateToken)
// router.post("/update", user.update, authenticateToken); 

module.exports = router;