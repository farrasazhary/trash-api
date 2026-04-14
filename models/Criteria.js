const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Criteria = sequelize.define('Criteria', {
    id_criteria: {
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
    bobot: {
        type: DataTypes.FLOAT,
        allowNull: true,
        defaultValue: 0,
    },
}, {
    tableName: 'criteria',
    timestamps: true,
});

module.exports = Criteria;
