const { Alternative } = require('../models');

// GET semua alternatif
const getAllAlternatives = async (req, res) => {
    try {
        const alternatives = await Alternative.findAll({ order: [['id_alternatives', 'ASC']] });
        // Map ke format yang compatible dengan frontend (sediakan .id)
        const mapped = alternatives.map(a => {
            const data = a.toJSON();
            data.id = data.id_alternatives;
            return data;
        });
        res.json({ success: true, data: mapped });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// GET alternatif berdasarkan ID
const getAlternativeById = async (req, res) => {
    try {
        const alternative = await Alternative.findByPk(req.params.id);
        if (!alternative) {
            return res.status(404).json({ success: false, message: 'Alternatif tidak ditemukan' });
        }
        const data = alternative.toJSON();
        data.id = data.id_alternatives;
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// POST buat alternatif baru (kode otomatis: A1, A2, A3, ...)
const createAlternative = async (req, res) => {
    try {
        const { nama } = req.body;

        // Auto-generate kode: A1, A2, A3, ...
        const count = await Alternative.count();
        const kode = `A${count + 1}`;

        const alternative = await Alternative.create({ kode, nama });
        const data = alternative.toJSON();
        data.id = data.id_alternatives;
        res.status(201).json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// PUT update alternatif
const updateAlternative = async (req, res) => {
    try {
        const alternative = await Alternative.findByPk(req.params.id);
        if (!alternative) {
            return res.status(404).json({ success: false, message: 'Alternatif tidak ditemukan' });
        }
        const { kode, nama } = req.body;
        await alternative.update({ kode, nama });
        const data = alternative.toJSON();
        data.id = data.id_alternatives;
        res.json({ success: true, data });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

// DELETE hapus alternatif
const deleteAlternative = async (req, res) => {
    try {
        const alternative = await Alternative.findByPk(req.params.id);
        if (!alternative) {
            return res.status(404).json({ success: false, message: 'Alternatif tidak ditemukan' });
        }
        await alternative.destroy();
        res.json({ success: true, message: 'Alternatif berhasil dihapus' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = {
    getAllAlternatives,
    getAlternativeById,
    createAlternative,
    updateAlternative,
    deleteAlternative,
};
