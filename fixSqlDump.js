const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'spk_sampah.sql');
let content = fs.readFileSync(filePath, 'utf8');

// Tambahkan DISABLE FOREIGN KEY CHECKS di awal dan ENABLE di akhir
if (!content.includes('FOREIGN_KEY_CHECKS')) {
    content = 'SET FOREIGN_KEY_CHECKS = 0;\n' + content + '\nSET FOREIGN_KEY_CHECKS = 1;\n';
}

// Tambahkan DROP TABLE IF EXISTS sebelum CREATE TABLE
const tables = ['alternatives', 'comparisons', 'criteria', 'rankings', 'sub_criteria', 'users'];
tables.forEach(t => {
    const target = `CREATE TABLE \`${t}\``;
    const replacement = `DROP TABLE IF EXISTS \`${t}\`;\n${target}`;
    content = content.replace(target, replacement);
});

fs.writeFileSync(filePath, content, 'utf8');
console.log('✅ Added DROP TABLE IF EXISTS and FOREIGN_KEY_CHECKS to spk_sampah.sql');
