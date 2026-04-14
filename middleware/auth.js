const jwt = require('jsonwebtoken');
const { User } = require('../models');
const { tokenBlacklist } = require('../controllers/authController');

/**
 * Middleware: Verifikasi Token JWT
 * Mengecek apakah request memiliki token yang valid di header Authorization.
 * Format header: "Bearer <token>"
 */
const verifyToken = async (req, res, next) => {
    try {
        // Ambil token dari header "Authorization: Bearer <token>" ATAU dari cookie
        const authHeader = req.headers['authorization'];
        const tokenFromHeader = authHeader ? authHeader.split(' ')[1] : null;
        const tokenFromCookie = req.cookies ? req.cookies.token : null;
        const token = tokenFromHeader || tokenFromCookie;

        if (!token) {
            return res.status(401).json({
                success: false,
                message: 'Akses ditolak. Token tidak ditemukan.',
            });
        }

        // Cek apakah token sudah di-logout (blacklist)
        if (tokenBlacklist.has(token)) {
            return res.status(401).json({
                success: false,
                message: 'Token sudah tidak berlaku. Silakan login kembali.',
            });
        }

        // Verifikasi token
        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        // Cek apakah user masih ada di database
        const user = await User.findByPk(decoded.id);
        if (!user) {
            return res.status(401).json({
                success: false,
                message: 'Token tidak valid. User tidak ditemukan.',
            });
        }

        // Simpan data user ke req untuk digunakan di controller selanjutnya
        // Gunakan id_users sebagai PK, tapi tetap sediakan .id untuk kompatibilitas
        req.user = {
            id: user.id_users,
            id_users: user.id_users,
            username: user.username,
            role: user.role,
        };

        next();
    } catch (error) {
        if (error.name === 'TokenExpiredError') {
            return res.status(401).json({
                success: false,
                message: 'Token sudah kedaluwarsa. Silakan login kembali.',
            });
        }
        return res.status(401).json({
            success: false,
            message: 'Token tidak valid.',
        });
    }
};

/**
 * Middleware: Hanya Admin yang Boleh Akses
 * Digunakan setelah verifyToken untuk memproteksi endpoint write (POST/PUT/DELETE).
 */
const adminOnly = (req, res, next) => {
    if (req.user.role !== 'admin') {
        return res.status(403).json({
            success: false,
            message: 'Akses ditolak. Hanya admin yang dapat melakukan aksi ini.',
        });
    }
    next();
};

module.exports = { verifyToken, adminOnly };
