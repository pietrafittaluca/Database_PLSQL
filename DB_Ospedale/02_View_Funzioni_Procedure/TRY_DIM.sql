CREATE OR REPLACE PROCEDURE TRY_DIM (id_ric NUMBER, cod_dia NUMBER, mod_dim NUMBER)
   IS
   CLORO_ANALISI           NUMBER;
   GLUCOSIO_ANALISI        NUMBER;
   POTASSIO_ANALISI        NUMBER;
   SODIO_ANALISI           NUMBER;
   ID                      NUMBER;
   num                     NUMBER:=0;
   ecc1                    EXCEPTION;
BEGIN
   SELECT CLORO, GLUCOSIO, POTASSIO, SODIO INTO CLORO_ANALISI, GLUCOSIO_ANALISI, POTASSIO_ANALISI, SODIO_ANALISI
   FROM(SELECT CODICE_CC, CLORO, GLUCOSIO, POTASSIO, SODIO
            FROM ANALISI
            WHERE CODICE_CC = ( SELECT CODICE_CC
                                                    FROM CARTELLA_CLINICA
                                                    WHERE ID_RICOVERO = id_ric)
           ORDER BY DATA_ORA_PRELIEVO)
   WHERE ROWNUM=1;
   IF CLORO_ANALISI > 60 AND GLUCOSIO_ANALISI > 60 AND POTASSIO_ANALISI > 60 AND SODIO_ANALISI > 60 THEN
	   SELECT seq_dimissione.NEXTVAL INTO ID FROM DUAL;
           INSERT INTO DIMISSIONE(ID_DIMISSIONE,DATA_ORA,CODICE_DIAGNOSI,MOD_DIMISSIONE,ID_RICOVERO)
                                   VALUES (ID, SYSDATE, cod_dia, mod_dim, id_ric);
   END IF;
   SELECT COUNT(ID_RICOVERO) INTO num
   FROM DIMISSIONE
   WHERE ID_RICOVERO=id_ric;
   IF num > 1 THEN
           RAISE ecc1;
   END IF;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('Non ci sono esami effettuati.');
   WHEN ecc1 THEN
           DBMS_OUTPUT.PUT_LINE('Un paziente non può avere due dimissioni dello stesso ricovero.');
END;
/
