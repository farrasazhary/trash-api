const express = require('express');
const router = express.Router();
const { register, login, logout, getProfile } = require('../controllers/authController');
const { verifyToken } = require('../middleware/auth');

// Public — tidak perlu token
router.post('/register', register);
router.post('/login', login);

// Protected — perlu token
router.post('/logout', verifyToken, logout);
router.get('/me', verifyToken, getProfile);

module.exports = router;
