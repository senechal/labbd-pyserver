-- Atualiza a variável derivada qtdartigosapresentadosed
/
DROP TRIGGER update_qtdartapred; --funcionando
CREATE OR REPLACE TRIGGER update_qtdartapred
AFTER INSERT OR DELETE ON artigo
FOR EACH ROW
BEGIN
  IF inserting THEN
    UPDATE edicao SET qtdartigosapresentadosed = (qtdartigosapresentadosed + 1) WHERE :NEW.codev = edicao.codev AND :NEW.numed = edicao.numed;
  ELSIF deleting THEN
    UPDATE edicao SET qtdartigosapresentadosed = (qtdartigosapresentadosed - 1) WHERE :OLD.codev = edicao.codev AND :OLD.numed = edicao.numed;
  END IF;
END;
/
/
-- Atualiza a variável derivada totalartigosapresentadosev
/
DROP TRIGGER update_totartaprev; --funcionando
CREATE OR REPLACE TRIGGER update_totartaprev
AFTER INSERT OR DELETE OR UPDATE OF qtdartigosapresentadosed ON edicao
FOR EACH ROW
BEGIN
  IF inserting THEN
    UPDATE evento SET totalartigosapresentadosev = (totalartigosapresentadosev + :NEW.qtdartigosapresentadosed) WHERE :NEW.codev = evento.codev;
  ELSIF deleting THEN
    UPDATE evento SET totalartigosapresentadosev = (totalartigosapresentadosev - :OLD.qtdartigosapresentadosed) WHERE :OLD.codev = evento.codev;
  ELSE
    UPDATE evento SET totalartigosapresentadosev = (totalartigosapresentadosev - :OLD.qtdartigosapresentadosed + :NEW.qtdartigosapresentadosed) WHERE :NEW.codev = evento.codev;
  END IF;
END;
/
DROP TRIGGER update_saldopat_despesa; --funcionando
CREATE OR REPLACE TRIGGER update_saldopat_despesa
AFTER INSERT OR DELETE OR UPDATE OF  valorDesp ON despesa
FOR EACH ROW
BEGIN
  IF inserting THEN
    UPDATE patrocinio SET saldoPat = (saldoPat - :NEW.valorDesp) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd; -- cnpjPat, codEvPat, numEdPat
  ELSIF deleting THEN
    UPDATE patrocinio SET saldoPat = (saldoPat + :OLD.valorDesp) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd;
  ELSE
    UPDATE patrocinio SET saldoPat = (saldoPat + :OLD.valorDesp - :NEW.valorDesp) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd;
  END IF;
END;
/
DROP TRIGGER update_saldopat_auxilio;
CREATE OR REPLACE TRIGGER update_saldopat_auxilio --funcionado
AFTER INSERT OR DELETE OR UPDATE OF valorAux ON auxilio
FOR EACH ROW
BEGIN
  IF inserting THEN
    UPDATE patrocinio SET saldoPat = (saldoPat - :NEW.valorAux) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd; -- cnpjPat, codEvPat, numEdPat
  ELSIF deleting THEN
    UPDATE patrocinio SET saldoPat = (saldoPat + :OLD.valorAux) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd;
  ELSE
    UPDATE patrocinio SET saldoPat = (saldoPat + :OLD.valorAux - :NEW.valorAux) WHERE :NEW.cnpjPat = patrocinio.cnpjPat AND :NEW.codEvPat = patrocinio.codEv AND :NEW.numEdPat = patrocinio.numEd;
  END IF;
END;
/
DROP TRIGGER update_saldoFinanceiroEd; --funcionado
CREATE OR REPLACE TRIGGER update_saldoFinanceiroEd
AFTER INSERT OR DELETE OR UPDATE OF saldoPat ON patrocinio
FOR EACH ROW
BEGIN
  IF inserting THEN
    UPDATE edicao SET saldoFinanceiroEd = (saldoFinanceiroEd + :NEW.saldoPat) WHERE  :NEW.codEv = edicao.codEv AND :NEW.numEd = edicao.numEd; 
  ELSIF deleting THEN
    UPDATE edicao SET saldoFinanceiroEd = (saldoFinanceiroEd - :NEW.saldoPat) WHERE :NEW.codEv = edicao.codEv AND :NEW.numEd = edicao.numEd; 
  ELSE
    UPDATE edicao SET saldoFinanceiroEd = (saldoFinanceiroEd - :OLD.saldoPat + :NEW.saldoPat) WHERE :NEW.codEv = edicao.codEv AND :NEW.numEd = edicao.numEd; 
  END IF;
END;



-- CREATE OR REPLACE PACKAGE patrocinio_pkg AS
--   TYPE patrocinioArray IS TABLE OF ROWID INDEX BY binary_integer; 
--   novasTuplas patrocinioArray;
--   vazio patrocinioArray;
-- END;
-- /
-- -- cabeçalho do gatilho composto
-- CREATE OR REPLACE TRIGGER patrocinio_saldoPat
--   FOR INSERT OR UPDATE OF valorPat
--   ON patrocinio
--   COMPOUND TRIGGER

--   -- declaração das variáveis
--   v_patrocinio patrocinio%ROWTYPE;
--   v_valorpat patrocinio.valorPat%TYPE;

--   -- antes de um insert/update vamos resetar o array novasTuplas
--   BEFORE STATEMENT IS
--     BEGIN
--       patrocinio_pkg.novasTuplas := patrocinio_pkg.vazio; 
--   END BEFORE STATEMENT;
  
--   -- vamos capturar o rowid da tupla e salvar no array novasTuplas
--   -- percebam que nesse trecho estamos passando o new para o pacote
--   -- para que depois seja utilizado o pacote e não o new do trigger
--   AFTER EACH ROW IS
--     BEGIN
--       patrocinio_pkg.novasTuplas( patrocinio_pkg.novasTuplas.COUNT+1 ) := :new.ROWID;
--   END AFTER EACH ROW;

--   -- esse gatilho processa as novas tuplas
--   -- nós simplesmente varremos o array novasTuplas 
--   -- e processamos cada linha adicionado/alterada
--   -- o grande truque para evitar o problema de tabela mutante é passar a utilizar o pacote e não o new da trigger
--   AFTER STATEMENT IS
--     BEGIN
--       FOR i IN 1 .. patrocinio_pkg.novasTuplas.COUNT LOOP
        
--         -- busca a tupla da tabela patrocinio com o rowid salvo no array novasTuplas
--         SELECT * INTO v_patrocinio FROM patrocinio WHERE ROWID = patrocinio_pkg.novasTuplas(i);
--         -- busca o saldo do patrocinio
--         SELECT valorPat INTO v_valorpat FROM patrocinio WHERE cnpjPat = v_patrocinio.cnpjPat AND codEv = v_patrocinio.codEv AND numEd = v_patrocinio.numEd;

--       IF inserting THEN
--             UPDATE patrocinio SET saldoPat = v_patrocinio.valorPat WHERE cnpjPat = v_patrocinio.cnpjPat AND codEv = v_patrocinio.codEv AND numEd = v_patrocinio.numEd;
--        ELSIF updating THEN
--            UPDATE patrocinio SET saldoPat = saldoPat + v_patrocinio.valorPat - v_valorpat WHERE cnpjPat = v_patrocinio.cnpjPat AND codEv = v_patrocinio.codEv AND numEd = v_patrocinio.numEd;
--         END IF;
--       END LOOP;
--   END AFTER STATEMENT;
  
-- END patrocinio_saldoPat;


