CREATE OR REPLACE FUNCTION NUM_INT_EFF_PAZ(CF_PAZX CHAR) RETURN NUMBER
IS
	num     NUMBER(2,0):=0;
	ecc_1   EXCEPTION;
BEGIN
	SELECT COUNT(ID_INTERVENTO) INTO num
	FROM INTERVENTO
	WHERE CF_PAZ=CF_PAZX AND (DATA_EFFETTIVA IS NOT NULL);
	IF num = 0 THEN
	        RAISE ecc_1;
	END IF;
	RETURN num;
EXCEPTION
	WHEN ecc_1 THEN
	        DBMS_OUTPUT.PUT_LINE('Non ci sono interventi');
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR(-20088,'Dati non trovati');
END;
/
--Numero di interventi effettuati sul paziente CF_PAZX