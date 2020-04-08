CREATE OR REPLACE PROCEDURE INTERVENTI_DA_FARE(CF_MEDx CHAR)
AS
	C1          SYS_REFCURSOR;
BEGIN
    	OPEN C1 FOR
    	SELECT I.ID_INTERVENTO,I.CF_PAZ,ET.NOME_REPARTO
	FROM INTERVENTO I JOIN EFFETTUA E ON I.ID_INTERVENTO=E.ID_INTERVENTO JOIN E_TENUTO ET ON I.ID_RICOVERO=ET.ID_RICOVERO
	WHERE E.CF_MED=CF_MEDx AND (I.DATA_EFFETTIVA IS NULL);
    	DBMS_SQL.RETURN_RESULT(C1);
END;
/
--Visualizzare gli interventi da fare di un medico e il nome del reparto del paziente
/
