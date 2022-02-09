const express = require("express");
const routes = express.Router();

// rotas get -------------------------------------------------------------------
routes.get("/", (req, res) => res.render('index'));
routes.get("/form", (req, res) => res.render('form'));

routes.get("/teste", function (req, res) {
  res.send("teste");
});

module.exports = routes;
