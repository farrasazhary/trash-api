const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const { calculate } = require('../controllers/ahpController');

// Endpoint utama AHP — hanya admin yang bisa menjalankan perhitungan
router.post('/', verifyToken, adminOnly, calculate);

module.exports = router;
