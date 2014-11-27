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


CREATE OR REPLACE PACKAGE pkg_patrocinio IS
   -- declarando um tipo (vPessoaPackage) igual ao da tabela Pessoa
   TYPE vPatrocinioPackage IS TABLE OF patrocinio%ROWTYPE INDEX BY BINARY_INTEGER;
   -- atribuindo uma variável do tipo criado acima
   vPatrocinio vPatrocinioPackage;
   vPatrocinioOLD vPatrocinioPackage;
 END pkg_patrocinio;
/ 
create or replace trigger T_INSERT_saldoPat_BEFORE
 before insert on patrocinio
 for each row
 DECLARE
 -- declara um índice para navegar pelos registros
 n BINARY_INTEGER;
 BEGIN
 
-- recupera o valor do último índice do package e soma 1
 -- se for null, retorna 0 (+1)
 n := NVL(pkg_patrocinio.vPatrocinio.LAST,0) + 1;
 
-- armazena os valores da pessoa na package
 pkg_patrocinio.vPatrocinio(n).cnpjpat := :NEW.cnpjpat;
 pkg_patrocinio.vPatrocinio(n).codEv := :NEW.codEv;
 pkg_patrocinio.vPatrocinio(n).numEd := :NEW.numEd;
 pkg_patrocinio.vPatrocinio(n).valorpat := :NEW.valorpat;
 pkg_patrocinio.vPatrocinio(n).saldopat := :NEW.saldopat;
 pkg_patrocinio.vPatrocinio(n).datapat := :NEW.datapat;
 
END T_INSERT_saldoPat_BEFORE;
/
CREATE OR REPLACE TRIGGER T_INSERT_saldoPat_AFTER AFTER INSERT ON patrocinio
 
DECLARE
   -- cria o tipo para variável que armazena o conteúdo do package
   TYPE tbPatrocinioPackage IS TABLE OF patrocinio%ROWTYPE INDEX BY BINARY_INTEGER;
   tbPatrocinio   tbPatrocinioPackage;
   x           BINARY_INTEGER; --indice
 
 BEGIN
   -- atribui ao índice o primeiro valor do package
   x := pkg_patrocinio.vPatrocinio.FIRST;
   -- limpa a var criada
   tbPatrocinio.DELETE;
 
   -- adiciona todos os registros do package na variável criada
   WHILE x IS NOT NULL LOOP
     tbPatrocinio(x).cnpjpat := pkg_patrocinio.vPatrocinio(x).cnpjpat;
     tbPatrocinio(x).codEv := pkg_patrocinio.vPatrocinio(x).codEv;
     tbPatrocinio(x).numEd := pkg_patrocinio.vPatrocinio(x).numEd;
     tbPatrocinio(x).valorpat := pkg_patrocinio.vPatrocinio(x).valorpat;
     tbPatrocinio(x).saldopat := pkg_patrocinio.vPatrocinio(x).saldopat;
     tbPatrocinio(x).datapat := pkg_patrocinio.vPatrocinio(x).datapat;
     x := pkg_patrocinio.vPatrocinio.NEXT(x); -- incrementa o valor do índice
   END LOOP;
 
   pkg_patrocinio.vPatrocinio.DELETE; -- limpa o package
   x := tbPatrocinio.FIRST; -- atribui ao índice o primeiro valor
 
   -- loop para percorrer todos os registros do package
   WHILE x IS NOT NULL LOOP
     BEGIN
       UPDATE patrocinio p SET p.saldopat = tbPatrocinio(x).valorpat
       WHERE p.cnpjpat = tbPatrocinio(x).cnpjpat AND p.codEv = tbPatrocinio(x).codEv AND p.numEd = tbPatrocinio(x).numEd;
     EXCEPTION
       WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20002
                                ,'Não foi possível atualizar os dados na tabela Patrocinio. Trigger: T_GERA_ENDERECO_AFTER ' || SQLERRM);
     END;
     -- atualiza valor do indice para o proximo registro
     x := tbPatrocinio.NEXT(x);
   END LOOP;
 
 END T_INSERT_saldoPat_AFTER;
/
create or replace trigger T_UPDATE_saldoPat_BEFORE
 before update of valorpat on patrocinio
 for each row
 DECLARE
 -- declara um índice para navegar pelos registros
 n BINARY_INTEGER;
 m BINARY_INTEGER;
 BEGIN
 
-- recupera o valor do último índice do package e soma 1
 -- se for null, retorna 0 (+1)
 n := NVL(pkg_patrocinio.vPatrocinio.LAST,0) + 1;
 m := NVL(pkg_patrocinio.vPatrocinioOLD.LAST,0) + 1;
 
-- armazena os valores da pessoa na package
 pkg_patrocinio.vPatrocinio(n).cnpjpat := :NEW.cnpjpat;
 pkg_patrocinio.vPatrocinio(n).codEv := :NEW.codEv;
 pkg_patrocinio.vPatrocinio(n).numEd := :NEW.numEd;
 pkg_patrocinio.vPatrocinio(n).valorpat := :NEW.valorpat;
 pkg_patrocinio.vPatrocinio(n).saldopat := :NEW.saldopat;
 pkg_patrocinio.vPatrocinio(n).datapat := :NEW.datapat; 
 
 pkg_patrocinio.vPatrocinioOLD(n).cnpjpat := :OLD.cnpjpat;
 pkg_patrocinio.vPatrocinioOLD(n).codEv := :OLD.codEv;
 pkg_patrocinio.vPatrocinioOLD(n).numEd := :OLD.numEd;
 pkg_patrocinio.vPatrocinioOLD(n).valorpat := :OLD.valorpat;
 pkg_patrocinio.vPatrocinioOLD(n).saldopat := :OLD.saldopat;
 pkg_patrocinio.vPatrocinioOLD(n).datapat := :OLD.datapat;
 
END T_UPDATE_saldoPat_BEFORE;
/
CREATE OR REPLACE TRIGGER T_UPDATE_saldoPat_AFTER AFTER  update OF valorpat ON patrocinio
 
DECLARE
   -- cria o tipo para variável que armazena o conteúdo do package
   TYPE tbPatrocinioPackage IS TABLE OF patrocinio%ROWTYPE INDEX BY BINARY_INTEGER;
   tbPatrocinio   tbPatrocinioPackage;
   tbPatrocinioOLD tbPatrocinioPackage;
   x           BINARY_INTEGER; --indice
 
 BEGIN
   -- atribui ao índice o primeiro valor do package
   x := pkg_patrocinio.vPatrocinio.FIRST;
   -- limpa a var criada
   tbPatrocinio.DELETE;
   tbPatrocinioOLD.DELETE;
 
   -- adiciona todos os registros do package na variável criada
   WHILE x IS NOT NULL LOOP
     tbPatrocinio(x).cnpjpat := pkg_patrocinio.vPatrocinio(x).cnpjpat;
     tbPatrocinio(x).codEv := pkg_patrocinio.vPatrocinio(x).codEv;
     tbPatrocinio(x).numEd := pkg_patrocinio.vPatrocinio(x).numEd;
     tbPatrocinio(x).valorpat := pkg_patrocinio.vPatrocinio(x).valorpat;
     tbPatrocinio(x).saldopat := pkg_patrocinio.vPatrocinio(x).saldopat;
     tbPatrocinio(x).datapat := pkg_patrocinio.vPatrocinio(x).datapat;
     
     tbPatrocinioOLD(x).cnpjpat := pkg_patrocinio.vPatrocinioOLD(x).cnpjpat;
     tbPatrocinioOLD(x).codEv := pkg_patrocinio.vPatrocinioOLD(x).codEv;
     tbPatrocinioOLD(x).numEd := pkg_patrocinio.vPatrocinioOLD(x).numEd;
     tbPatrocinioOLD(x).valorpat := pkg_patrocinio.vPatrocinioOLD(x).valorpat;
     tbPatrocinioOLD(x).saldopat := pkg_patrocinio.vPatrocinioOLD(x).saldopat;
     tbPatrocinioOLD(x).datapat := pkg_patrocinio.vPatrocinioOLD(x).datapat;
     x := pkg_patrocinio.vPatrocinio.NEXT(x); -- incrementa o valor do índice
   END LOOP;
 
   pkg_patrocinio.vPatrocinio.DELETE; -- limpa o package
   pkg_patrocinio.vPatrocinioOLD.DELETE; -- limpa o package
   x := tbPatrocinio.FIRST; -- atribui ao índice o primeiro valor
 
   -- loop para percorrer todos os registros do package
   WHILE x IS NOT NULL LOOP
     BEGIN
       UPDATE patrocinio p SET p.saldopat = p.saldopat - tbPatrocinioOLD(x).valorpat + tbPatrocinio(x).valorpat
       WHERE p.cnpjpat = tbPatrocinio(x).cnpjpat AND p.codEv = tbPatrocinio(x).codEv AND p.numEd = tbPatrocinio(x).numEd;
     EXCEPTION
       WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20002
                                ,'Não foi possível atualizar os dados na tabela Patrocinio. Trigger: T_GERA_ENDERECO_AFTER ' || SQLERRM);
     END;
     -- atualiza valor do indice para o proximo registro
     x := tbPatrocinio.NEXT(x);
   END LOOP;
 
 END T_UPDATE_saldoPat_AFTER;
