BEGIN
DBMS_SCHEDULER.CREATE_JOB (
JOB_NAME	=> 'cancella_visite_non_effettuate',
JOB_TYPE	=> 'PLSQL_BLOCK',
JOB_ACTION	=> 'BEGIN 
			DELETE FROM VISITA WHERE DATA_EFFETTIVA IS NULL AND SYSDATE - DATA_PREVISTA > 14;
		    END;',
START_DATE	=> SYSTIMESTAMP,
REPEAT_INTERVAL => 'FREQ=DAILY; BYHOUR=8;',
ENABLED		=> TRUE,
AUTO_DROP	=> FALSE,
COMMENTS	=> 'Ogni giorno alle ore 8:00 vengono eliminate dal db le visite che non sono state effettuate entro due settimane dalla data di prenotazione.');
END;
/
