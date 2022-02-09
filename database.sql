CREATE DATABASE trabalho;

CREATE TABLE trabalho.Filme (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo varchar(50) NOT NULL, 
ano_lancamento int,
UNIQUE(titulo)
);

CREATE TABLE trabalho.Personagem (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
genero char,
Personagem_Tipo int,
UNIQUE(nome)
-- 1 = heroi / 2 = vilao / 3 = antiheroi
);

CREATE TABLE trabalho.Leitor (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nick varchar(50) NOT NULL,
nome varchar(50) NOT NULL,
UNIQUE(nick),
UNIQUE(nome)
);

CREATE TABLE trabalho.Super_Poder(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
descricao text,
UNIQUE(nome)
);

CREATE TABLE trabalho.Autor (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
descricao text,
UNIQUE(nome)
);

CREATE TABLE trabalho.Coletanea (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo varchar(50) NOT NULL,
qualidade int,
ano_lancamento int,
UNIQUE(titulo)
);

CREATE TABLE trabalho.Editora (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
UNIQUE(nome)
);

CREATE TABLE trabalho.Quadrinho (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(50) NOT NULL,
tipo int,
descricao text,
capa_dura bool,
nacionalidade text,
fk_Coletanea_id int,
UNIQUE(nome),
FOREIGN KEY (fk_Coletanea_id) REFERENCES Coletanea(id)
);

CREATE TABLE trabalho.Existe (
fk_Personagem_id int,
fk_Filme_id int,
FOREIGN KEY (fk_Personagem_id) REFERENCES Personagem(id),
FOREIGN KEY (fk_Filme_id) REFERENCES Filme(id)
);

CREATE TABLE trabalho.Participa (
fk_Personagem_id int,
fk_Quadrinho_id int,
FOREIGN KEY (fk_Personagem_id) REFERENCES Personagem(id),
FOREIGN KEY (fk_Quadrinho_id) REFERENCES Quadrinho(id)
);

CREATE TABLE trabalho.Possui (
fk_Personagem_id int,
fk_Super_Poder_id int,
FOREIGN KEY (fk_Personagem_id) REFERENCES Personagem(id),
FOREIGN KEY (fk_Super_Poder_id) REFERENCES Super_Poder(id)
);

CREATE TABLE trabalho.Prefere (
fk_Personagem_id int, 
fk_Leitor_id int,
FOREIGN KEY (fk_Personagem_id) REFERENCES Personagem(id),
FOREIGN KEY (fk_Leitor_id) REFERENCES Leitor(id)
);

CREATE TABLE trabalho.Escreve (
fk_Quadrinho_id int,
fk_Autor_id int,
FOREIGN KEY (fk_Quadrinho_id) REFERENCES Quadrinho(id),
FOREIGN KEY (fk_Autor_id) REFERENCES Autor(id)
);

CREATE TABLE trabalho.Edicao_Especial (
fk_Quadrinho_id int,
FOREIGN KEY (fk_Quadrinho_id) REFERENCES Quadrinho(id)
);

CREATE TABLE trabalho.Pertence (
fk_Quadrinho_id int,
fk_Editora_id int,
FOREIGN KEY (fk_Quadrinho_id) REFERENCES Quadrinho(id),
FOREIGN KEY (fk_Editora_id) REFERENCES Editora(id)
);

CREATE TABLE trabalho.Almanaque (
fk_Quadrinho_id int,
FOREIGN KEY (fk_Quadrinho_id) REFERENCES Quadrinho(id)
);
