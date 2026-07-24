const { User, Comparison, sequelize } = require('./models');
const ExcelJS = require('exceljs');
const fs = require('fs');
const path = require('path');

const outputDir = path.join(__dirname, 'Hasil_Kuisioner_Excel');

if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
}

// 17 Skala Saaty (Cols B..R / 2..18)
const scaleNumbers = [9, 8, 7, 6, 5, 4, 3, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function getHighlightColIndex(v) {
    if (!v || Math.abs(v - 1) < 0.01) {
        return 10; // Col J (Middle 1)
    }
    if (v > 1) {
        const s = Math.min(9, Math.max(2, Math.round(v)));
        return 11 - s; // Col B..I (Left 9..2)
    } else {
        const s = Math.min(9, Math.max(2, Math.round(1 / v)));
        return 9 + s; // Col K..R (Right 2..9)
    }
}

function getCompVal(userComps, cat, id1, id2, parentId = null) {
    const item = userComps.find(c => {
        if (c.category !== cat) return false;
        if (cat === 'criteria') {
            return (c.criteria_id_1 === id1 && c.criteria_id_2 === id2) ||
                   (c.criteria_id_1 === id2 && c.criteria_id_2 === id1);
        }
        if (cat === 'sub_criteria') {
            if (parentId && c.parent_criteria_id !== parentId) return false;
            return (c.sub_criteria_id_1 === id1 && c.sub_criteria_id_2 === id2) ||
                   (c.sub_criteria_id_1 === id2 && c.sub_criteria_id_2 === id1);
        }
        if (cat === 'alternative') {
            if (parentId && (c.parent_sub_criteria_id === parentId || c.parent_criteria_id === parentId)) {
                return (c.alternative_id_1 === id1 && c.alternative_id_2 === id2) ||
                       (c.alternative_id_1 === id2 && c.alternative_id_2 === id1);
            }
            return false;
        }
        return false;
    });

    if (!item) return 1;

    let isDirect = false;
    if (cat === 'criteria') isDirect = (item.criteria_id_1 === id1);
    else if (cat === 'sub_criteria') isDirect = (item.sub_criteria_id_1 === id1);
    else if (cat === 'alternative') isDirect = (item.alternative_id_1 === id1);

    return isDirect ? item.value : (1 / item.value);
}

// Style Constants
const fontNormal = { name: 'Arial', size: 9 };
const fontBold = { name: 'Arial', size: 9, bold: true };
const fontHeader = { name: 'Arial', size: 10, bold: true };

const borderThin = {
    top: { style: 'thin', color: { argb: 'FFBFBFBF' } },
    left: { style: 'thin', color: { argb: 'FFBFBFBF' } },
    bottom: { style: 'thin', color: { argb: 'FFBFBFBF' } },
    right: { style: 'thin', color: { argb: 'FFBFBFBF' } }
};

const fillBlue = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FF9BC2E6' } };
const fillYellow = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFFFF00' } };
const fillSalmon = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFCE4D6' } };
const fillLightGray = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF2F2F2' } };
const fillWhite = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFFFFFF' } };

function buildSheetLayout(ws, userComps) {
    ws.columns = [
        { width: 26 }, // Col A (Left item)
        ...Array(17).fill({ width: 3.5 }), // Cols B..R (Scale 9..1..9)
        { width: 26 }  // Col S (Right item)
    ];

    let currentRow = 1;

    function addBannerHeader(text, bgFill, fontStyle = fontHeader) {
        const row = ws.getRow(currentRow);
        row.height = 20;
        ws.mergeCells(currentRow, 1, currentRow, 19);
        const cell = row.getCell(1);
        cell.value = text;
        cell.font = fontStyle;
        cell.fill = bgFill;
        cell.alignment = { horizontal: 'center', vertical: 'middle' };
        for (let c = 1; c <= 19; c++) {
            row.getCell(c).border = borderThin;
        }
        currentRow++;
    }

    function addComparisonRow(leftText, rightText, value) {
        const row = ws.getRow(currentRow);
        row.height = 18;

        const cellLeft = row.getCell(1);
        cellLeft.value = leftText;
        cellLeft.font = fontNormal;
        cellLeft.alignment = { horizontal: 'center', vertical: 'middle' };
        cellLeft.border = borderThin;

        const highlightCol = getHighlightColIndex(value);

        for (let i = 0; i < 17; i++) {
            const colIdx = i + 2;
            const cell = row.getCell(colIdx);
            cell.value = scaleNumbers[i];
            cell.font = fontNormal;
            cell.alignment = { horizontal: 'center', vertical: 'middle' };
            cell.border = borderThin;

            if (colIdx === highlightCol) {
                cell.fill = fillYellow;
                cell.font = fontBold;
            }
        }

        const cellRight = row.getCell(19);
        cellRight.value = rightText;
        cellRight.font = fontNormal;
        cellRight.alignment = { horizontal: 'center', vertical: 'middle' };
        cellRight.border = borderThin;

        currentRow++;
    }

    // 1. KRITERIA
    addBannerHeader('kriteria', fillBlue);
    addComparisonRow('aspek kesiapan', 'aspek sosial', getCompVal(userComps, 'criteria', 4, 5));
    addComparisonRow('aspek kesiapan', 'potensi manfaat', getCompVal(userComps, 'criteria', 4, 6));
    addComparisonRow('aspek sosial', 'potensi manfaat', getCompVal(userComps, 'criteria', 5, 6));

    currentRow++;

    // 2. SUB KRITERIA
    addBannerHeader('sub kriteria', fillYellow);

    addBannerHeader('A. kesiapan SDM', fillSalmon, fontBold);
    addComparisonRow('kebutuhan lahan', 'invest awal', getCompVal(userComps, 'sub_criteria', 9, 10, 4));
    addComparisonRow('kebutuhan lahan', 'sdm', getCompVal(userComps, 'sub_criteria', 9, 8, 4));
    addComparisonRow('invest awal', 'sdm', getCompVal(userComps, 'sub_criteria', 10, 8, 4));

    addBannerHeader('B. sosial & kemudahan', fillSalmon, fontBold);
    addComparisonRow('kemudahan pemilahan', 'potensi partisipasi warga', getCompVal(userComps, 'sub_criteria', 12, 11, 5));

    addBannerHeader('C. Potensi manfaat', fillSalmon, fontBold);
    addComparisonRow('nilai ekonomi', 'efektifitas reduksi sampah', getCompVal(userComps, 'sub_criteria', 13, 14, 6));

    currentRow++;

    // 3. TAHAP 2 (Alternatif per Sub-Kriteria)
    addBannerHeader('tahap 2', fillWhite, fontHeader);

    const subCriteriaSections = [
        { id: 9, title: 'sub kriteria kebutuhan lahan' },
        { id: 10, title: 'sub kriteria investasi awal' },
        { id: 8, title: 'sub kriteria kesiapan SDM' },
        { id: 12, title: 'sub kriteria kemudahan pemilahan' },
        { id: 11, title: 'sub kriteria potensi partisipasi warga' },
        { id: 13, title: 'sub kriteria nilai ekonomi' },
        { id: 14, title: 'sub kriteria efektifitas reduksi sampah' },
    ];

    subCriteriaSections.forEach(sec => {
        addBannerHeader(sec.title, fillLightGray, fontBold);
        addComparisonRow('bank sampah', 'magot', getCompVal(userComps, 'alternative', 1, 3, sec.id));
        addComparisonRow('bank sampah', 'sedekah sampah', getCompVal(userComps, 'alternative', 1, 2, sec.id));
        addComparisonRow('magot', 'sedekah sampah', getCompVal(userComps, 'alternative', 3, 2, sec.id));
    });
}

// Urutan responden resmi Kuisioner 1 s/d Kuisioner 18
const preferredUsernameOrder = [
    'bapakrw',          // Kuisioner 1
    'bapakrt1',         // Kuisioner 2
    'bapakrt2',         // Kuisioner 3
    'budi_santoso',     // Kuisioner 4
    'siti_rahma',       // Kuisioner 5
    'ahmad_hidayat',    // Kuisioner 6
    'dewi_lestari',     // Kuisioner 7
    'andri_kurniawan',  // Kuisioner 8
    'rina_wijaya',      // Kuisioner 9
    'hendra_setiawan',  // Kuisioner 10
    'fajar_nugroho',    // Kuisioner 11
    'dian_pratiwi',     // Kuisioner 12
    'eko_prasetyo',     // Kuisioner 13
    'tri_astuti',       // Kuisioner 14
    'bambang_sutrisno', // Kuisioner 15
    'nita_permata',     // Kuisioner 16
    'agus_saputra',     // Kuisioner 17
    'maya_indriani',    // Kuisioner 18
];

async function generateAllExcelFiles() {
    try {
        console.log('🔄 Menghubungkan ke MySQL...');
        await sequelize.authenticate();

        const respondents = await User.findAll({
            where: { role: 'responden' },
            include: [{ model: Comparison, as: 'comparisons' }]
        });

        const sortedRespondents = [];
        preferredUsernameOrder.forEach(uname => {
            const found = respondents.find(r => r.username === uname);
            if (found) sortedRespondents.push(found);
        });

        respondents.forEach(r => {
            if (!sortedRespondents.includes(r)) {
                sortedRespondents.push(r);
            }
        });

        console.log(`📍 Ditemukan ${sortedRespondents.length} responden di MySQL.`);

        const masterWorkbook = new ExcelJS.Workbook();

        for (let i = 0; i < sortedRespondents.length; i++) {
            const user = sortedRespondents[i];
            const userComps = user.comparisons || [];

            const kuesionerNum = i + 1; // Kuisioner 1, Kuisioner 2, ..., Kuisioner 18
            const sheetName = `kuisioner ${kuesionerNum}`;

            console.log(`📝 [${kuesionerNum}/${sortedRespondents.length}] @${user.username} -> Sheet "${sheetName}"`);

            // Master Workbook
            const masterSheet = masterWorkbook.addWorksheet(sheetName);
            buildSheetLayout(masterSheet, userComps);

            // Individual Workbook
            const indWorkbook = new ExcelJS.Workbook();
            const indSheet = indWorkbook.addWorksheet(sheetName);
            buildSheetLayout(indSheet, userComps);

            const singleFileName = `Kuisioner_${kuesionerNum}_${user.username}.xlsx`;
            try {
                await indWorkbook.xlsx.writeFile(path.join(outputDir, singleFileName));
            } catch (err) {
                console.warn(`⚠️ Tidak dapat menulis file ${singleFileName} (file mungkin sedang dibuka). Simpan dengan nama alternatif.`);
                await indWorkbook.xlsx.writeFile(path.join(outputDir, `Kuisioner_${kuesionerNum}_${user.username}_new.xlsx`));
            }
        }

        // Simpan Master Workbook
        const masterFilePath = path.join(outputDir, 'Master_Semua_Kuisioner_18_Responden.xlsx');
        await masterWorkbook.xlsx.writeFile(masterFilePath);

        console.log(`\n🎉 SPREADSHEET KUESIONER 1 s/d 18 BERHASIL DIGENERASI!`);
        console.log(`📁 Lokasi Folder Output: ${outputDir}`);
        console.log(`📄 Master File (Semua Sheet 1-18): ${masterFilePath}\n`);

        process.exit(0);
    } catch (error) {
        console.error('❌ Terjadi kesalahan:', error.message);
        process.exit(1);
    }
}

generateAllExcelFiles();
