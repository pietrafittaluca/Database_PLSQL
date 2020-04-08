CREATE OR REPLACE TRIGGER dist_1_ora
BEFORE 
	INSERT ON INTERVENTO
	FOR EACH ROW
DECLARE
	num_1		NUMBER:= 0;
	ecc_1		EXCEPTION;
	ecc_2		EXCEPTION;
	ecc_3		EXCEPTION;
BEGIN
	IF TO_NUMBER(TO_CHAR(:NEW.DATA_PREVISTA,'HH24')) < 8 OR TO_NUMBER(TO_CHAR(:NEW.DATA_EFFETTIVA,'HH24')) < 8 OR TO_NUMBER(TO_CHAR(:NEW.DATA_PREVISTA,'HH24')) > 20 OR TO_NUMBER(TO_CHAR(:NEW.DATA_EFFETTIVA,'HH24')) > 20 THEN
		RAISE ecc_1;
	ELSIF (:NEW.DURATA_PREVISTA > 6 AND :NEW.NUM_SALA_OPERA <> 14) THEN
		RAISE ecc_2;
	END IF;
	SELECT COUNT(ID_INTERVENTO) INTO num_1
	FROM	(SELECT *
		 FROM INTERVENTO
		 WHERE TO_CHAR(:NEW.DATA_EFFETTIVA,'DD/MM/YYYY')=TO_CHAR(DATA_EFFETTIVA,'DD/MM/YYYY') AND :NEW.NUM_SALA_OPERA=NUM_SALA_OPERA)
	WHERE TO_NUMBER(TO_CHAR(:NEW.DATA_EFFETTIVA,'HH24')) > (TO_NUMBER(TO_CHAR(DATA_EFFETTIVA,'HH24')) + DURATA_EFFETTIVA);
	IF num_1 > 0 THEN
		RAISE ecc_3;
	END IF;
EXCEPTION
	WHEN ecc_1 THEN
		RAISE_APPLICATION_ERROR(-20091,'Inserito orario sbagliato');
	WHEN ecc_2 THEN
		RAISE_APPLICATION_ERROR(-20092,'Nella sala operatoria numero 14 si possono effettuare solo interventi di durata > 6');
	WHEN ecc_3 THEN
		RAISE_APPLICATION_ERROR(-20093,'L''intervento da inserire si accavalla con un altro intervento');
END;
--Gli interventi in ogni sala operatoria possono essere effettuati dalle 8 alle 20.
--Non si possono accavallare più interventi e solo nelle sala 14 si fanno interventi superiori alle 6 ore [LUCA]
/