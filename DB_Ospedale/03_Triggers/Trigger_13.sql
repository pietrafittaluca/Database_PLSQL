CREATE OR REPLACE TRIGGER no_assiste_int
BEFORE
	INSERT ON ASSISTE
	FOR EACH ROW
DECLARE
	num		NUMBER(2,0):=0;
	ecc1		EXCEPTION;
BEGIN
	SELECT COUNT(CF_INF) INTO num
	FROM INFERMIERE
	WHERE :NEW.CF_INF=CF_INF;
	IF num > 0 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		RAISE_APPLICATION_ERROR(-20094,'Si sta tentando di far assistere un medico ad un intervento');
END;
--Un medico non può assistere un intervento
/
