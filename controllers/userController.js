const bcrypt = require('bcryptjs');
const { User } = require('../models');

// GET semua user (tanpa menampilkan password)
const getAllUsers = async (req, res) => {
    try {
        const users = await User.findAll({
            attributes: { exclude: ['password'] },
            order: [['id_users', 'ASC']],
        });

        // Map ke format compatible frontend (sediakan .id)
        const mappedUsers = users.map(u => {
            const data = u.toJSON();
            data.id = data.id_users;
            return data;
        });

        res.json({ success: true, data: mappedUsers });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET user berdasarkan ID
const getUserById = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id, {
            attributes: { exclude: ['password'] },
        });
        if (!user) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }
        const userData = user.toJSON();
        userData.id = userData.id_users;
        res.json({ success: true, data: userData });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// POST buat user baru
const createUser = async (req, res) => {
    try {
        const { username, password, role } = req.body;

        // Cek apakah username sudah dipakai
        const existing = await User.findOne({ where: { username } });
        if (existing) {
            return res.status(400).json({ success: false, message: 'Username sudah digunakan' });
        }

        // Hash password sebelum disimpan
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        const user = await User.create({ username, password: hashedPassword, role });

        // Kembalikan response tanpa password
        const { password: _, ...userData } = user.toJSON();
        userData.id = userData.id_users;
        res.status(201).json({ success: true, data: userData });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// PUT update user
const updateUser = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }

        const { username, password, role } = req.body;
        const updateData = {};

        if (username) updateData.username = username;
        if (role) updateData.role = role;

        // Jika password di-update, hash ulang
        if (password) {
            const salt = await bcrypt.genSalt(10);
            updateData.password = await bcrypt.hash(password, salt);
        }

        await user.update(updateData);

        const { password: _, ...userData } = user.toJSON();
        userData.id = userData.id_users;
        res.json({ success: true, data: userData });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus user
const deleteUser = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }
        await user.destroy();
        res.json({ success: true, message: 'User berhasil dihapus' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = {
    getAllUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
};
