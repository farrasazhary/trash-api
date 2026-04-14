const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const {
    createComparisons,
    getAllComparisons,
    getMyComparisons,
    deleteAllComparisons,
    getRespondentsList,
    getUserComparisons,
    deleteUserComparisons
} = require('../controllers/comparisonController');

// ==== SPECIFIC ROUTES FIRST (order matters in Express!) ====

// GET — daftar perbandingan milik user yang login
router.get('/me', verifyToken, getMyComparisons);

// ==== ADMIN KUESIONER MANAGEMENT ====
// GET — daftar user (responden) yang sudah mengisi
router.get('/respondents', verifyToken, getRespondentsList);

// GET — daftar perbandingan dari user tertentu
router.get('/user/:userId', verifyToken, adminOnly, getUserComparisons);

// DELETE — hapus perbandingan dari user tertentu
router.delete('/user/:userId', verifyToken, adminOnly, deleteUserComparisons);

// ==== GENERAL ROUTES LAST ====

// GET — semua comparisons (untuk admin/debug)
router.get('/', verifyToken, getAllComparisons);

// POST — semua user yang login bisa menginput perbandingan
router.post('/', verifyToken, createComparisons);

// DELETE — hapus semua (reset)
router.delete('/', verifyToken, adminOnly, deleteAllComparisons);

module.exports = router;
