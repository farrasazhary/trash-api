const { SubCriteria, Criteria } = require('../models');

// GET semua sub-kriteria (include kriteria induk)
const getAllSubCriteria = async (req, res) => {
    try {
        const subCriteria = await SubCriteria.findAll({
            include: [{ model: Criteria, as: 'criteria' }],
            order: [['id_sub_criteria', 'ASC']],
        });
        // Map ke format yang compatible dengan frontend (sediakan .id dan .criteria_id)
        const mapped = subCriteria.map(sc => {
            const data = sc.toJSON();
            data.id = data.id_sub_criteria;
            data.criteria_id = data.id_criteria;
            if (data.criteria) {
                data.criteria.id = data.criteria.id_criteria;
            }
            return data;
        });
        res.json({ success: true, data: mapped });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET sub-kriteria berdasarkan ID
const getSubCriteriaById = async (req, res) => {
    try {
        const subCriteria = await SubCriteria.findByPk(req.params.id, {
            include: [{ model: Criteria, as: 'criteria' }],
        });
        if (!subCriteria) {
            return res.status(404).json({ success: false, message: 'Sub-kriteria tidak ditemukan' });
        }
        const data = subCriteria.toJSON();
        data.id = data.id_sub_criteria;
        data.criteria_id = data.id_criteria;
        if (data.criteria) {
            data.criteria.id = data.criteria.id_criteria;
        }
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// POST buat sub-kriteria baru (kode otomatis berdasarkan kriteria induk)
const createSubCriteria = async (req, res) => {
    try {
        const { criteria_id, nama, bobot_lokal, bobot_global } = req.body;

        // Cari kriteria induk untuk mendapatkan kode-nya
        const parentCriteria = await Criteria.findByPk(criteria_id);
        if (!parentCriteria) {
            return res.status(404).json({ success: false, message: 'Kriteria induk tidak ditemukan' });
        }

        // Auto-generate kode: SC + nomor kriteria + . + urutan sub
        // Contoh: jika parent = C1, sub ke-2 → SC1.2
        const criteriaNumber = parentCriteria.kode.replace(/\D/g, ''); // Ambil angka dari C1 → 1
        const subCount = await SubCriteria.count({ where: { id_criteria: criteria_id } });
        const kode = `SC${criteriaNumber}.${subCount + 1}`;

        const subCriteria = await SubCriteria.create({
            id_criteria: criteria_id, kode, nama, bobot_lokal, bobot_global,
        });
        const data = subCriteria.toJSON();
        data.id = data.id_sub_criteria;
        data.criteria_id = data.id_criteria;
        res.status(201).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// PUT update sub-kriteria
const updateSubCriteria = async (req, res) => {
    try {
        const subCriteria = await SubCriteria.findByPk(req.params.id);
        if (!subCriteria) {
            return res.status(404).json({ success: false, message: 'Sub-kriteria tidak ditemukan' });
        }
        const { criteria_id, kode, nama, bobot_lokal, bobot_global } = req.body;
        await subCriteria.update({ id_criteria: criteria_id, kode, nama, bobot_lokal, bobot_global });
        const data = subCriteria.toJSON();
        data.id = data.id_sub_criteria;
        data.criteria_id = data.id_criteria;
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus sub-kriteria
const deleteSubCriteria = async (req, res) => {
    try {
        const subCriteria = await SubCriteria.findByPk(req.params.id);
        if (!subCriteria) {
            return res.status(404).json({ success: false, message: 'Sub-kriteria tidak ditemukan' });
        }
        await subCriteria.destroy();
        res.json({ success: true, message: 'Sub-kriteria berhasil dihapus' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = {
    getAllSubCriteria,
    getSubCriteriaById,
    createSubCriteria,
    updateSubCriteria,
    deleteSubCriteria,
};
