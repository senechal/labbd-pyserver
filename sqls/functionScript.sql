CREATE or REPLACE FUNCTION autores
(v_idart IN NUMBER) 
RETURN VARCHAR2
IS 
 CURSOR c_autores (a_idart escreve.idart%TYPE) IS
        SELECT nomepe
        FROM escreve es, pessoa pes 
        WHERE es.idaut = pes.idpe and es.idart = a_idart;
  v_autores c_autores%ROWTYPE;
  s_autores VARCHAR2(255);
  v_aux VARCHAR2(255);
BEGIN 
s_autores := '[';
 OPEN c_autores(v_idart);
  FETCH c_autores INTO v_autores;
    s_autores := s_autores ||'"'|| v_autores.nomepe || '"';
              LOOP
                  FETCH c_autores INTO v_autores;
                  
                    EXIT WHEN c_autores%NOTFOUND;
                    IF c_autores%FOUND THEN
                      s_autores := s_autores || ', ';
                    END IF;
                    s_autores := s_autores ||'"'|| v_autores.nomepe || '"';
                    
                  
                   
              END LOOP;
s_autores := s_autores || ']';
 RETURN s_autores; 
END autores;