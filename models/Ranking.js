const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Ranking = sequelize.define('Ranking', {
    id_rankings: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    id_alternatives: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: 'alternatives',
            key: 'id_alternatives',
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE',
    },
    score: {
        type: DataTypes.FLOAT,
        allowNull: false,
        defaultValue: 0,
    },
    rank: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
    },
}, {
    tableName: 'rankings',
    timestamps: true,
});

module.exports = Ranking;
