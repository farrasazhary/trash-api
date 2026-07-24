require('dotenv').config();
const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bcrypt = require('bcryptjs');
const { sequelize, User } = require('./models');

// Import Routes
const criteriaRoutes = require('./routes/criteriaRoutes');
const subCriteriaRoutes = require('./routes/subCriteriaRoutes');
const alternativeRoutes = require('./routes/alternativeRoutes');
const comparisonRoutes = require('./routes/comparisonRoutes');
const ahpRoutes = require('./routes/ahpRoutes');
const rankingRoutes = require('./routes/rankingRoutes');
const userRoutes = require('./routes/userRoutes');
const authRoutes = require('./routes/authRoutes');

const app = express();
const PORT = process.env.PORT || 5000;

// ==================== MIDDLEWARE ====================
app.use(cors({ origin: true, credentials: true }));
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ==================== ROUTES ====================
app.get(['/', '/api', '/api/'], (req, res) => {
    res.json({
        message: 'SPK Penentuan Kebijakan Pengelolaan Sampah — API',
        version: '1.0.0',
        endpoints: {
            auth: '/api/auth (login, logout, me)',
            users: '/api/users',
            criteria: '/api/criteria',
            subCriteria: '/api/sub-criteria',
            alternatives: '/api/alternatives',
            comparisons: '/api/comparisons',
            calculate: '/api/calculate',
            rankings: '/api/rankings',
        },
    });
});

app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/criteria', criteriaRoutes);
app.use('/api/sub-criteria', subCriteriaRoutes);
app.use('/api/alternatives', alternativeRoutes);
app.use('/api/comparisons', comparisonRoutes);
app.use('/api/calculate', ahpRoutes);
app.use('/api/rankings', rankingRoutes);

// ==================== ERROR HANDLING ====================
// 404 — Route tidak ditemukan
app.use((req, res) => {
    res.status(404).json({ success: false, message: 'Endpoint tidak ditemukan' });
});

// Global error handler
app.use((err, req, res, next) => {
    console.error('Server Error:', err);
    res.status(500).json({ success: false, message: 'Terjadi kesalahan pada server' });
});

// ==================== DATABASE SYNC & SERVER START ====================
const startServer = async () => {
    try {
        // Test koneksi database
        await sequelize.authenticate();
        console.log('✅ Koneksi database berhasil');

        // Sinkronisasi model ke database (buat tabel jika belum ada)
        await sequelize.sync();
        console.log('✅ Database tersinkronisasi');

        // Buat user admin default jika belum ada
        const adminExists = await User.findOne({ where: { username: 'admin' } });
        if (!adminExists) {
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash('admin', salt);
            await User.create({ username: 'admin', password: hashedPassword, role: 'admin' });
            console.log('✅ User admin default berhasil dibuat (username: admin, password: admin)');
        }

        // Jalankan server
        app.listen(PORT, () => {
            console.log(`🚀 Server berjalan di http://localhost:${PORT}`);
        });
    } catch (error) {
        console.error('❌ Gagal memulai server:', error.message);
        process.exit(1);
    }
};

startServer();
