const express = require("express");
const routes = express.Router();

const Personagem = require("./models/Personagem");
const Quadrinho = require("./models/Quadrinho");
const Filme = require("./models/Filme");

// rotas get -------------------------------------------------------------------
routes.get("/", (req, res) => res.render('index'));

routes.get("/personagem", (req, res) => res.render('personagem'));
routes.get("/personagens", (req, res) => {
  Personagem.findAll().then(personagens => res.render("personagens", {personagens}));
});

routes.get("/quadrinho", (req, res) => {
  Personagem.findAll().then((personagens) => res.render("quadrinho", { personagens }));
});

routes.get("/filme", (req, res) => {
  Personagem.findAll().then((personagens) => res.render("filme", { personagens }));
});



// rotas post ------------------------------------------------------------------
routes.post("/personagem", (req, res) => {
  Personagem.create({
    nome: req.body.nome,
    genero: req.body.genero,
    personagem_tipo: req.body.tipo,
  }).then(() => {
    res.render("sucesso", { objeto: req.body.nome });
  }).catch(erro => {
    res.send(`Houve um erro ao cadastrar o personagem ${req.body.nome}: ${erro}`);
  });
});

routes.post("/quadrinho", (req, res) => {
  Quadrinho.create({
    nome: req.body.nome,
    tipo: req.body.tipo,
    descricao: req.body.descricao,
    capa_dura: req.body.capa_dura ? true : false,
    nacionalidade: req.body.nacionalidade,
  })
    .then(() => {
      res.render("sucesso", { objeto: req.body.nome });
    })
    .catch((erro) => {
      res.send(`Houve um erro ao cadastrar o quadrinho ${req.body.nome}: ${erro}`);
    });
});

routes.post("/filme", (req, res) => {
  Filme.create({
    titulo: req.body.titulo,
    ano_lancamento: req.body.ano_lancamento,
    fk_personagem_id: req.body.personagem,
  })
    .then(() => {
      res.render("sucesso", { objeto: req.body.titulo });
    })
    .catch((erro) => {
      res.send(
        `Houve um erro ao cadastrar o filme ${req.body.titulo}: ${erro}`
      );
    });
});



routes.post("/deletar-personagem/:id", (req, res) => {
  Personagem.destroy({ where: { id: req.params.id } })
    .then(() => res.send(`Personagem deletado com sucesso!`))
    .catch(erro => {
      res.send(`Houve um erro ao deletar o personagem! Erro: ${erro}`);
    });
});

module.exports = routes;
