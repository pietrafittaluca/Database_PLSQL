--Funzione che conta quanti interventi sono assegnati ad un medico in una certa data
CREATE OR REPLACE FUNCTION COUNT_INT
(CF_MED IN VARCHAR, DATE_INT DATE)
RETURN INTEGER
IS
COUNTER		INTEGER;
BEGIN
SELECT COUNT(*) INTO COUNTER FROM
	EFFETTUA E JOIN INTERVENTO I ON E.ID_INTERVENTO = I.ID_INTERVENTO
	WHERE E.CF_MED = CF_MED AND to_date(I.DATA_PREVISTA, 'dd-mm-yyyy') = to_date(DATE_INT, 'dd-mm-yyyy');
RETURN COUNTER;
END;
/
