const db = require("./db");

const Filme = db.sequelize.define("filmes", {
  id: {
    type: db.Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  titulo: {
    type: db.Sequelize.STRING,
  },
  ano_lancamento: {
    type: db.Sequelize.INTEGER,
  },
});

// Filme.sync({force: true});

module.exports = Filme;
