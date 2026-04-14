const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const {
    getAllCriteria,
    getCriteriaById,
    createCriteria,
    updateCriteria,
    deleteCriteria,
} = require('../controllers/criteriaController');

// GET — semua user yang login bisa akses
router.get('/', verifyToken, getAllCriteria);
router.get('/:id', verifyToken, getCriteriaById);

// POST/PUT/DELETE — hanya admin
router.post('/', verifyToken, adminOnly, createCriteria);
router.put('/:id', verifyToken, adminOnly, updateCriteria);
router.delete('/:id', verifyToken, adminOnly, deleteCriteria);

module.exports = router;
