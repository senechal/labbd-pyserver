CREATE or REPLACE PACKAGE RELATORIOS IS

  FUNCTION inscritos
      (v_evento IN evento.codEv%TYPE, v_edicao IN edicao.numEd%TYPE )
      RETURN LONG;
  
  PROCEDURE apresentacoes
      (v_evento IN NUMBER, v_edicao IN NUMBER, relatorio OUT LONG);
END RELATORIOS;
/
CREATE or REPLACE PACKAGE BODY RELATORIOS IS

 FUNCTION inscritos
      (v_evento IN evento.codEv%TYPE, v_edicao IN edicao.numEd%TYPE )
      RETURN LONG
      IS
      -- EXCEÇÔES
      NOEVENT EXCEPTION;
      NOEDITION EXCEPTION;
      
      CURSOR c_apresentadores (a_codev evento.codev%TYPE, a_numed edicao.numed%TYPE) IS
        SELECT pe.idPe,pe.nomePe 
        FROM pessoa pe, inscrito insc
        WHERE pe.idPe = insc.idpart  AND insc.codev = a_codev AND insc.numEd = a_numed AND insc.tipoapresentador = 1;
      CURSOR c_artigos(a_idApr artigo.idapr%TYPE) IS
        SELECT idart, tituloart
        FROM artigo 
        WHERE idapr = a_idapr;
      CURSOR c_auxilio(a_idApr artigo.idapr%TYPE) IS
        SELECT  tipoaux, SUM(valoraux) valor
        FROM auxilio
        WHERE idapr = a_idapr
        GROUP BY tipoaux;
      v_apresentadores c_apresentadores%ROWTYPE;
      v_artigos c_artigos%ROWTYPE;
      v_auxilio c_auxilio%ROWTYPE;
      v_saida LONG;
      vg_nomeev evento.nomeev%TYPE;
      vg_numed edicao.numed%TYPE;
      BEGIN
          BEGIN
              SELECT nomeev INTO vg_nomeev FROM evento WHERE codEv = v_evento;
          EXCEPTION
                WHEN NO_DATA_FOUND THEN RAISE NOEVENT;
          END;
        --Entrando com a edição, casa não existir, avisar que essa edição nao existe para o evento
          BEGIN
              SELECT numed INTO vg_numed FROM edicao WHERE numed = v_edicao;
          EXCEPTION
              WHEN NO_DATA_FOUND THEN RAISE NOEDITION;
          END;
          v_saida := '{"evento":"'||vg_nomeev||'", "edicao":"'||v_edicao||'", "relatorio":[';
          OPEN c_apresentadores(v_evento,v_edicao);
          FETCH c_apresentadores INTO v_apresentadores;
           v_saida := v_saida ||'{ "apresentador": "'|| v_apresentadores.nomePe ||'", "artigos":[';
            OPEN c_artigos(v_apresentadores.idPe);  
                  FETCH c_artigos INTO v_artigos;
                  v_saida := v_saida || '{"titulo":"'|| v_artigos.tituloart ||'"}';
                  LOOP
                      FETCH c_artigos INTO v_artigos;
                         EXIT WHEN c_artigos%NOTFOUND;
                        IF c_artigos%FOUND THEN
                          v_saida := v_saida || ', ';
                        END IF;
                        v_saida := v_saida || '{"titulo":"'|| v_artigos.tituloart ||'"}';
                  END LOOP;
              CLOSE c_artigos;
              v_saida := v_saida || '], "auxilios":[';
              OPEN c_auxilio(v_apresentadores.idPe);  
                  FETCH c_auxilio INTO v_auxilio;
                  v_saida := v_saida || '{"Tipo":"'|| v_auxilio.tipoaux ||'", "Valor":"'|| v_auxilio.valor ||'"}';
                  LOOP
                      FETCH c_auxilio INTO v_auxilio;
                         EXIT WHEN c_auxilio%NOTFOUND;
                        IF c_auxilio%FOUND THEN
                          v_saida := v_saida || ', ';
                        END IF;
                        v_saida := v_saida || '{"Tipo":"'|| v_auxilio.tipoaux ||'", "Valor":"'|| v_auxilio.valor ||'"}';
                  END LOOP;
              CLOSE c_auxilio;
               v_saida := v_saida || ']}';
          LOOP
           FETCH c_apresentadores INTO v_apresentadores;
          EXIT WHEN c_apresentadores%NOTFOUND;
              IF c_apresentadores%FOUND THEN
                          v_saida := v_saida || ', ';
                        END IF;
              v_saida := v_saida ||'{ "apresentador": "'|| v_apresentadores.nomePe ||'", "artigos":[';
              -- Abrindo o cursor que busca as informações do artigo, e o nome do apresentador
              -- Para cada artigo imprimimos o titulo, os autores, o apresentador e o horario de inicio
              OPEN c_artigos(v_apresentadores.idPe);  
                  FETCH c_artigos INTO v_artigos;
                  v_saida := v_saida || '{"titulo":"'|| v_artigos.tituloart ||'"}';
                  LOOP
                      FETCH c_artigos INTO v_artigos;
                         EXIT WHEN c_artigos%NOTFOUND;
                        IF c_artigos%FOUND THEN
                          v_saida := v_saida || ', ';
                        END IF;
                        v_saida := v_saida || '{"titulo":"'|| v_artigos.tituloart ||'"}';
                  END LOOP;
              CLOSE c_artigos;
              v_saida := v_saida || '], "auxilios":[';
              OPEN c_auxilio(v_apresentadores.idPe);  
                  FETCH c_auxilio INTO v_auxilio;
                  v_saida := v_saida || '{"Tipo":"'|| v_auxilio.tipoaux ||'", "Valor":"'|| v_auxilio.valor ||'"}';
                  LOOP
                      FETCH c_auxilio INTO v_auxilio;
                         EXIT WHEN c_auxilio%NOTFOUND;
                        IF c_auxilio%FOUND THEN
                          v_saida := v_saida || ', ';
                        END IF;
                        v_saida := v_saida || '{"Tipo":"'|| v_auxilio.tipoaux ||'", "Valor":"'|| v_auxilio.valor ||'"}';
                  END LOOP;
              CLOSE c_auxilio;
               v_saida := v_saida || ']}';
          END LOOP;
          CLOSE c_apresentadores;
        v_saida:= v_saida || ']}';
        RETURN v_saida; 
      END inscritos;

PROCEDURE apresentacoes
 (v_evento IN NUMBER, v_edicao IN NUMBER, relatorio OUT LONG)
IS 
 
 -- EXCEÇÔES
    NOEVENT EXCEPTION;
    NOEDITION EXCEPTION;
    
    --FIM EXCEÇÔES
    --VARIAVEIS GLOBAIS
    vg_nomeev evento.nomeev%TYPE;
    vg_numed edicao.numed%TYPE;
    --FIM VARIAVEIS GLOBAIS
    --CURSOR
    CURSOR c_datas (a_codev evento.codev%TYPE, a_numed edicao.numed%TYPE) IS
        SELECT codev,numed, dataapresart
        FROM artigo 
        WHERE numed = a_numed AND codev = a_codev
        GROUP BY codev, numed, dataapresart;
    CURSOR c_artigo (a_codev evento.codev%TYPE, a_numed edicao.numed%TYPE, a_data artigo.dataapresart%TYPE) IS
        SELECT art.idart id, tituloart, horaapresart , nomepe ,COUNT(es.idaut) autores
        FROM artigo art, pessoa pes , escreve es
        WHERE pes.idpe = art.idapr and art.codev  = a_codev and art.numed = a_numed and art.dataapresart = a_data
        AND art.idart = es.idart
        GROUP BY art.idart,tituloart, horaapresart , nomepe;    
    --FIM CURSOR
    --VARIAVEIS CURSOR
    v_datas c_datas%ROWTYPE;
    v_artigo c_artigo%ROWTYPE;
    --FIM VARIAVEIS CURSOS
    v_saida LONG;
BEGIN 
    BEGIN
      SELECT nomeev INTO vg_nomeev FROM evento WHERE codEv = v_evento;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RAISE NOEVENT;
    END;
    --Entrando com a edição, casa não existir, avisar que essa edição nao existe para o evento
    BEGIN
        SELECT numed INTO vg_numed FROM edicao WHERE numed = v_edicao;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RAISE NOEDITION;
    END;
    v_saida := '{"evento":"'||vg_nomeev||'", "edicao":"'||v_edicao||'", "relatorio":[';
    OPEN c_datas(v_evento,vg_numed);
    FETCH c_datas INTO v_datas;
        v_saida := v_saida ||'{ "data": "'|| TO_CHAR(v_datas.dataapresart, 'dd/mm/YY') ||'", "apresentacoes":[';
        -- Abrindo o cursor que busca as informações do artigo, e o nome do apresentador
        -- Para cada artigo imprimimos o titulo, os autores, o apresentador e o horario de inicio
        OPEN c_artigo(v_evento,vg_numed,v_datas.dataapresart);  
            FETCH c_artigo INTO v_artigo;
            v_saida := v_saida || '{"titulo":"'|| v_artigo.tituloart ||'","nro_autores":"'|| v_artigo.autores ||'","autores":' || autores(v_artigo.id) || ',"apresentador":"'|| v_artigo.nomepe ||'","inicio":"'||TO_CHAR(v_artigo.horaapresart, 'HH:mi')||'"}';
            LOOP
                FETCH c_artigo INTO v_artigo;
                   EXIT WHEN c_artigo%NOTFOUND;
                  IF c_artigo%FOUND THEN
                    v_saida := v_saida || ', ';
                  END IF;
                  v_saida := v_saida || '{"titulo":"'|| v_artigo.tituloart ||'","nro_autores":"'|| v_artigo.autores ||'","autores":' || autores(v_artigo.id) || ',"apresentador":"'|| v_artigo.nomepe ||'","inicio":"'||TO_CHAR(v_artigo.horaapresart, 'HH:mi')||'"}';
              
            END LOOP;
        CLOSE c_artigo;
        v_saida := v_saida || ']}';
    LOOP
    FETCH c_datas INTO v_datas;
    EXIT WHEN c_datas%NOTFOUND;
        IF c_datas%FOUND THEN
                    v_saida := v_saida || ', ';
                  END IF;
        v_saida := v_saida ||'{ "data": "'|| TO_CHAR(v_datas.dataapresart, 'dd/mm/YY') ||'", "apresentacoes":[';
        -- Abrindo o cursor que busca as informações do artigo, e o nome do apresentador
        -- Para cada artigo imprimimos o titulo, os autores, o apresentador e o horario de inicio
        OPEN c_artigo(v_evento,vg_numed,v_datas.dataapresart);  
            FETCH c_artigo INTO v_artigo;
            v_saida := v_saida || '{"titulo":"'|| v_artigo.tituloart ||'","nro_autores":"'|| v_artigo.autores ||'","autores":' || autores(v_artigo.id) || ',"apresentador":"'|| v_artigo.nomepe ||'","inicio":"'||TO_CHAR(v_artigo.horaapresart, 'HH:mi')||'"}';
            LOOP
                FETCH c_artigo INTO v_artigo;
                   EXIT WHEN c_artigo%NOTFOUND;
                  IF c_artigo%FOUND THEN
                    v_saida := v_saida || ', ';
                  END IF;
                  v_saida := v_saida || '{"titulo":"'|| v_artigo.tituloart ||'","nro_autores":"'|| v_artigo.autores ||'","autores":' || autores(v_artigo.id) || ',"apresentador":"'|| v_artigo.nomepe ||'","inicio":"'||TO_CHAR(v_artigo.horaapresart, 'HH:mi')||'"}';
              
            END LOOP;
        CLOSE c_artigo;
        v_saida := v_saida || ']}';
    END LOOP;
    CLOSE c_datas;
        v_saida:= v_saida || ']}';
    relatorio := v_saida;
EXCEPTION
   WHEN NOEVENT THEN 
        relatorio := 'Evento não encontrado.';
    WHEN NOEDITION THEN 
        relatorio := 'Edição não existe para o evento ' || v_evento || '.';    
END  apresentacoes;
END;