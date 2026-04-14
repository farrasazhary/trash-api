const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const SubCriteria = sequelize.define('SubCriteria', {
    id_sub_criteria: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    id_criteria: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'criteria',
            key: 'id_criteria',
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE',
    },
    kode: {
        type: DataTypes.STRING(10),
        allowNull: false,
        unique: true,
    },
    nama: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    bobot_lokal: {
        type: DataTypes.FLOAT,
        allowNull: true,
        defaultValue: 0,
    },
    bobot_global: {
        type: DataTypes.FLOAT,
        allowNull: true,
        defaultValue: 0,
    },
}, {
    tableName: 'sub_criteria',
    timestamps: true,
});

module.exports = SubCriteria;
