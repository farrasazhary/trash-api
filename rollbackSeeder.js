const { sequelize, User, Comparison } = require('./models');
const { Op } = require('sequelize');

/**
 * Script Rollback Responden Seeder
 * 
 * Menghapus semua user dan data perbandingan yang dibuat oleh seeder.
 * User asli (admin, bapakrt1, bapakrt2) TIDAK akan terhapus.
 */

const seededUsernames = [
    'budi_santoso', 'siti_rahma', 'ahmad_hidayat', 'dewi_lestari',
    'andri_kurniawan', 'rina_wijaya', 'hendra_setiawan', 'fajar_nugroho',
    'dian_pratiwi', 'eko_prasetyo', 'tri_astuti', 'bambang_sutrisno',
    'nita_permata', 'agus_saputra', 'maya_indriani',
    // Backward-compatible: username dari seeder lama
    'bapakrt3', 'bapakrt4', 'ibu_rt01', 'ibu_rt02', 'tokoh_masyarakat1'
];

async function rollbackData() {
    try {
        console.log('🔄 Menghubungkan ke database...');
        await sequelize.authenticate();
        console.log('✅ Terhubung ke database.');

        const seededUsers = await User.findAll({
            where: {
                [Op.or]: [
                    { username: { [Op.in]: seededUsernames } },
                    { id_users: { [Op.gt]: 3 } }
                ]
            }
        });

        if (seededUsers.length === 0) {
            console.log('ℹ️ Tidak ditemukan user seeder yang perlu di-rollback.');
            process.exit(0);
        }

        const userIds = seededUsers.map(u => u.id_users);
        const usernames = seededUsers.map(u => u.username);

        console.log(`📍 Menemukan ${seededUsers.length} user seeder: ${usernames.join(', ')}`);

        const deletedComparisons = await Comparison.destroy({
            where: { id_users: { [Op.in]: userIds } }
        });
        console.log(`🗑️ Berhasil menghapus ${deletedComparisons} record perbandingan.`);

        const deletedUsers = await User.destroy({
            where: { id_users: { [Op.in]: userIds } }
        });
        console.log(`🗑️ Berhasil menghapus ${deletedUsers} user seeder.`);

        console.log(`\n✨ ROLLBACK SELESAI! Database telah dikembalikan ke kondisi semula.`);
        process.exit(0);
    } catch (error) {
        console.error('❌ Terjadi kesalahan saat rollback:', error.message);
        process.exit(1);
    }
}

rollbackData();
