CREATE OR REPLACE PROCEDURE CF_PAZ_DA_NOME(NOMEx VARCHAR)
AS
    C1  SYS_REFCURSOR;
BEGIN
    OPEN C1 FOR
    SELECT CF_PAZ,COGNOME
    FROM PAZIENTE P JOIN PERSONA PE ON P.CF_PAZ=PE.CF
    WHERE PE.NOME=NOMEx;
    DBMS_SQL.RETURN_RESULT(C1);
END;
/
--Visualizzare CF_PAZ e Cognome da un dato Nome
