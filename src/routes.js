const express = require("express");
const routes = express.Router();

// rotas get -------------------------------------------------------------------
routes.get("/", function (req, res) {
  res.send("Rota de cadastro de post");
});

routes.get("/teste", function (req, res) {
  res.send("teste");
});

module.exports = routes;
