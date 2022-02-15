const express = require("express");
const routes = express.Router();

const Personagem = require("./models/Personagem");
const Quadrinho = require("./models/Quadrinho");

// rotas get -------------------------------------------------------------------
routes.get("/", (req, res) => res.render('index'));

routes.get("/personagem", (req, res) => res.render('personagem'));
routes.get("/quadrinho", (req, res) => {
  Personagem.findAll().then((personagens) => res.render("quadrinho", { personagens }));
});
routes.get("/personagens", (req, res) => {
  Personagem.findAll().then(personagens => res.render("personagens", {personagens}));
});


// rotas post ------------------------------------------------------------------
routes.post("/personagem", (req, res) => {
  Personagem.create({
    nome: req.body.nome,
    genero: req.body.genero,
    personagem_tipo: req.body.tipo,
  }).then(() => {
    res.render('sucesso', { personagem: req.body.nome });
  }).catch(erro => {
    res.send(`Houve um erro ao cadastrar ${req.body.nome}: ${erro}`);
  });
});

routes.post("/quadrinho", (req, res) => {
  Quadrinho.create({
    nome: req.body.nome,
    tipo: req.body.tipo,
    descricao: req.body.descricao,
    capa_dura: 1, // mudar
    nacionalidade: req.body.nacionalidade,
  })
    .then(() => {
      res.render("sucesso", { personagem: req.body.nome });
    })
    .catch((erro) => {
      res.send(`Houve um erro ao cadastrar ${req.body.nome}: ${erro}`);
    });
});

module.exports = routes;
