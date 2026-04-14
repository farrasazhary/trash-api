const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const {
    getAllAlternatives,
    getAlternativeById,
    createAlternative,
    updateAlternative,
    deleteAlternative,
} = require('../controllers/alternativeController');

// GET — semua user yang login bisa akses
router.get('/', verifyToken, getAllAlternatives);
router.get('/:id', verifyToken, getAlternativeById);

// POST/PUT/DELETE — hanya admin
router.post('/', verifyToken, adminOnly, createAlternative);
router.put('/:id', verifyToken, adminOnly, updateAlternative);
router.delete('/:id', verifyToken, adminOnly, deleteAlternative);

module.exports = router;
