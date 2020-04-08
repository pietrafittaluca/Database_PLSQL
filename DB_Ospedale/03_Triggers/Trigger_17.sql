CREATE OR REPLACE TRIGGER no_int_fisioterapista
BEFORE
	INSERT ON ASSISTE
	FOR EACH ROW
DECLARE
	num		NUMBER:=0;
	ecc1		EXCEPTION;
BEGIN
	SELECT COUNT(CF_FISIO) INTO num
	FROM FISIOTERAPISTA
	WHERE :NEW.CF_INF=CF_FISIO;
	IF num = 1 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		DBMS_OUTPUT.PUT_LINE('L''infermiere che si sta inserendo è un fisioterapista.');
END;
--Il fisioterapista non può assistere interventi.
/
