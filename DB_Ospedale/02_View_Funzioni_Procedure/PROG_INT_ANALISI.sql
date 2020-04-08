CREATE OR REPLACE PROCEDURE PROG_INT_ANALISI (cf_med CHAR, id_ric NUMBER, data_prev DATE, tipo VARCHAR, durata_prev NUMBER, num_sala NUMBER)
IS
   CLORO_ANALISI           NUMBER;
   GLUCOSIO_ANALISI        NUMBER;
   POTASSIO_ANALISI        NUMBER;
   SODIO_ANALISI           NUMBER;
   ID                      CHAR(10);
   CF_PAZ2		   CHAR(16);
BEGIN
   SELECT CLORO, GLUCOSIO, POTASSIO, SODIO INTO CLORO_ANALISI, GLUCOSIO_ANALISI, POTASSIO_ANALISI, SODIO_ANALISI
   FROM(SELECT CODICE_CC, CLORO, GLUCOSIO, POTASSIO, SODIO
            FROM ANALISI
            WHERE CODICE_CC = ( SELECT CODICE_CC
                                                    FROM CARTELLA_CLINICA
                                                    WHERE ID_RICOVERO = id_ric)
           ORDER BY DATA_ORA_PRELIEVO)
   WHERE ROWNUM=1;
   IF CLORO_ANALISI < 40 AND GLUCOSIO_ANALISI < 40 AND POTASSIO_ANALISI < 40 AND SODIO_ANALISI < 40 THEN
		   SELECT CF_PAZ INTO CF_PAZ2 FROM RICOVERO
		   WHERE RICOVERO.ID_RICOVERO = id_ric;
		   PROGRAMMAZIONE_INTERVENTO(cf_med, CF_PAZ2, num_sala, tipo, durata_prev, data_prev);
   END IF;
   
EXCEPTION
   WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('Non ci sono esami effettuati.');
END;
/