CREATE OR REPLACE TRIGGER no_stesso_rep
BEFORE
	INSERT ON E_TENUTO
	FOR EACH ROW
DECLARE
	num		NUMBER(2,0):=0;
	cf_pazx		CHAR(16);
	ecc1		EXCEPTION;
BEGIN
	SELECT CF_PAZ INTO cf_pazx
	FROM E_TENUTO ET JOIN RICOVERO R ON ET.ID_RICOVERO=R.ID_RICOVERO
	WHERE :NEW.ID_RICOVERO=ET.ID_RICOVERO;
	SELECT COUNT(R.CF_PAZ) INTO num
	FROM E_TENUTO ET JOIN RICOVERO R ON ET.ID_RICOVERO=R.ID_RICOVERO
	WHERE :NEW.DATA_ORA=ET.DATA_ORA AND R.CF_PAZ=cf_pazx;
	IF num > 1 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		RAISE_APPLICATION_ERROR(-20093,'Il paziente non può stare contemporaneamente in due reparti');
END;
--Un paziente non può essere tenuto in due reparti contemporaneamente
/