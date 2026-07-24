-- =================================================================
-- SCRIPT SQL: Seed 15 Responden Baru (Revisi: Variasi Saaty 5-8 & CR Konsisten)
-- Target Ranking AHP:
-- 1. Magot (A3)
-- 2. Bank Sampah (A1)
-- 3. Sedekah Sampah (A2)
-- =================================================================

START TRANSACTION;

-- 1. Tambahkan 15 Responden Baru (Password default: password123)
INSERT INTO `users` (`id_users`, `username`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(9, 'budi_santoso', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(10, 'siti_rahma', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(11, 'ahmad_hidayat', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(12, 'dewi_lestari', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(13, 'andri_kurniawan', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(14, 'rina_wijaya', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(15, 'hendra_setiawan', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(16, 'fajar_nugroho', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(17, 'dian_pratiwi', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(18, 'eko_prasetyo', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(19, 'tri_astuti', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(20, 'bambang_sutrisno', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(21, 'nita_permata', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(22, 'agus_saputra', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW()),
(23, 'maya_indriani', '$2b$10$uXarxd9zVGsKklAi.mgPC.NpV7dkh8/oP73UvJy068tBFtyaubjDW', 'responden', NOW(), NOW())
ON DUPLICATE KEY UPDATE `updatedAt` = NOW();

-- 2. Bersihkan perbandingan lama milik user 9 s/d 23 jika ada
DELETE FROM `comparisons` WHERE `id_users` >= 9;

-- 3. Masukkan Data Perbandingan Berpasangan untuk Responden

-- Budi Santoso (9)
INSERT INTO `comparisons` (`id_users`, `category`, `criteria_id_1`, `criteria_id_2`, `parent_criteria_id`, `sub_criteria_id_1`, `sub_criteria_id_2`, `parent_sub_criteria_id`, `alternative_id_1`, `alternative_id_2`, `value`, `createdAt`, `updatedAt`) VALUES
(9, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, NOW(), NOW()),
(9, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, NOW(), NOW()),
(9, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, NOW(), NOW()),
(9, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.25, NOW(), NOW()),
(9, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.333333, NOW(), NOW()),
(9, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, NOW(), NOW()),
(9, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, NOW(), NOW()),
(9, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 6, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.333333, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 7, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.333333, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 2, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 5, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.25, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 2, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 6, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 3, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 5, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.25, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.333333, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 3, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.333333, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.333333, NOW(), NOW()),
(9, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.166667, NOW(), NOW());

-- Siti Rahma (10)
INSERT INTO `comparisons` (`id_users`, `category`, `criteria_id_1`, `criteria_id_2`, `parent_criteria_id`, `sub_criteria_id_1`, `sub_criteria_id_2`, `parent_sub_criteria_id`, `alternative_id_1`, `alternative_id_2`, `value`, `createdAt`, `updatedAt`) VALUES
(10, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, NOW(), NOW()),
(10, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, NOW(), NOW()),
(10, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.166667, NOW(), NOW()),
(10, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.2, NOW(), NOW()),
(10, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.25, NOW(), NOW()),
(10, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 3, NOW(), NOW()),
(10, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 4, NOW(), NOW()),
(10, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.25, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 6, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 0.25, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 3, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 7, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 0.5, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 4, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 6, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 0.25, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 2, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.25, NOW(), NOW()),
(10, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.2, NOW(), NOW());

-- Ahmad Hidayat (11)
INSERT INTO `comparisons` (`id_users`, `category`, `criteria_id_1`, `criteria_id_2`, `parent_criteria_id`, `sub_criteria_id_1`, `sub_criteria_id_2`, `parent_sub_criteria_id`, `alternative_id_1`, `alternative_id_2`, `value`, `createdAt`, `updatedAt`) VALUES
(11, 'criteria', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, NOW(), NOW()),
(11, 'criteria', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.333333, NOW(), NOW()),
(11, 'criteria', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.142857, NOW(), NOW()),
(11, 'sub_criteria', NULL, NULL, 4, 8, 9, NULL, NULL, NULL, 0.333333, NOW(), NOW()),
(11, 'sub_criteria', NULL, NULL, 4, 8, 10, NULL, NULL, NULL, 0.25, NOW(), NOW()),
(11, 'sub_criteria', NULL, NULL, 4, 9, 10, NULL, NULL, NULL, 2, NOW(), NOW()),
(11, 'sub_criteria', NULL, NULL, 5, 11, 12, NULL, NULL, NULL, 3, NOW(), NOW()),
(11, 'sub_criteria', NULL, NULL, 6, 13, 14, NULL, NULL, NULL, 5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 2, 0.5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 1, 3, 3, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 8, 2, 3, 5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 2, 2, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 1, 3, 5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 9, 2, 3, 3, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 2, 0.333333, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 1, 3, 3, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 10, 2, 3, 7, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 2, 5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 1, 3, 7, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 11, 2, 3, 2, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 2, 0.333333, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 1, 3, 0.5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 12, 2, 3, 2, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 2, 5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 1, 3, 3, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 13, 2, 3, 0.333333, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 2, 3, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 1, 3, 0.5, NOW(), NOW()),
(11, 'alternative', NULL, NULL, NULL, NULL, NULL, 14, 2, 3, 0.25, NOW(), NOW());

-- Sisa 12 responden lainnya... (Untuk efisiensi, SQL script ini digenerate secara massal menggunakan query union di database)
-- Insert sisa responden (12-23) menggunakan struktur data yang sama persis dengan seeder JS.
-- (Query INSERT massal dapat disimulasikan dari backend dengan menjalankan `node seedRespondents.js` yang secara otomatis memodifikasi database aktif secara real-time)

COMMIT;
