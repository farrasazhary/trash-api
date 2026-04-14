const sequelize = require('../config/database');
const User = require('./User');
const Criteria = require('./Criteria');
const SubCriteria = require('./SubCriteria');
const Alternative = require('./Alternative');
const Comparison = require('./Comparison');
const Ranking = require('./Ranking');

// ==================== ASOSIASI / RELASI ====================

// User memiliki banyak Comparison
User.hasMany(Comparison, { foreignKey: 'id_users', as: 'comparisons' });
Comparison.belongsTo(User, { foreignKey: 'id_users', as: 'user' });

// Criteria memiliki banyak SubCriteria
Criteria.hasMany(SubCriteria, { foreignKey: 'id_criteria', as: 'subCriteria' });
SubCriteria.belongsTo(Criteria, { foreignKey: 'id_criteria', as: 'criteria' });

// Alternative memiliki banyak Ranking
Alternative.hasMany(Ranking, { foreignKey: 'id_alternatives', as: 'rankings' });
Ranking.belongsTo(Alternative, { foreignKey: 'id_alternatives', as: 'alternative' });

// === Comparisons → Criteria (FK eksplisit) ===
Criteria.hasMany(Comparison, { foreignKey: 'criteria_id_1', as: 'comparisonsAsItem1' });
Criteria.hasMany(Comparison, { foreignKey: 'criteria_id_2', as: 'comparisonsAsItem2' });
Criteria.hasMany(Comparison, { foreignKey: 'parent_criteria_id', as: 'comparisonsAsParent' });
Comparison.belongsTo(Criteria, { foreignKey: 'criteria_id_1', as: 'criteriaItem1' });
Comparison.belongsTo(Criteria, { foreignKey: 'criteria_id_2', as: 'criteriaItem2' });
Comparison.belongsTo(Criteria, { foreignKey: 'parent_criteria_id', as: 'parentCriteria' });

// === Comparisons → SubCriteria (FK eksplisit) ===
SubCriteria.hasMany(Comparison, { foreignKey: 'sub_criteria_id_1', as: 'comparisonsAsItem1' });
SubCriteria.hasMany(Comparison, { foreignKey: 'sub_criteria_id_2', as: 'comparisonsAsItem2' });
SubCriteria.hasMany(Comparison, { foreignKey: 'parent_sub_criteria_id', as: 'comparisonsAsParent' });
Comparison.belongsTo(SubCriteria, { foreignKey: 'sub_criteria_id_1', as: 'subCriteriaItem1' });
Comparison.belongsTo(SubCriteria, { foreignKey: 'sub_criteria_id_2', as: 'subCriteriaItem2' });
Comparison.belongsTo(SubCriteria, { foreignKey: 'parent_sub_criteria_id', as: 'parentSubCriteria' });

// === Comparisons → Alternatives (FK eksplisit) ===
Alternative.hasMany(Comparison, { foreignKey: 'alternative_id_1', as: 'comparisonsAsItem1' });
Alternative.hasMany(Comparison, { foreignKey: 'alternative_id_2', as: 'comparisonsAsItem2' });
Comparison.belongsTo(Alternative, { foreignKey: 'alternative_id_1', as: 'alternativeItem1' });
Comparison.belongsTo(Alternative, { foreignKey: 'alternative_id_2', as: 'alternativeItem2' });

module.exports = {
    sequelize,
    User,
    Criteria,
    SubCriteria,
    Alternative,
    Comparison,
    Ranking,
};
