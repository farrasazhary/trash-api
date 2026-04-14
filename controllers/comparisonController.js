const { Comparison, User, Ranking } = require('../models');
const { Sequelize } = require('sequelize');

// POST simpan array of comparisons (batch insert)
// id_users diambil otomatis dari token JWT (req.user.id), bukan dari input body
const createComparisons = async (req, res) => {
    try {
        const { comparisons } = req.body;
        const userId = req.user.id; // Dari middleware verifyToken

        // Validasi: pastikan input berupa array
        if (!Array.isArray(comparisons) || comparisons.length === 0) {
            return res.status(400).json({
                success: false,
                message: 'Data comparisons harus berupa array dan tidak boleh kosong',
            });
        }

        // Map setiap item frontend ke kolom FK eksplisit berdasarkan category
        const comparisonsWithUser = comparisons.map((item) => {
            const row = {
                id_users: userId,
                category: item.category,
                value: item.value,
                // Set semua FK ke null dulu
                criteria_id_1: null,
                criteria_id_2: null,
                parent_criteria_id: null,
                sub_criteria_id_1: null,
                sub_criteria_id_2: null,
                parent_sub_criteria_id: null,
                alternative_id_1: null,
                alternative_id_2: null,
            };

            if (item.category === 'criteria') {
                row.criteria_id_1 = item.item1_id;
                row.criteria_id_2 = item.item2_id;
            } else if (item.category === 'sub_criteria') {
                row.parent_criteria_id = item.parent_id;
                row.sub_criteria_id_1 = item.item1_id;
                row.sub_criteria_id_2 = item.item2_id;
            } else if (item.category === 'alternative') {
                // parent_id bisa merujuk ke criteria atau sub_criteria
                // Frontend mengirim parent_id — kita perlu cari di mana ID ini berada
                // Simpan di parent_criteria_id default, akan di-resolve saat perhitungan
                // Namun untuk FK yang benar, kita set keduanya dan bersihkan di bawah
                row.alternative_id_1 = item.item1_id;
                row.alternative_id_2 = item.item2_id;
                // parent_id dikirim dari frontend, set di kedua kolom nullable
                // AHP controller akan memfilter berdasarkan salah satu yang NOT NULL
                row.parent_criteria_id = item.parent_criteria_id || null;
                row.parent_sub_criteria_id = item.parent_sub_criteria_id || null;
                // Backward compatible: jika frontend masih kirim parent_id tunggal
                if (item.parent_id && !item.parent_criteria_id && !item.parent_sub_criteria_id) {
                    // Tergantung konteks dari frontend, default ke sub_criteria
                    // karena Questionnaire.jsx mengirim parent_id = sub.id atau crit.id
                    row.parent_sub_criteria_id = item.parent_sub_criteria_id || item.parent_id;
                    row.parent_criteria_id = item.parent_criteria_id || null;
                }
            }

            return row;
        });

        // Hapus perbandingan lama milik user ini jika ada (mendukung fitur Edit/Resubmit)
        await Comparison.destroy({ where: { id_users: userId } });

        // Bulk create — menyimpan semua perbandingan sekaligus
        const result = await Comparison.bulkCreate(comparisonsWithUser, { validate: true });

        res.status(201).json({
            success: true,
            message: `${result.length} data perbandingan berhasil disimpan`,
            data: result,
        });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET semua comparisons (opsional, untuk debugging)
const getAllComparisons = async (req, res) => {
    try {
        const comparisons = await Comparison.findAll({ order: [['id_comparisons', 'ASC']] });
        res.json({ success: true, data: comparisons });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus semua comparisons (reset kuesioner)
const deleteAllComparisons = async (req, res) => {
    try {
        await Comparison.destroy({ where: {} });
        await Ranking.destroy({ where: {} });
        res.json({ success: true, message: 'Semua data perbandingan dan ranking berhasil dihapus' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET perbandingan milik user yang sedang login
const getMyComparisons = async (req, res) => {
    try {
        const userId = req.user.id;
        const comparisons = await Comparison.findAll({
            where: { id_users: userId },
            order: [['id_comparisons', 'ASC']]
        });

        res.json({ success: true, data: comparisons });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// ==================== ADMIN ONLY ENDPOINTS ====================

// GET daftar responden yang sudah mengisi kuesioner
const getRespondentsList = async (req, res) => {
    try {
        const uniqueUserIds = await Comparison.findAll({
            attributes: [[Sequelize.fn('DISTINCT', Sequelize.col('id_users')), 'id_users']],
        });

        const ids = uniqueUserIds.map(c => c.id_users);

        const respondents = await User.findAll({
            where: { id_users: ids },
            attributes: ['id_users', 'username', 'role', 'createdAt']
        });

        // Map ke format yang compatible dengan frontend (id field)
        const mappedRespondents = respondents.map(r => {
            const data = r.toJSON();
            data.id = data.id_users; // Frontend menggunakan .id
            return data;
        });

        res.json({ success: true, data: mappedRespondents });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET perbandingan milik user spesifik (by Admin)
const getUserComparisons = async (req, res) => {
    try {
        const userId = req.params.userId;
        const comparisons = await Comparison.findAll({
            where: { id_users: userId },
            order: [['id_comparisons', 'ASC']]
        });

        const user = await User.findByPk(userId, { attributes: ['id_users', 'username', 'role'] });

        if (!user) {
            return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
        }

        // Map user ke format compatible frontend
        const userData = user.toJSON();
        userData.id = userData.id_users;

        res.json({ success: true, data: comparisons, user: userData });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus perbandingan user spesifik (by Admin)
const deleteUserComparisons = async (req, res) => {
    try {
        const userId = req.params.userId;
        const deletedCount = await Comparison.destroy({ where: { id_users: userId } });

        if (deletedCount === 0) {
            return res.status(404).json({ success: false, message: 'Data perbandingan tidak ditemukan untuk user ini' });
        }

        await Ranking.destroy({ where: {} });

        res.json({ success: true, message: 'Berhasil menghapus data kuesioner responden. Ranking telah direset.' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = {
    createComparisons,
    getAllComparisons,
    getMyComparisons,
    deleteAllComparisons,
    getRespondentsList,
    getUserComparisons,
    deleteUserComparisons
};
