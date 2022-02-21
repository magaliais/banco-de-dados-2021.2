-- 0 = quadrinho normal / 1 = edicao especial / 2 = almanaque
CREATE TRIGGER quadrinhos_insert 
AFTER INSERT ON trabalho.quadrinhos FOR EACH ROW
BEGIN
    IF (NEW.tipo = 1) 
    THEN
        insert into trabalho.edicoes_especiais (fk_quadrinho_id) values (NEW.id);
    ELSEIF (new.tipo = 2) 
    THEN
        insert into trabalho.almanaques (fk_quadrinho_id) values (NEW.id);
    END IF;
END;

CREATE TRIGGER quadrinhos_update
AFTER UPDATE ON trabalho.quadrinhos FOR EACH ROW
BEGIN
    IF (OLD.tipo = 1 AND NEW.tipo = 2) 
    THEN
        delete from trabalho.edicoes_especiais where fk_quadrinho_id = OLD.id; 
        insert into trabalho.almanaques (fk_quadrinho_id) values (NEW.id);
    ELSEIF (OLD.tipo = 2 AND NEW.tipo = 1) 
    THEN
        delete from trabalho.almanaques where fk_quadrinho_id = OLD.id;
        insert into trabalho.edicoes_especiais (fk_quadrinho_id) values (NEW.id);
    ELSEIF(NEW.tipo = 0)
    THEN
        delete from trabalho.almanaques where fk_quadrinho_id = OLD.id;
        delete from trabalho.edicoes_especiais where fk_quadrinho_id = OLD.id; 
    END IF;
END;

CREATE TRIGGER quadrinhos_delete 
BEFORE DELETE ON trabalho.quadrinhos FOR EACH ROW
BEGIN
    IF (OLD.tipo = 1) 
    THEN
        delete from trabalho.edicoes_especiais where fk_quadrinho_id = OLD.id;
    ELSEIF (OLD.tipo = 2) 
    THEN
        delete from trabalho.almanaques where fk_quadrinho_id = OLD.id;
    END IF;
END;