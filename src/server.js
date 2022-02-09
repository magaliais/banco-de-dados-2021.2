const express = require("express");
const server = express();

// importa módulo do express responsável por criar e manipular as rotas
const routes = require("./routes");

// importa módulo que fornece utilidades para trabalhar com paths dos diretórios
const path = require("path");

// CONFIG ----------------------------------------------------------------------
// mudar a localização da pasta views
server.set("views", path.join(__dirname, "views"));

// especificar que queremos usar o EJS como template engine para o express
server.set("view engine", "ejs");

// habilitando uso do req.body para a configuração das rotas post
server.use(express.urlencoded({ extended: true }));

// habilitar arquivos estáticos
server.use(express.static("public"));

// rotas
server.use(routes);

// -----------------------------------------------------------------------------

server.listen(8080, () => {
  console.log("Servidor na url https://localhost:8080");
});
