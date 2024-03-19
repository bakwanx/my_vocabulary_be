'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TypeVocab extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      TypeVocab.hasMany(models.Vocab, {
        foreignKey: 'idType',
        as: 'typeVocab'
      });
    }
  }
  TypeVocab.init({
    type: DataTypes.STRING,
    description: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'TypeVocab',
    tableName: 'TypeVocabs'
  });
  return TypeVocab;
};