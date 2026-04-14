const express = require('express');
const router = express.Router();
const { verifyToken } = require('../middleware/auth');
const { getRankings } = require('../controllers/ahpController');

// Endpoint untuk mengambil hasil ranking terbaru
// Semua user yang login (admin & responden) bisa melihat hasil ranking
router.get('/', verifyToken, getRankings);

module.exports = router;
