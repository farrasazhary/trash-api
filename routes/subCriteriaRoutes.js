const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const {
    getAllSubCriteria,
    getSubCriteriaById,
    createSubCriteria,
    updateSubCriteria,
    deleteSubCriteria,
} = require('../controllers/subCriteriaController');

// GET — semua user yang login bisa akses
router.get('/', verifyToken, getAllSubCriteria);
router.get('/:id', verifyToken, getSubCriteriaById);

// POST/PUT/DELETE — hanya admin
router.post('/', verifyToken, adminOnly, createSubCriteria);
router.put('/:id', verifyToken, adminOnly, updateSubCriteria);
router.delete('/:id', verifyToken, adminOnly, deleteSubCriteria);

module.exports = router;
