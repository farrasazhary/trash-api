const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { User } = require('../models');

// Simpan daftar token yang sudah di-logout (blacklist sederhana in-memory)
const tokenBlacklist = new Set();

/**
 * POST /api/auth/register
 * Daftar user baru — role otomatis menjadi 'responden'.
 */
const register = async (req, res) => {
    try {
        const { username, password } = req.body;

        // Validasi input
        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'Username dan password wajib diisi.',
            });
        }

        // Cek apakah username sudah dipakai
        const existing = await User.findOne({ where: { username } });
        if (existing) {
            return res.status(400).json({
                success: false,
                message: 'Username sudah digunakan.',
            });
        }

        // Hash password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Buat user baru dengan role otomatis 'responden'
        const user = await User.create({
            username,
            password: hashedPassword,
            role: 'responden',
        });

        res.status(201).json({
            success: true,
            message: 'Registrasi berhasil',
            data: {
                id: user.id_users,
                username: user.username,
                role: user.role,
            },
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

/**
 * POST /api/auth/login
 * Login user, kembalikan JWT token.
 */
const login = async (req, res) => {
    try {
        const { username, password } = req.body;

        // Validasi input
        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'Username dan password wajib diisi.',
            });
        }

        // Cari user berdasarkan username
        const user = await User.findOne({ where: { username } });
        if (!user) {
            return res.status(401).json({
                success: false,
                message: 'Username atau password salah.',
            });
        }

        // Cocokkan password dengan hash di database
        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({
                success: false,
                message: 'Username atau password salah.',
            });
        }

        // Buat JWT token — encode id_users sebagai 'id' untuk kompatibilitas
        const token = jwt.sign(
            { id: user.id_users, username: user.username, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: process.env.JWT_EXPIRES_IN || '24h' }
        );

        // Simpan token ke cookie (httpOnly agar tidak bisa diakses via JavaScript di browser)
        res.cookie('token', token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production', // HTTPS only di production
            sameSite: 'lax',
            maxAge: 24 * 60 * 60 * 1000, // 24 jam dalam milidetik
        });

        res.json({
            success: true,
            message: 'Login berhasil',
            data: {
                token,
                user: {
                    id: user.id_users,
                    username: user.username,
                    role: user.role,
                },
            },
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

/**
 * POST /api/auth/logout
 * Logout user, hapus cookie dan masukkan token ke blacklist.
 */
const logout = async (req, res) => {
    try {
        const authHeader = req.headers['authorization'];
        const tokenFromHeader = authHeader ? authHeader.split(' ')[1] : null;
        const tokenFromCookie = req.cookies ? req.cookies.token : null;
        const token = tokenFromHeader || tokenFromCookie;

        if (token) {
            tokenBlacklist.add(token);
        }

        res.clearCookie('token', {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production',
            sameSite: 'lax',
        });

        res.json({
            success: true,
            message: 'Logout berhasil',
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

/**
 * GET /api/auth/me
 * Ambil profil user yang sedang login (berdasarkan token).
 */
const getProfile = async (req, res) => {
    try {
        res.json({
            success: true,
            data: req.user,
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// Ekspor tokenBlacklist agar bisa dicek di middleware
module.exports = { register, login, logout, getProfile, tokenBlacklist };
