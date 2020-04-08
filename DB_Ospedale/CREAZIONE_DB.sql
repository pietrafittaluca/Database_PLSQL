connect /as sysdba
alter session set "_ORACLE_SCRIPT"=true;

define PATH = C:\Users\pietr\Desktop\Progetto_BD_Clinica_Riabilitativa\DB_Ospedale
UTENTI
DROP USER DB_ADMIN CASCADE;
DROP USER MEDICO CASCADE;
DROP USER INFERMIERE CASCADE;
DROP USER FISIOTERAPISTA CASCADE;
DROP USER PAZIENTE CASCADE;

DROP ROLE MED_ROLE;
DROP ROLE INF_ROLE;
DROP ROLE FISIO_ROLE;
DROP ROLE PAZ_ROLE;

@&PATH\04_Permessi_e_Utenti\CREAZIONE_UTENTI.sql;

connect DB_ADMIN/admin

--CREAZIONE E POPOLAMENTO
@&PATH\01_Creazione_e_Popolamento\01_DBMS_CLINICA_CREAZIONE_TABELLE.sql;
@&PATH\01_Creazione_e_Popolamento\02_DBMS_CLINICA_POPOLAMENTO_(LUCA).sql;
@&PATH\01_Creazione_e_Popolamento\03_DBMS_CLINICA_POPOLAMENTO_(MARCO).sql;
@&PATH\01_Creazione_e_Popolamento\04_DBMS_CLINICA_POPOLAMENTO_(LUIGI).sql;

--PROCEDURE, FUNZIONI E VIEW
@&PATH\02_View_Funzioni_Procedure\CF_PAZ_DA_NOME.sql;
@&PATH\02_View_Funzioni_Procedure\COUNT_INT.sql;
@&PATH\02_View_Funzioni_Procedure\END_INT.sql;
@&PATH\02_View_Funzioni_Procedure\GET_INF.sql;
@&PATH\02_View_Funzioni_Procedure\INTERVENTI_DA_FARE.sql;
@&PATH\02_View_Funzioni_Procedure\NUM_INT_EFF_PAZ.sql;
@&PATH\02_View_Funzioni_Procedure\PRENOTA_VISITA.sql;

@&PATH\02_View_Funzioni_Procedure\VIS_ANALISI_PAZ.sql;
@&PATH\02_View_Funzioni_Procedure\VIS_ESAMI_PAZ.sql;
@&PATH\02_View_Funzioni_Procedure\VIS_FOGLI_TERAPIA.sql;
@&PATH\02_View_Funzioni_Procedure\VIS_FOGLIO_FISIO_E_ESAMI_PAZ.sql;
@&PATH\02_View_Funzioni_Procedure\VIS_PAZ_STANZ_REP.sql;
@&PATH\02_View_Funzioni_Procedure\VIS_RIC_ULTIMA_SETT.sql;
@&PATH\02_View_Funzioni_Procedure\VISUALIZZA_INT_DA_FARE.sql;
@&PATH\02_View_Funzioni_Procedure\VISUALIZZA_INT_PAZ.sql;
@&PATH\02_View_Funzioni_Procedure\VISUALIZZA_PAZIENTE.sql;

@&PATH\02_View_Funzioni_Procedure\PROGRAMMAZIONE_INTERVENTO.sql;
@&PATH\02_View_Funzioni_Procedure\PROG_INT_ANALISI.sql;
@&PATH\02_View_Funzioni_Procedure\TRY_DIM.sql;

--TRIGGERS
@&PATH\03_Triggers\INS_INTERVENTO.sql;
@&PATH\03_Triggers\INS_RICOVERO.sql;
@&PATH\03_Triggers\INT_VIS.sql;
@&PATH\03_Triggers\Trigger_3.sql;
@&PATH\03_Triggers\Trigger_6.sql;
@&PATH\03_Triggers\Trigger_7.sql;
@&PATH\03_Triggers\Trigger_8.sql;
@&PATH\03_Triggers\Trigger_9.sql;
@&PATH\03_Triggers\Trigger_11.sql;
@&PATH\03_Triggers\Trigger_12.sql;
@&PATH\03_Triggers\Trigger_13.sql;
@&PATH\03_Triggers\Trigger_15.sql;
@&PATH\03_Triggers\Trigger_16.sql;
@&PATH\03_Triggers\Trigger_17.sql;
@&PATH\03_Triggers\Trigger_18.sql;

--PERMESSI
@&PATH\04_Permessi_e_Utenti\PERMESSI_FISIOTERAPISTA.sql;
@&PATH\04_Permessi_e_Utenti\PERMESSI_INFERMIERE.sql;
@&PATH\04_Permessi_e_Utenti\PERMESSI_MEDICO.sql;
@&PATH\04_Permessi_e_Utenti\PERMESSI_PAZIENTE.sql;

--SCHEDULER
@&PATH\05_Scheduler\cancella_visite_non_effettuate.sql;

COMMIT;