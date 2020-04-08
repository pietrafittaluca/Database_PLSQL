CREATE OR REPLACE TRIGGER TR_DIETA
BEFORE
        INSERT ON DIETA
        FOR EACH ROW
DECLARE
        DIM DIMISSIONE.ID_DIMISSIONE%TYPE;
        C NUMBER;
        EX1 EXCEPTION;
        EX2 EXCEPTION;
BEGIN
        SELECT ID_DIMISSIONE INTO DIM
        FROM DIMISSIONE
        WHERE ID_RICOVERO = :NEW.ID_RICOVERO;
        IF(DIM IS NOT NULL) THEN
            RAISE EX1;
        END IF;
        SELECT COUNT(*) INTO C
        FROM DIETA D
        WHERE D.ID_RICOVERO = :NEW.ID_RICOVERO;
        IF(C <> 0) THEN
            RAISE EX2;
        END IF;
EXCEPTION
        WHEN EX1 THEN
            RAISE_APPLICATION_ERROR(-20081, 'IL PAZIENTE INSERITO � GIA STATO DIMESSO.');
        WHEN EX2 THEN
            RAISE_APPLICATION_ERROR(-20082, 'IL PAZIENTE INSERITO HA GIA UNA DIETA ASSEGNATA.');
END;
/