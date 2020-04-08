CREATE OR REPLACE TRIGGER durata_int_paz_75
BEFORE
	INSERT ON INTERVENTO
	FOR EACH ROW
DECLARE
	datex		DATE;
	ecc1		EXCEPTION;
BEGIN
	SELECT DATA_DI_NASCITA INTO datex
	FROM PERSONA
	WHERE :NEW.CF_PAZ=CF;
	IF :NEW.DURATA_PREVISTA > 3 AND ((TO_NUMBER(TO_CHAR(SYSDATE,'yyyy')) - TO_NUMBER(TO_CHAR(datex,'yyyy')))) > 75 THEN
		RAISE ecc1;
	END IF;
EXCEPTION
	WHEN ecc1 THEN
		RAISE_APPLICATION_ERROR(-20092,'L''età del paziente è superiore a 75 anni. L''intervento non può durare più di 3 ore.');
END;
--La durata degli interventi per i pazienti di età superiore a 75 anni non può essere superiore a tre ore.
/
