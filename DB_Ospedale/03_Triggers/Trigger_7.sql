CREATE OR REPLACE TRIGGER MAXSALAOP
BEFORE 
		INSERT ON INTERVENTO
		FOR EACH ROW
DECLARE
		TOO_OP EXCEPTION;
		COUNT_OP NUMBER;
BEGIN
		SELECT COUNT(*) INTO COUNT_OP
		FROM INTERVENTO I
		WHERE :NEW.DATA_PREVISTA = TRUNC(I.DATA_PREVISTA) AND :NEW.NUM_SALA_OPERA = I.NUM_SALA_OPERA;
		IF COUNT_OP > 3 THEN
			RAISE TOO_OP;
		END IF;
EXCEPTION
		WHEN TOO_OP THEN
			RAISE_APPLICATION_ERROR(-20071,'CI SONO GIA PIU DI 3 INTERVENTI IN QUESTA SALA OPERATORIA PER QUESTO GIORNO');
END;
/