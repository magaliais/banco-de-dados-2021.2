const db = require("./db");

const Existe = db.sequelize.define("existe", {
  id: {
    type: db.Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  fk_personagem_id: {
    type: db.Sequelize.INTEGER,
    references: {
      model: "personagens",
      key: "id",
    },
  },
  fk_filme_id: {
    type: db.Sequelize.INTEGER,
    references: {
      model: "filmes",
      key: "id",
    },
  },
});

// Existe.sync({force: true});

module.exports = Existe;
