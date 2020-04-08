CREATE OR REPLACE PROCEDURE VIS_ESAMI_PAZ(cf_pazx CHAR)
AS
	C1		SYS_REFCURSOR;
BEGIN
	OPEN C1 FOR
	SELECT E.CODICE_CC,E.DATA_ORA,E.TIPO_ESAME,E.ESITO
	FROM ESAMI E JOIN CARTELLA_CLINICA CC ON E.CODICE_CC=CC.CODICE_CC JOIN RICOVERO R ON R.ID_RICOVERO=CC.ID_RICOVERO
	WHERE R.CF_PAZ=cf_pazx;
	DBMS_SQL.RETURN_RESULT(C1);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Dati non presenti');
END;
--Visualizzare gli esami di un paziente.
/
