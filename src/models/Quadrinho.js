const db = require("./db");

const Quadrinho = db.sequelize.define("quadrinhos", {
  id: {
    type: db.Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  nome: {
    type: db.Sequelize.STRING,
  },
  tipo: {
    type: db.Sequelize.INTEGER,
  },
  descricao: {
    type: db.Sequelize.STRING,
  },
  capa_dura: {
    type: db.Sequelize.BOOLEAN,
  },
  nacionalidade: {
    type: db.Sequelize.INTEGER,
  }
});

// Personagem.sync({force: true});

module.exports = Quadrinho;