CREATE VIEW trabalho.personagens_filmes as
select  p.nome as Personagem, group_concat(concat(f.titulo,' - ',f.ano_lancamento) order by f.ano_lancamento DESC separator ', ') as 'Filme - Ano de Lançamento'
from trabalho.filmes f join trabalho.existes e on f.id = e.fk_filme_id
join trabalho.personagens p on e.fk_personagem_id = p.id group by p.nome;

CREATE VIEW trabalho.personagens_super_poderes as 
select p.nome as 'Personagem', group_concat(s.nome order by s.nome ASC separator ', ') as 'Super-Poder(es)' from trabalho.personagens p join trabalho.possui po on p.id = po.fk_personagem_id 
join trabalho.super_poderes s on po.fk_super_poder_id = s.id group by p.nome order by p.nome ASC;

CREATE VIEW trabalho.quadrinhos_autores_editoras as
select q.nome as 'Titulo Quadrinho', group_concat(a.nome separator ', ') as 'Autor(es)', ed.nome as 'Editora' from trabalho.quadrinhos q join trabalho.escreve e on q.id = e.fk_quadrinho_id
join trabalho.autores a on e.fk_autor_id = a.id
join trabalho.pertence p on q.id = p.fk_quadrinho_id
join trabalho.editoras ed on p.fk_editora_id = ed.id
group by q.nome
order by q.nome ASC;