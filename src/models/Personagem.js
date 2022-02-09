const db = require('./db');

const Personagem = db.sequelize.define("personagens", {
  id: {
    type: db.Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  nome: {
    type: db.Sequelize.STRING,
  },
  genero: {
    type: db.Sequelize.BOOLEAN,
  },
  tipo: {
    type: db.Sequelize.INTEGER,
  },
});

// Personagem.sync({force: true});

module.exports = Personagem;