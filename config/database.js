const Sequelize = require('sequelize');
// pass mysql for mac flutter123
const sequelize =  new Sequelize.Sequelize(
    "my_vocab",
    "root",
    "bakwanx123!",
  {
    host: "mysql",
    dialect: "mysql",
    operatorsAliases: false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    },
  },
);

module.exports = sequelize;

// "development": {
//   "username": "root",
//   "password": "flutter123",
//   "database": "myvocab_db",
//   "host": "127.0.0.1",
//   "dialect": "mysql"
// },