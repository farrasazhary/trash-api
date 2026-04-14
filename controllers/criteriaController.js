const { Criteria } = require('../models');

// GET semua kriteria
const getAllCriteria = async (req, res) => {
    try {
        const criteria = await Criteria.findAll({ order: [['id_criteria', 'ASC']] });
        // Map ke format yang compatible dengan frontend (sediakan .id)
        const mapped = criteria.map(c => {
            const data = c.toJSON();
            data.id = data.id_criteria;
            return data;
        });
        res.json({ success: true, data: mapped });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET kriteria berdasarkan ID
const getCriteriaById = async (req, res) => {
    try {
        const criteria = await Criteria.findByPk(req.params.id);
        if (!criteria) {
            return res.status(404).json({ success: false, message: 'Kriteria tidak ditemukan' });
        }
        const data = criteria.toJSON();
        data.id = data.id_criteria;
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// POST buat kriteria baru (kode otomatis: C1, C2, C3, ...)
const createCriteria = async (req, res) => {
    try {
        const { nama, bobot } = req.body;

        // Auto-generate kode: C1, C2, C3, ...
        const count = await Criteria.count();
        const kode = `C${count + 1}`;

        const criteria = await Criteria.create({ kode, nama, bobot });
        const data = criteria.toJSON();
        data.id = data.id_criteria;
        res.status(201).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// PUT update kriteria
const updateCriteria = async (req, res) => {
    try {
        const criteria = await Criteria.findByPk(req.params.id);
        if (!criteria) {
            return res.status(404).json({ success: false, message: 'Kriteria tidak ditemukan' });
        }
        const { kode, nama, bobot } = req.body;
        await criteria.update({ kode, nama, bobot });
        const data = criteria.toJSON();
        data.id = data.id_criteria;
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus kriteria
const deleteCriteria = async (req, res) => {
    try {
        const criteria = await Criteria.findByPk(req.params.id);
        if (!criteria) {
            return res.status(404).json({ success: false, message: 'Kriteria tidak ditemukan' });
        }
        await criteria.destroy();
        res.json({ success: true, message: 'Kriteria berhasil dihapus' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = {
    getAllCriteria,
    getCriteriaById,
    createCriteria,
    updateCriteria,
    deleteCriteria,
};
