CREATE OR REPLACE TRIGGER no_eff_fisioterapista
BEFORE
	INSERT ON EFFETTUA
	FOR EACH ROW
DECLARE
	num		NUMBER:=0;
	ecc1		EXCEPTION;
BEGIN
	SELECT COUNT(CF_MED) INTO num
	FROM MEDICO
	WHERE :NEW.CF_MED=CF_MED;
	IF num = 1 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		DBMS_OUTPUT.PUT_LINE('Il medico che si sta inserendo è un fisioterapista.');
END;
--Il fisioterapista non può effettuare interventi.
/
