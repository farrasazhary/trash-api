const { Comparison, Criteria, SubCriteria, Alternative, Ranking } = require('../models');

// ==================== TABEL RANDOM INDEX (RI) ====================
// Digunakan untuk menghitung Consistency Ratio (CR)
// Sumber: Saaty, 1980
const RANDOM_INDEX = {
    1: 0.00,
    2: 0.00,
    3: 0.58,
    4: 0.90,
    5: 1.12,
    6: 1.24,
    7: 1.32,
    8: 1.41,
    9: 1.45,
    10: 1.49,
};

// ==================== FUNGSI UTILITAS MATEMATIS AHP ====================

/**
 * Menghitung Geometric Mean dari array angka.
 * Digunakan untuk mengagregasi jawaban dari beberapa responden.
 * Rumus: GM = (x1 * x2 * ... * xn) ^ (1/n)
 */
const geometricMean = (values) => {
    if (values.length === 0) return 0;
    if (values.length === 1) return values[0];

    // Menggunakan logaritma untuk menghindari overflow pada perkalian angka besar
    const logSum = values.reduce((sum, val) => sum + Math.log(val), 0);
    return Math.exp(logSum / values.length);
};

/**
 * Membangun Matriks Perbandingan Berpasangan (Pairwise Comparison Matrix)
 * dari data comparisons yang sudah diagregasi dengan Geometric Mean.
 *
 * Prinsip: Jika A vs B = x, maka B vs A = 1/x (inverse/resiprok)
 *
 * @param {Array} items - Daftar ID item (kriteria/sub-kriteria/alternatif)
 * @param {Object} comparisonMap - Map dengan key "id1-id2" berisi array nilai dari responden
 * @returns {Array} matrix - Matriks n×n
 */
const buildPairwiseMatrix = (items, comparisonMap) => {
    const n = items.length;
    // Inisialisasi matriks n×n dengan nilai 1 pada diagonal (item vs dirinya sendiri = 1)
    const matrix = Array.from({ length: n }, () => Array(n).fill(1));

    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            const key = `${items[i]}-${items[j]}`;
            const reverseKey = `${items[j]}-${items[i]}`;

            let values = comparisonMap[key] || [];
            let reverseValues = comparisonMap[reverseKey] || [];

            // Konversi nilai reverse menjadi inverse-nya, lalu gabungkan
            const allValues = [
                ...values,
                ...reverseValues.map((v) => 1 / v),
            ];

            if (allValues.length > 0) {
                // Hitung Geometric Mean dari semua responden
                const gm = geometricMean(allValues);
                matrix[i][j] = gm;
                // Nilai inverse untuk pasangan sebaliknya (resiprok)
                matrix[j][i] = 1 / gm;
            }
        }
    }

    return matrix;
};

/**
 * Menghitung Eigen Vector (Bobot Lokal) dari matriks perbandingan berpasangan.
 *
 * Metode: Normalisasi kolom, kemudian rata-rata baris.
 * Langkah:
 * 1. Jumlahkan setiap kolom.
 * 2. Bagi setiap elemen dengan jumlah kolomnya (normalisasi).
 * 3. Rata-ratakan setiap baris → menghasilkan eigen vector (bobot).
 *
 * @param {Array} matrix - Matriks perbandingan berpasangan n×n
 * @returns {Array} eigenVector - Array bobot lokal
 */
const calculateEigenVector = (matrix) => {
    const n = matrix.length;
    if (n === 0) return [];

    // Langkah 1: Hitung jumlah setiap kolom
    const columnSums = Array(n).fill(0);
    for (let j = 0; j < n; j++) {
        for (let i = 0; i < n; i++) {
            columnSums[j] += matrix[i][j];
        }
    }

    // Langkah 2: Normalisasi — bagi setiap elemen dengan jumlah kolomnya
    const normalizedMatrix = matrix.map((row, i) =>
        row.map((val, j) => val / columnSums[j])
    );

    // Langkah 3: Hitung rata-rata setiap baris → eigen vector (bobot)
    const eigenVector = normalizedMatrix.map((row) => {
        const sum = row.reduce((a, b) => a + b, 0);
        return sum / n;
    });

    return eigenVector;
};

/**
 * Menghitung Consistency Ratio (CR) untuk memvalidasi konsistensi penilaian.
 *
 * Langkah:
 * 1. Hitung λmax (lambda max) = rata-rata dari (jumlah kolom × bobot eigen)
 * 2. Hitung Consistency Index: CI = (λmax - n) / (n - 1)
 * 3. Hitung Consistency Ratio: CR = CI / RI
 *
 * Aturan: Jika CR < 0.1 (10%), maka penilaian dianggap KONSISTEN
 *
 * @param {Array} matrix - Matriks perbandingan berpasangan
 * @param {Array} eigenVector - Eigen vector (bobot)
 * @returns {Object} { lambdaMax, CI, CR, isConsistent }
 */
const calculateConsistencyRatio = (matrix, eigenVector) => {
    const n = matrix.length;

    // Jika jumlah item <= 2, CR selalu 0 (tidak bisa inkonsisten)
    if (n <= 2) {
        return { lambdaMax: n, CI: 0, CR: 0, isConsistent: true };
    }

    // Langkah 1: Hitung λmax
    const weightedSumVector = matrix.map((row) =>
        row.reduce((sum, val, j) => sum + val * eigenVector[j], 0)
    );

    const lambdaValues = weightedSumVector.map((val, i) =>
        eigenVector[i] !== 0 ? val / eigenVector[i] : 0
    );

    const lambdaMax = lambdaValues.reduce((a, b) => a + b, 0) / n;

    // Langkah 2: Hitung Consistency Index (CI)
    const CI = (lambdaMax - n) / (n - 1);

    // Langkah 3: Hitung Consistency Ratio (CR)
    const RI = RANDOM_INDEX[n] || 1.49;
    const CR = RI !== 0 ? CI / RI : 0;

    return {
        lambdaMax: parseFloat(lambdaMax.toFixed(6)),
        CI: parseFloat(CI.toFixed(6)),
        RI: RI,
        CR: parseFloat(CR.toFixed(6)),
        isConsistent: CR < 0.1,
    };
};

// ==================== ENDPOINT UTAMA: PERHITUNGAN AHP ====================

const calculate = async (req, res) => {
    try {
        // ============================================================
        // LANGKAH 1: Ambil semua data master dan data perbandingan
        // ============================================================
        const allCriteria = await Criteria.findAll({ order: [['id_criteria', 'ASC']] });
        const allSubCriteria = await SubCriteria.findAll({ order: [['id_sub_criteria', 'ASC']] });
        const allAlternatives = await Alternative.findAll({ order: [['id_alternatives', 'ASC']] });
        const allComparisons = await Comparison.findAll();

        if (allCriteria.length === 0) {
            return res.status(400).json({ success: false, message: 'Data kriteria belum diisi' });
        }
        if (allAlternatives.length === 0) {
            return res.status(400).json({ success: false, message: 'Data alternatif belum diisi' });
        }
        if (allComparisons.length === 0) {
            return res.status(400).json({ success: false, message: 'Data perbandingan belum diisi' });
        }

        // ============================================================
        // LANGKAH 2: Kelompokkan data comparisons berdasarkan kategori
        // ============================================================

        /**
         * Fungsi helper untuk mengelompokkan comparisons berdasarkan FK eksplisit.
         * Menggunakan kolom FK baru alih-alih kolom polimorfik lama.
         */
        const groupCriteriaComparisons = (comparisons) => {
            const map = {};
            comparisons
                .filter(c => c.category === 'criteria' && c.criteria_id_1 && c.criteria_id_2)
                .forEach(c => {
                    const key = `${c.criteria_id_1}-${c.criteria_id_2}`;
                    if (!map[key]) map[key] = [];
                    map[key].push(c.value);
                });
            return map;
        };

        const groupSubCriteriaComparisons = (comparisons, parentCriteriaId) => {
            const map = {};
            comparisons
                .filter(c => c.category === 'sub_criteria' && c.parent_criteria_id === parentCriteriaId && c.sub_criteria_id_1 && c.sub_criteria_id_2)
                .forEach(c => {
                    const key = `${c.sub_criteria_id_1}-${c.sub_criteria_id_2}`;
                    if (!map[key]) map[key] = [];
                    map[key].push(c.value);
                });
            return map;
        };

        const groupAlternativeComparisons = (comparisons, parentId) => {
            const map = {};
            comparisons
                .filter(c => {
                    if (c.category !== 'alternative') return false;
                    if (!c.alternative_id_1 || !c.alternative_id_2) return false;
                    // Cocokkan parent — bisa parent_criteria_id atau parent_sub_criteria_id
                    return c.parent_criteria_id === parentId || c.parent_sub_criteria_id === parentId;
                })
                .forEach(c => {
                    const key = `${c.alternative_id_1}-${c.alternative_id_2}`;
                    if (!map[key]) map[key] = [];
                    map[key].push(c.value);
                });
            return map;
        };

        // ============================================================
        // LANGKAH 3: Hitung bobot KRITERIA
        // ============================================================
        const criteriaIds = allCriteria.map((c) => c.id_criteria);
        const criteriaCompMap = groupCriteriaComparisons(allComparisons);
        const criteriaMatrix = buildPairwiseMatrix(criteriaIds, criteriaCompMap);
        const criteriaEigen = calculateEigenVector(criteriaMatrix);
        const criteriaCR = calculateConsistencyRatio(criteriaMatrix, criteriaEigen);

        // Update bobot kriteria di database
        for (let i = 0; i < allCriteria.length; i++) {
            await allCriteria[i].update({ bobot: parseFloat(criteriaEigen[i].toFixed(6)) });
        }

        // Buat mapping criteria_id → bobot eigen untuk perhitungan bobot global
        const criteriaWeightMap = {};
        allCriteria.forEach((c, i) => {
            criteriaWeightMap[c.id_criteria] = criteriaEigen[i];
        });

        // ============================================================
        // LANGKAH 4: Hitung bobot SUB-KRITERIA per kriteria induk
        // ============================================================

        // Kelompokkan sub-kriteria berdasarkan id_criteria (induknya)
        const subCriteriaByParent = {};
        allSubCriteria.forEach((sc) => {
            if (!subCriteriaByParent[sc.id_criteria]) {
                subCriteriaByParent[sc.id_criteria] = [];
            }
            subCriteriaByParent[sc.id_criteria].push(sc);
        });

        const subCriteriaResults = {};

        for (const [criteriaId, subCriteriaList] of Object.entries(subCriteriaByParent)) {
            const subIds = subCriteriaList.map((sc) => sc.id_sub_criteria);

            if (subIds.length <= 1) {
                if (subIds.length === 1) {
                    const globalWeight = criteriaWeightMap[parseInt(criteriaId)] || 0;
                    await subCriteriaList[0].update({
                        bobot_lokal: 1,
                        bobot_global: parseFloat(globalWeight.toFixed(6)),
                    });
                    subCriteriaResults[criteriaId] = {
                        labels: [subCriteriaList[0].nama],
                        matrix: [[1]],
                        eigenvector: [1],
                        isConsistent: true,
                        cr: 0,
                        ci: 0,
                        ri: 0,
                        lambdaMax: 1
                    };
                }
                continue;
            }

            const subCompMap = groupSubCriteriaComparisons(allComparisons, parseInt(criteriaId));
            const subMatrix = buildPairwiseMatrix(subIds, subCompMap);
            const subEigen = calculateEigenVector(subMatrix);
            const subCR = calculateConsistencyRatio(subMatrix, subEigen);

            const parentWeight = criteriaWeightMap[parseInt(criteriaId)] || 0;

            for (let i = 0; i < subCriteriaList.length; i++) {
                const bobotLokal = parseFloat(subEigen[i].toFixed(6));
                const bobotGlobal = parseFloat((subEigen[i] * parentWeight).toFixed(6));

                await subCriteriaList[i].update({
                    bobot_lokal: bobotLokal,
                    bobot_global: bobotGlobal,
                });
            }

            const parentCrit = allCriteria.find((c) => c.id_criteria == criteriaId);
            subCriteriaResults[criteriaId] = {
                parentName: parentCrit ? parentCrit.nama : '',
                parentKode: parentCrit ? parentCrit.kode : '',
                labels: subCriteriaList.map((sc) => sc.nama),
                matrix: subMatrix,
                eigenvector: subEigen.map((e) => parseFloat(e.toFixed(6))),
                isConsistent: subCR.isConsistent,
                cr: subCR.CR,
                ci: subCR.CI,
                ri: subCR.RI,
                lambdaMax: subCR.lambdaMax
            };
        }

        // ============================================================
        // LANGKAH 5: Hitung bobot ALTERNATIF terhadap setiap sub-kriteria
        // ============================================================

        const evaluationNodes = allSubCriteria.length > 0
            ? allSubCriteria.map((sc) => ({
                id: sc.id_sub_criteria,
                globalWeight: sc.bobot_global,
                type: 'sub_criteria',
                nama: sc.nama,
                kode: sc.kode,
                criteriaId: sc.id_criteria
            }))
            : allCriteria.map((c, i) => ({
                id: c.id_criteria,
                globalWeight: criteriaEigen[i],
                type: 'criteria',
                nama: c.nama,
                kode: c.kode,
                criteriaId: c.id_criteria
            }));

        const alternativeIds = allAlternatives.map((a) => a.id_alternatives);
        const alternativeResults = {};
        const finalScores = {};
        alternativeIds.forEach((id) => { finalScores[id] = 0; });

        for (const node of evaluationNodes) {
            const altCompMap = groupAlternativeComparisons(allComparisons, node.id);
            const altMatrix = buildPairwiseMatrix(alternativeIds, altCompMap);
            const altEigen = calculateEigenVector(altMatrix);
            const altCR = calculateConsistencyRatio(altMatrix, altEigen);

            const parentCrit = allCriteria.find((c) => c.id_criteria == node.criteriaId);

            alternativeResults[node.id] = {
                parentName: node.nama || '',
                parentKode: node.kode || '',
                parentCriteriaName: parentCrit ? parentCrit.nama : '',
                parentCriteriaKode: parentCrit ? parentCrit.kode : '',
                labels: allAlternatives.map((a) => a.nama),
                matrix: altMatrix,
                eigenvector: altEigen.map((e) => parseFloat(e.toFixed(6))),
                isConsistent: altCR.isConsistent,
                cr: altCR.CR,
                ci: altCR.CI,
                ri: altCR.RI,
                lambdaMax: altCR.lambdaMax
            };

            // ============================================================
            // LANGKAH 6: SINTESIS AKHIR
            // ============================================================
            for (let i = 0; i < alternativeIds.length; i++) {
                finalScores[alternativeIds[i]] += node.globalWeight * altEigen[i];
            }
        }

        // ============================================================
        // LANGKAH 7: Simpan hasil ranking ke database
        // ============================================================

        const sortedAlternatives = Object.entries(finalScores)
            .map(([altId, score]) => ({ alternativeId: parseInt(altId), score }))
            .sort((a, b) => b.score - a.score);

        await Ranking.destroy({ where: {} });

        const rankingsToSave = sortedAlternatives.map((item, index) => ({
            id_alternatives: item.alternativeId,
            score: parseFloat(item.score.toFixed(6)),
            rank: index + 1,
        }));

        await Ranking.bulkCreate(rankingsToSave);

        // ============================================================
        // LANGKAH 8: Susun respons lengkap
        // ============================================================

        const savedRankings = await Ranking.findAll({
            include: [{ model: Alternative, as: 'alternative' }],
            order: [['rank', 'ASC']],
        });

        res.json({
            success: true,
            message: 'Perhitungan AHP berhasil',
            data: {
                details: {
                    criteria: {
                        labels: allCriteria.map((c) => c.nama),
                        matrix: criteriaMatrix,
                        eigenvector: criteriaEigen.map((e) => parseFloat(e.toFixed(6))),
                        isConsistent: criteriaCR.isConsistent,
                        cr: criteriaCR.CR,
                        ci: criteriaCR.CI,
                        ri: criteriaCR.RI,
                        lambdaMax: criteriaCR.lambdaMax
                    },
                    subCriteria: subCriteriaResults,
                    alternatives: alternativeResults
                },
                rankings: savedRankings.map((r) => ({
                    rank: r.rank,
                    alternativeId: r.id_alternatives,
                    kode: r.alternative?.kode,
                    nama: r.alternative?.nama,
                    score: r.score,
                })),
            },
        });
    } catch (error) {
        console.error('Error pada perhitungan AHP:', error);
        res.status(500).json({ success: false, message: error.message });
    }
};

// ==================== ENDPOINT: AMBIL HASIL RANKING ====================
const getRankings = async (req, res) => {
    try {
        const rankings = await Ranking.findAll({
            include: [{ model: Alternative, as: 'alternative' }],
            order: [['rank', 'ASC']],
        });

        const mappedData = rankings.map((r) => {
            const data = r.toJSON();
            data.Alternative = data.alternative; // Untuk kompatibilitas frontend
            return data;
        });

        res.json({
            success: true,
            data: mappedData,
        });
    } catch (error) {
        console.error('Error memuat ranking:', error);
        res.status(500).json({ success: false, message: error.message });
    }
};

module.exports = { calculate, getRankings };
