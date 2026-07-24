const { sequelize, User, Comparison, Criteria, SubCriteria, Alternative, Ranking } = require('./models');
const bcrypt = require('bcryptjs');

/**
 * ===============================================================
 * SEEDER RESPONDEN AHP SPK SAMPAH (TERMASUK BAPAK RW & RT)
 * ===============================================================
 */

const respondentsList = [
    { username: 'bapakrw' },
    { username: 'budi_santoso' },
    { username: 'siti_rahma' },
    { username: 'ahmad_hidayat' },
    { username: 'dewi_lestari' },
    { username: 'andri_kurniawan' },
    { username: 'rina_wijaya' },
    { username: 'hendra_setiawan' },
    { username: 'fajar_nugroho' },
    { username: 'dian_pratiwi' },
    { username: 'eko_prasetyo' },
    { username: 'tri_astuti' },
    { username: 'bambang_sutrisno' },
    { username: 'nita_permata' },
    { username: 'agus_saputra' },
    { username: 'maya_indriani' },
];

const respondentData = [
    // 0. Bapak RW — Tokoh utama wilayah, pandangan luas & seimbang
    {
        criteria: [3, 1/3, 1/5],
        subC1: [1/4, 1/3, 2], subC2: [3], subC3: [5],
        alts: {
            8:  [1/3, 2, 5],       // A2 > A1 > A3
            9:  [1/3, 3, 6],       // A2 > A1 > A3
            10: [1/3, 2, 5],       // A2 > A1 > A3
            11: [4, 6, 2],         // A1 > A2 > A3
            12: [1/3, 1/2, 2],     // A2 > A3 > A1
            13: [3, 1/2, 1/3],     // A3 > A1 > A2
            14: [3, 1/3, 1/5],     // A3 > A1 > A2
        }
    },
    // 1. Budi Santoso — Warga biasa, moderat, sedikit pro Magot
    {
        criteria: [3, 1/4, 1/6],
        subC1: [1/4, 1/3, 2], subC2: [3], subC3: [6],
        alts: {
            8:  [1/3, 3, 7],       // A2 > A1 > A3
            9:  [1/3, 2, 5],       // A2 > A1 > A3
            10: [1/4, 2, 6],       // A2 > A1 > A3
            11: [3, 5, 2],         // A1 > A2 > A3
            12: [1/4, 1/3, 2],     // A2 > A3 > A1
            13: [3, 1/3, 1/5],     // A3 > A1 > A2
            14: [3, 1/3, 1/6],     // A3 > A1 > A2
        }
    },
    // 2. Siti Rahmawati — Ibu rumah tangga, konservatif
    {
        criteria: [2, 1/5, 1/6],
        subC1: [1/5, 1/4, 3], subC2: [4], subC3: [5],
        alts: {
            8:  [1/4, 2, 6],       // A2 > A1 > A3
            9:  [1/4, 3, 7],       // A2 > A1 > A3
            10: [1/3, 1/2, 2],     // A2 > A3 > A1
            11: [4, 6, 2],         // A1 > A2 > A3
            12: [1/3, 1/2, 2],     // A2 > A3 > A1
            13: [2, 1/4, 1/5],     // A3 > A1 > A2
            14: [2, 1/4, 1/5],     // A3 > A1 > A2
        }
    },
    // 3. Ahmad Hidayat — Ketua RT, pragmatis, SANGAT pro Bank Sampah
    {
        criteria: [4, 1/3, 1/7],
        subC1: [1/3, 1/4, 2], subC2: [3], subC3: [5],
        alts: {
            8:  [1/2, 3, 5],       // A2 > A1 > A3
            9:  [2, 5, 3],         // A1 > A2 > A3
            10: [1/3, 3, 7],       // A2 > A1 > A3
            11: [5, 7, 2],         // A1 >> A2 > A3
            12: [1/3, 1/2, 2],     // A2 > A3 > A1
            13: [5, 3, 1/3],       // A1 > A3 > A2
            14: [3, 1/2, 1/4],     // A3 > A1 > A2
        }
    },
    // 4. Dewi Lestari — Guru SD, analitis
    {
        criteria: [3, 1/3, 1/5],
        subC1: [1/5, 1/3, 3], subC2: [4], subC3: [4],
        alts: {
            8:  [1/3, 1/2, 2],     // A2 > A3 > A1
            9:  [1/3, 2, 5],       // A2 > A1 > A3
            10: [1/4, 1/3, 2],     // A2 > A3 > A1
            11: [3, 4, 2],         // A1 > A2 > A3
            12: [1/4, 1/3, 2],     // A2 > A3 > A1
            13: [4, 1/3, 1/7],     // A3 > A1 >> A2
            14: [3, 1/4, 1/5],     // A3 > A1 > A2
        }
    },
    // 5. Andri Kurniawan — Pemuda karang taruna, SANGAT pro Magot
    {
        criteria: [4, 1/5, 1/8],
        subC1: [1/4, 1/3, 2], subC2: [3], subC3: [6],
        alts: {
            8:  [1/3, 1/4, 2],     // A2 > A3 > A1
            9:  [1/3, 1/2, 2],     // A2 > A3 > A1
            10: [1/3, 1/4, 2],     // A2 > A3 > A1
            11: [3, 6, 3],         // A1 > A2 > A3
            12: [1/5, 1/3, 3],     // A2 > A3 > A1
            13: [3, 1/5, 1/7],     // A3 >> A1 > A2
            14: [2, 1/5, 1/6],     // A3 >> A1 > A2
        }
    },
    // 6. Rina Wijaya — Pedagang pasar, fokus ekonomi
    {
        criteria: [2, 1/6, 1/8],
        subC1: [1/3, 1/2, 3], subC2: [4], subC3: [7],
        alts: {
            8:  [1/3, 2, 5],       // A2 > A1 > A3
            9:  [1/2, 2, 3],       // A2 > A1 > A3
            10: [1/4, 1/2, 3],     // A2 > A3 > A1
            11: [4, 5, 2],         // A1 > A2 > A3
            12: [1/3, 1/2, 2],     // A2 > A3 > A1
            13: [6, 1/3, 1/8],     // A3 >> A1 >> A2
            14: [3, 1/3, 1/5],     // A3 > A1 > A2
        }
    },
    // 7. Hendra Setiawan — Tokoh masyarakat, bijak
    {
        criteria: [3, 1/3, 1/5],
        subC1: [1/4, 1/3, 2], subC2: [3], subC3: [5],
        alts: {
            8:  [1/3, 2, 5],
            9:  [1/3, 3, 6],
            10: [1/3, 2, 5],
            11: [3, 5, 2],
            12: [1/3, 1/2, 2],
            13: [4, 2, 1/3],
            14: [3, 1/2, 1/4],
        }
    },
    // 8. Fajar Nugroho — Pekerja kantoran
    {
        criteria: [3, 1/4, 1/5],
        subC1: [1/3, 1/2, 3], subC2: [5], subC3: [6],
        alts: {
            8:  [1/2, 3, 5],
            9:  [2, 3, 2],
            10: [1/3, 1/2, 2],
            11: [4, 6, 2],
            12: [1/5, 1/3, 3],
            13: [5, 3, 1/3],
            14: [4, 1/3, 1/6],
        }
    },
    // 9. Dian Pratiwi — Aktivis lingkungan
    {
        criteria: [2, 1/6, 1/8],
        subC1: [1/5, 1/4, 3], subC2: [3], subC3: [7],
        alts: {
            8:  [1/4, 1/3, 2],
            9:  [1/4, 1/2, 3],
            10: [1/3, 1/5, 1/2],
            11: [3, 7, 3],
            12: [1/4, 1/3, 2],
            13: [2, 1/5, 1/6],
            14: [2, 1/6, 1/7],
        }
    },
    // 10. Eko Prasetyo — Petani
    {
        criteria: [3, 1/3, 1/5],
        subC1: [1/3, 1/2, 2], subC2: [3], subC3: [4],
        alts: {
            8:  [1/2, 4, 6],
            9:  [2, 5, 3],
            10: [1/3, 2, 5],
            11: [4, 6, 2],
            12: [1/3, 1/2, 2],
            13: [4, 2, 1/3],
            14: [3, 1/2, 1/4],
        }
    },
    // 11. Tri Astuti — Kader PKK
    {
        criteria: [2, 1/3, 1/5],
        subC1: [1/5, 1/2, 4], subC2: [3], subC3: [5],
        alts: {
            8:  [1/3, 2, 5],
            9:  [1/3, 2, 5],
            10: [1/4, 2, 6],
            11: [3, 4, 2],
            12: [1/4, 1/2, 3],
            13: [3, 2, 1/3],
            14: [2, 1/3, 1/4],
        }
    },
    // 12. Bambang Sutrisno — Pensiunan PNS
    {
        criteria: [4, 1/3, 1/6],
        subC1: [1/3, 1/3, 2], subC2: [4], subC3: [4],
        alts: {
            8:  [2, 5, 3],
            9:  [3, 6, 3],
            10: [1/2, 4, 6],
            11: [5, 8, 2],
            12: [1/2, 2, 3],
            13: [7, 5, 1/3],
            14: [4, 3, 1/2],
        }
    },
    // 13. Nita Permata — Mahasiswi
    {
        criteria: [2, 1/4, 1/5],
        subC1: [1/5, 1/3, 3], subC2: [3], subC3: [6],
        alts: {
            8:  [1/3, 1/3, 2],
            9:  [1/2, 2, 3],
            10: [1/3, 1/2, 2],
            11: [3, 5, 2],
            12: [1/4, 1/3, 2],
            13: [2, 1/4, 1/5],
            14: [2, 1/5, 1/6],
        }
    },
    // 14. Agus Saputra — Tukang
    {
        criteria: [3, 1/4, 1/5],
        subC1: [1/3, 1/2, 2], subC2: [2], subC3: [5],
        alts: {
            8:  [1/3, 3, 7],
            9:  [1/3, 2, 5],
            10: [1/3, 2, 5],
            11: [4, 5, 2],
            12: [1/3, 1/2, 2],
            13: [3, 2, 1/2],
            14: [3, 1/3, 1/5],
        }
    },
    // 15. Maya Indriani — Wirausaha
    {
        criteria: [2, 1/5, 1/7],
        subC1: [1/3, 1/2, 2], subC2: [4], subC3: [7],
        alts: {
            8:  [1/3, 1/2, 2],
            9:  [1/2, 3, 5],
            10: [1/4, 1/2, 3],
            11: [3, 6, 3],
            12: [1/5, 1/3, 3],
            13: [3, 1/3, 1/5],
            14: [3, 1/4, 1/5],
        }
    },
];

// ==================== FUNGSI UTILITAS AHP ====================
const RANDOM_INDEX = { 1: 0, 2: 0, 3: 0.58, 4: 0.90, 5: 1.12, 6: 1.24, 7: 1.32, 8: 1.41, 9: 1.45, 10: 1.49 };

function geometricMean(values) {
    if (values.length === 0) return 0;
    if (values.length === 1) return values[0];
    const logSum = values.reduce((sum, val) => sum + Math.log(val), 0);
    return Math.exp(logSum / values.length);
}
function buildPairwiseMatrix(items, compMap) {
    const n = items.length;
    const matrix = Array.from({ length: n }, () => Array(n).fill(1));
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            const key = `${items[i]}-${items[j]}`;
            const reverseKey = `${items[j]}-${items[i]}`;
            let values = compMap[key] || [];
            let reverseValues = compMap[reverseKey] || [];
            const allValues = [...values, ...reverseValues.map(v => 1 / v)];
            if (allValues.length > 0) {
                const gm = geometricMean(allValues);
                matrix[i][j] = gm;
                matrix[j][i] = 1 / gm;
            }
        }
    }
    return matrix;
}
function calculateEigenVector(matrix) {
    const n = matrix.length;
    if (n === 0) return [];
    const columnSums = Array(n).fill(0);
    for (let j = 0; j < n; j++) for (let i = 0; i < n; i++) columnSums[j] += matrix[i][j];
    const norm = matrix.map((row) => row.map((val, j) => val / columnSums[j]));
    return norm.map((row) => row.reduce((a, b) => a + b, 0) / n);
}
function calculateConsistencyRatio(matrix, eigenVector) {
    const n = matrix.length;
    if (n <= 2) return { lambdaMax: n, CI: 0, CR: 0, isConsistent: true };
    const wsv = matrix.map(row => row.reduce((sum, val, j) => sum + val * eigenVector[j], 0));
    const lambdas = wsv.map((val, i) => eigenVector[i] !== 0 ? val / eigenVector[i] : 0);
    const lambdaMax = lambdas.reduce((a, b) => a + b, 0) / n;
    const CI = (lambdaMax - n) / (n - 1);
    const RI = RANDOM_INDEX[n] || 1.49;
    const CR = RI !== 0 ? CI / RI : 0;
    return { lambdaMax: +lambdaMax.toFixed(6), CI: +CI.toFixed(6), CR: +Math.abs(CR).toFixed(6), isConsistent: Math.abs(CR) < 0.1 };
}

function generateComparisonsForUser(userId, dataIndex) {
    const d = respondentData[dataIndex];
    const list = [];
    list.push(
        { category: 'criteria', criteria_id_1: 4, criteria_id_2: 5, value: d.criteria[0] },
        { category: 'criteria', criteria_id_1: 4, criteria_id_2: 6, value: d.criteria[1] },
        { category: 'criteria', criteria_id_1: 5, criteria_id_2: 6, value: d.criteria[2] },
        { category: 'sub_criteria', parent_criteria_id: 4, sub_criteria_id_1: 8, sub_criteria_id_2: 9, value: d.subC1[0] },
        { category: 'sub_criteria', parent_criteria_id: 4, sub_criteria_id_1: 8, sub_criteria_id_2: 10, value: d.subC1[1] },
        { category: 'sub_criteria', parent_criteria_id: 4, sub_criteria_id_1: 9, sub_criteria_id_2: 10, value: d.subC1[2] },
        { category: 'sub_criteria', parent_criteria_id: 5, sub_criteria_id_1: 11, sub_criteria_id_2: 12, value: d.subC2[0] },
        { category: 'sub_criteria', parent_criteria_id: 6, sub_criteria_id_1: 13, sub_criteria_id_2: 14, value: d.subC3[0] }
    );
    for (const scId of [8, 9, 10, 11, 12, 13, 14]) {
        const [a12, a13, a23] = d.alts[scId];
        list.push(
            { category: 'alternative', parent_sub_criteria_id: scId, alternative_id_1: 1, alternative_id_2: 2, value: a12 },
            { category: 'alternative', parent_sub_criteria_id: scId, alternative_id_1: 1, alternative_id_2: 3, value: a13 },
            { category: 'alternative', parent_sub_criteria_id: scId, alternative_id_1: 2, alternative_id_2: 3, value: a23 }
        );
    }
    return list.map(item => ({ id_users: userId, ...item }));
}

async function seedData() {
    try {
        console.log('🔄 Menghubungkan ke database...');
        await sequelize.authenticate();
        console.log('✅ Terhubung ke database.\n');

        const pw = await bcrypt.hash('password123', 10);
        let newComps = [], created = 0;

        for (let i = 0; i < respondentsList.length; i++) {
            const [user, isNew] = await User.findOrCreate({
                where: { username: respondentsList[i].username },
                defaults: { password: pw, role: 'responden' }
            });
            if (isNew) { created++; console.log(`👤 Baru (${i+1}/16): @${user.username} (ID: ${user.id_users})`); }
            else console.log(`ℹ️  Existing: @${user.username} (ID: ${user.id_users})`);

            await Comparison.destroy({ where: { id_users: user.id_users } });
            newComps.push(...generateComparisonsForUser(user.id_users, i));
        }

        await Comparison.bulkCreate(newComps, { validate: true });
        console.log(`\n🎉 SEEDING SELESAI! Record dipasang untuk ${respondentsList.length} responden!\n`);
        process.exit(0);
    } catch (e) { console.error('❌ Error:', e.message); process.exit(1); }
}

seedData();
