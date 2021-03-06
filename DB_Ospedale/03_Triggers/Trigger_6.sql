CREATE OR REPLACE TRIGGER DATADIMIS
BEFORE
        INSERT ON DIMISSIONE
        FOR EACH ROW
DECLARE
        TIMEPARADOX2 EXCEPTION;
        D DATE;
BEGIN
        SELECT DATA_RICOVERO INTO D
        FROM RICOVERO
        WHERE ID_RICOVERO = :NEW.ID_RICOVERO;
        IF(:NEW.DATA_ORA < D) THEN
            RAISE TIMEPARADOX2;
        END IF;
EXCEPTION
        WHEN TIMEPARADOX2 THEN
            RAISE_APPLICATION_ERROR(-20061,'LA DATA DI DIMISSIONE PRECEDE LA DATA DI RICOVERO');
END;
/
