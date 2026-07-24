-- =================================================================
-- SCRIPT SQL: Rollback User & Data Perbandingan dari Seeder
-- =================================================================

START TRANSACTION;

-- 1. Hapus Data Perbandingan (Comparisons) milik User Seeder (ID > 3 atau username spesifik)
DELETE FROM `comparisons` 
WHERE `id_users` IN (
    SELECT `id_users` FROM `users` WHERE `username` IN ('bapakrt3', 'bapakrt4', 'ibu_rt01', 'ibu_rt02', 'tokoh_masyarakat1') OR `id_users` > 3
);

-- 2. Hapus User Seeder
DELETE FROM `users` 
WHERE `username` IN ('bapakrt3', 'bapakrt4', 'ibu_rt01', 'ibu_rt02', 'tokoh_masyarakat1') OR `id_users` > 3;

COMMIT;
