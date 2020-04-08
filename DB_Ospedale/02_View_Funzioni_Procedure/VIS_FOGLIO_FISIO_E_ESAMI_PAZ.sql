CREATE OR REPLACE PROCEDURE VIS_FOGLIO_FISIO_E_ESAMI_PAZ(cf_pazx CHAR)
AS
	C1		SYS_REFCURSOR;
	C2		SYS_REFCURSOR;
BEGIN
	--Visualizzo l'ultimo Foglio Fisioterapia
	OPEN C1 FOR
	SELECT FF.CF_FISIOTERAPISTA,FF.CODICE_CC,FF.DEAMBULAZIONE,FF.ELETTR_MUSC,FF.RINF_MUSC
	FROM FOGLIO_FISIOTERAPIA FF JOIN CARTELLA_CLINICA CC ON FF.CODICE_CC=CC.CODICE_CC JOIN RICOVERO R ON CC.ID_RICOVERO=R.ID_RICOVERO
	WHERE R.CF_PAZ=cf_pazx AND FF.DATA_ORA = (SELECT MAX(FF2.DATA_ORA)
						FROM FOGLIO_FISIOTERAPIA FF2 JOIN CARTELLA_CLINICA CC2 ON FF2.CODICE_CC=CC2.CODICE_CC JOIN RICOVERO R2 ON CC2.ID_RICOVERO=R2.ID_RICOVERO
						WHERE R2.CF_PAZ=cf_pazx);
	DBMS_SQL.RETURN_RESULT(C1);
	--Visualizzo gli ultimi esami
	OPEN C2 FOR
	SELECT E.CODICE_CC,E.TIPO_ESAME,E.ESITO
	FROM RICOVERO R JOIN CARTELLA_CLINICA CC ON CC.ID_RICOVERO=R.ID_RICOVERO JOIN ESAMI E ON CC.CODICE_CC=E.CODICE_CC
	WHERE R.CF_PAZ=cf_pazx AND E.DATA_ORA = (SELECT MAX(E.DATA_ORA)
						FROM RICOVERO R2 JOIN CARTELLA_CLINICA CC2 ON R2.ID_RICOVERO=CC2.ID_RICOVERO JOIN ESAMI E2 ON E2.CODICE_CC=CC2.CODICE_CC
						WHERE R2.CF_PAZ=cf_pazx);
	DBMS_SQL.RETURN_RESULT(C2);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Dati non presenti');
END;
/
--Visualizzare l'ultimo Foglio Fisioterapia e gli ultimi Esami di un paziente.