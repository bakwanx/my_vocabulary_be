'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Vocab extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Vocab.belongsTo(models.TypeVocab, {
        foreignKey: 'idType',
        as: 'typeVocab'
      });
    }
  }
  Vocab.init({
    idUser: DataTypes.INTEGER,
    idType: DataTypes.INTEGER,
    vocab: DataTypes.STRING,
    translation: DataTypes.STRING,
    variation: DataTypes.STRING,
    note: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Vocab',
    tableName: 'Vocabs'
  });
  return Vocab;
};