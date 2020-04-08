CREATE OR REPLACE TRIGGER no_int_infermiere
BEFORE
	INSERT ON EFFETTUA
	FOR EACH ROW
DECLARE
	num		NUMBER(2,0):=0;
	ecc1		EXCEPTION;
BEGIN
	SELECT COUNT(CF_INF) INTO num
	FROM INFERMIERE
	WHERE :NEW.CF_MED=CF_INF;
	IF num > 0 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		RAISE_APPLICATION_ERROR(-20095,'Si sta tentando di far effettuare un intervento ad un infermiere');
END;
/
