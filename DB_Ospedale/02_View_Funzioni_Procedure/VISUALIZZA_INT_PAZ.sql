CREATE OR REPLACE PROCEDURE VISUALIZZA_INT_PAZ(cf_pazx CHAR)
AS
	C1		SYS_REFCURSOR;
BEGIN
	OPEN C1 FOR
	SELECT *
	FROM INTERVENTO
	WHERE CF_PAZ=cf_pazx;
	DBMS_SQL.RETURN_RESULT(C1);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Questo paziente non ha interventi.');
END;
/
--Il paziente visualizza tutti i propri interventi
/
