const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Alternative = sequelize.define('Alternative', {
    id_alternatives: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
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
}, {
    tableName: 'alternatives',
    timestamps: true,
});

module.exports = Alternative;
