const express = require('express');
const router = express.Router();
const { verifyToken, adminOnly } = require('../middleware/auth');
const {
    getAllUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
} = require('../controllers/userController');

// GET — semua user yang login bisa akses
router.get('/', verifyToken, getAllUsers);
router.get('/:id', verifyToken, getUserById);

// POST/PUT/DELETE — hanya admin
router.post('/', verifyToken, adminOnly, createUser);
router.put('/:id', verifyToken, adminOnly, updateUser);
router.delete('/:id', verifyToken, adminOnly, deleteUser);

module.exports = router;
