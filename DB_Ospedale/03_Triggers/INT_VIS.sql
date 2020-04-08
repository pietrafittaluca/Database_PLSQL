CREATE OR REPLACE TRIGGER INT_VIS
AFTER
	INSERT ON EFFETTUA
	FOR EACH ROW
DECLARE
	C		INTEGER;
	CF		MEDICO.CF_MED%TYPE;
	DATA_INT	DATE;	
BEGIN
	SELECT DATA_PREVISTA INTO DATA_INT FROM INTERVENTO
	WHERE ID_INTERVENTO = :NEW.ID_INTERVENTO;
	--Controllo se un medico ha delle visite programmate per il giorno dell intervento
	SELECT COUNT(*) INTO C FROM VISITA
	WHERE CF_MED = :NEW.CF_MED AND to_date(DATA_ORA_PREVISTA, 'dd-mm-yyyy') = to_date(DATA_INT, 'dd-mm-yyyy');
	DBMS_OUTPUT.PUT_LINE('IL MEDICO IN DATA ' || DATA_INT || ' HA '|| C || ' VISITE PROGRAMMATE');
	--Se ci sono visite prenotate per la data dell intervento, dato che gli interventi hanno la priorità,
	--tutte le visiste del medico programmate per quel giorno vengono riprogrammate per il giorno dopo
	IF(C != 0) THEN
	FOR V IN (SELECT * FROM VISITA
	WHERE CF_MED = :NEW.CF_MED AND to_date(DATA_ORA_PREVISTA, 'dd-mm-yyyy') = to_date(DATA_INT, 'dd-mm-yyyy'))
	LOOP
	UPDATE VISITA
	SET DATA_ORA_PREVISTA = DATA_ORA_PREVISTA + 1;
	END LOOP;
	END IF;
END;
/
