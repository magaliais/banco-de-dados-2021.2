CREATE DATABASE trabalho;

CREATE TABLE trabalho.personagens (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
genero char,
personagem_tipo int,
createdAt date,
updatedAt date,
UNIQUE(nome)
-- 0 = heroi / 1 = vilao / 2 = antiheroi
);

CREATE TABLE trabalho.filmes (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo varchar(50) NOT NULL, 
ano_lancamento int,
createdAt date,
updatedAt date,
UNIQUE(titulo)
);

CREATE TABLE trabalho.leitores (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nick varchar(50) NOT NULL,
nome varchar(50) NOT NULL,
createdAt date,
updatedAt date,
UNIQUE(nick),
UNIQUE(nome)
);

CREATE TABLE trabalho.super_poderes(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
descricao text,
createdAt date,
updatedAt date,
UNIQUE(nome)
);

CREATE TABLE trabalho.autores (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
descricao text,
createdAt date,
updatedAt date,
UNIQUE(nome)
);

CREATE TABLE trabalho.coletaneas (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo varchar(50) NOT NULL,
qualidade int,
ano_lancamento int,
createdAt date,
updatedAt date,
UNIQUE(titulo)
);

CREATE TABLE trabalho.editoras (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
createdAt date,
updatedAt date,
UNIQUE(nome)
);

CREATE TABLE trabalho.quadrinhos (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
tipo int,
descricao text,
capa_dura bool,
nacionalidade text,
fk_coletaneas_id int,
createdAt date,
updatedAt date,
UNIQUE(nome),
FOREIGN KEY (fk_coletaneas_id) REFERENCES coletaneas(id)
);

CREATE TABLE trabalho.participa (
fk_personagem_id int,
fk_quadrinho_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_personagem_id) REFERENCES personagens(id),
FOREIGN KEY (fk_quadrinho_id) REFERENCES quadrinhos(id)
);

CREATE TABLE trabalho.possui (
fk_personagem_id int,
fk_super_poder_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_personagem_id) REFERENCES personagens(id),
FOREIGN KEY (fk_super_poder_id) REFERENCES super_poderes(id)
);

CREATE TABLE trabalho.prefere (
fk_personagem_id int, 
fk_leitor_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_personagem_id) REFERENCES personagens(id),
FOREIGN KEY (fk_leitor_id) REFERENCES leitores(id)
);

CREATE TABLE trabalho.escreve (
fk_quadrinho_id int,
fk_autor_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_quadrinho_id) REFERENCES quadrinhos(id),
FOREIGN KEY (fk_autor_id) REFERENCES autores(id)
);

CREATE TABLE trabalho.edicoes_especiais (
fk_quadrinho_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_quadrinho_id) REFERENCES quadrinhos(id)
);

CREATE TABLE trabalho.pertence (
fk_quadrinho_id int,
fk_editora_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_quadrinho_id) REFERENCES quadrinhos(id),
FOREIGN KEY (fk_editora_id) REFERENCES editoras(id)
);

CREATE TABLE trabalho.existes (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_personagem_id int,
fk_filme_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_personagem_id) REFERENCES personagens(id),
FOREIGN KEY (fk_filme_id) REFERENCES filmes(id)
);

CREATE TABLE trabalho.almanaques (
fk_quadrinhos_id int,
createdAt date,
updatedAt date,
FOREIGN KEY (fk_quadrinhos_id) REFERENCES quadrinhos(id)
);