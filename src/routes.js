const express = require("express");
const routes = express.Router();

const Personagem = require("./models/Personagem");

// rotas get -------------------------------------------------------------------
routes.get("/", (req, res) => res.render('index'));
routes.get("/personagem", (req, res) => res.render('personagem'));

routes.get("/teste", function (req, res) {
  res.send("teste");
});

// rotas post ------------------------------------------------------------------
routes.post("/personagem", (req, res) => {
  Personagem.create({
    nome: req.body.nome,
    genero: req.body.genero,
    personagem_tipo: req.body.tipo,
  }).then(() => {
    res.send(`Personagem ${req.body.nome} cadastrado com sucesso!`);
  }).catch(erro => {
    res.send(`Houve um erro ao cadastrar ${req.body.nome}: ${erro}`);
  });
});

module.exports = routes;
