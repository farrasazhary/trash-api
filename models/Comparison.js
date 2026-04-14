const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Comparison = sequelize.define('Comparison', {
    id_comparisons: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    id_users: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'users',
            key: 'id_users',
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE',
    },
    category: {
        type: DataTypes.ENUM('criteria', 'sub_criteria', 'alternative'),
        allowNull: false,
    },

    // === FK Eksplisit untuk perbandingan Kriteria ===
    criteria_id_1: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'criteria', key: 'id_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },
    criteria_id_2: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'criteria', key: 'id_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },

    // === FK Eksplisit untuk parent kriteria ===
    parent_criteria_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'criteria', key: 'id_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },

    // === FK Eksplisit untuk perbandingan Sub-Kriteria ===
    sub_criteria_id_1: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'sub_criteria', key: 'id_sub_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },
    sub_criteria_id_2: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'sub_criteria', key: 'id_sub_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },

    // === FK Eksplisit untuk parent sub-kriteria ===
    parent_sub_criteria_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'sub_criteria', key: 'id_sub_criteria' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },

    // === FK Eksplisit untuk perbandingan Alternatif ===
    alternative_id_1: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'alternatives', key: 'id_alternatives' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },
    alternative_id_2: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: { model: 'alternatives', key: 'id_alternatives' },
        onDelete: 'SET NULL',
        onUpdate: 'CASCADE',
    },

    value: {
        type: DataTypes.FLOAT,
        allowNull: false,
    },
}, {
    tableName: 'comparisons',
    timestamps: true,
});

module.exports = Comparison;
