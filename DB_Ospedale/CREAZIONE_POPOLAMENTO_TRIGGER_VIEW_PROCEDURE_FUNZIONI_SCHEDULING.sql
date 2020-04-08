connect /as sysdba
alter session set "_ORACLE_SCRIPT"=true;

--UTENTI
DROP USER DB_ADMIN CASCADE;
DROP USER MEDICO CASCADE;
DROP USER INFERMIERE CASCADE;
DROP USER FISIOTERAPISTA CASCADE;
DROP USER PAZIENTE CASCADE;

DROP ROLE MED_ROLE;
DROP ROLE INF_ROLE;
DROP ROLE FISIO_ROLE;
DROP ROLE PAZ_ROLE;

START "C:\Users\pietr\Desktop\DB Ospedale\04_Permessi_e_Utenti\CREAZIONE_UTENTI.sql";

connect DB_ADMIN/admin

--CREAZIONE E POPOLAMENTO
START "C:\Users\pietr\Desktop\DB Ospedale\01_Creazione_e_Popolamento\01_DBMS_CLINICA_CREAZIONE_TABELLE.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\01_Creazione_e_Popolamento\02_DBMS_CLINICA_POPOLAMENTO_(LUCA).SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\01_Creazione_e_Popolamento\03_DBMS_CLINICA_POPOLAMENTO_(MARCO).SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\01_Creazione_e_Popolamento\04_DBMS_CLINICA_POPOLAMENTO_(LUIGI).SQL";

--PROCEDURE, FUNZIONI E VIEW
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\CF_PAZ_DA_NOME.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\COUNT_INT.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\END_INT.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\GET_INF.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\INTERVENTI_DA_FARE.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\NUM_INT_EFF_PAZ.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\PRENOTA_VISITA.SQL";

START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_ANALISI_PAZ.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_ESAMI_PAZ.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_FOGLI_TERAPIA.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_FOGLIO_FISIO_E_ESAMI_PAZ.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_PAZ_STANZ_REP.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VIS_RIC_ULTIMA_SETT.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VISUALIZZA_INT_DA_FARE.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VISUALIZZA_INT_PAZ.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\VISUALIZZA_PAZIENTE.SQL";

START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\PROGRAMMAZIONE_INTERVENTO.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\PROG_INT_ANALISI.SQL";
START "C:\Users\pietr\Desktop\DB Ospedale\02_View_Funzioni_Procedure\TRY_DIM.SQL";

--TRIGGERS
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\INS_DIMISSIONE.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\INS_INTERVENTO.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\INS_RICOVERO.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\INT_VIS.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_3.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_6.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_7.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_8.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_9.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_11.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_12.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_13.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_15.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_16.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_17.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\03_Triggers\Trigger_18.sql";

--PERMESSI
START "C:\Users\pietr\Desktop\DB Ospedale\04_Permessi_e_Utenti\PERMESSI_FISIOTERAPISTA.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\04_Permessi_e_Utenti\PERMESSI_INFERMIERE.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\04_Permessi_e_Utenti\PERMESSI_MEDICO.sql";
START "C:\Users\pietr\Desktop\DB Ospedale\04_Permessi_e_Utenti\PERMESSI_PAZIENTE.sql";

--SCHEDULER
START "C:\Users\pietr\Desktop\DB Ospedale\05_Scheduler\cancella_visite_non_effettuate.sql";

COMMIT;