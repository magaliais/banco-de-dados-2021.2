// banco de dados
const Sequelize = require("sequelize");

// Conectando ao banco de dados (nomeDoBanco, nomeUsuario[root], senha[''], { })
const sequelize = new Sequelize("trabalho", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

module.exports = {
  Sequelize: Sequelize,
  sequelize: sequelize
}