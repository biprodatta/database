
SQL> select username,account_status,profile,created,lock_date,default_tablespace from dba_users where username like 'INFODBA_TEST';

SQL> select count(1),object_type,STATUS from dba_objects where owner='INFODBA_TEST' group by object_type,STATUS;

  COUNT(1) OBJECT_TYPE         STATUS
---------- ------------------- -------
         9 FUNCTION            VALID
         1 PACKAGE             VALID
         1 VIEW                INVALID
       25 SEQUENCE            VALID
         2 TRIGGER             VALID
     1618 TABLE               VALID
         1 PACKAGE BODY        VALID
      1234 INDEX               VALID
        62 LOB                 VALID
       123 VIEW                VALID

10 rows selected.

SQL> select count(1),object_type from dba_objects where owner='INFODBA_TEST' group by object_type;

  COUNT(1) OBJECT_TYPE
---------- -------------------
       25 SEQUENCE
         1 PACKAGE
        6 LOB
         1 PACKAGE BODY
         2 TRIGGER
      533 INDEX
     1618 TABLE
         9 FUNCTION
       27 VIEW

9 rows selected.

SQL> select username,account_status from dba_users where username like '%INFODBA%';

USERNAME                       ACCOUNT_STATUS
------------------------------ ------------------------------
INFODBA_TEST                        OPEN

SQL> select * from dba_roles where role like '%INFODBA%';

ROLE                           PASSWORD AUTHENTICAT
------------------------------ -------- -----------
INFODBA_LOOKER                 NO       NONE
INFODBA_UPDATER                NO       NONE

SQL> select TABLESPACE_NAME,PARTITIONED,INDEX_TYPE,count(1) from dba_indexes where owner='INFODBA_TEST' group by TABLESPACE_NAME,PARTITIONED,INDEX_TYPE;

TABLESPACE_NAME                PAR INDEX_TYPE                    COUNT(1)
------------------------------ --- --------------------------- ----------
PROD_UPGRADE                   NO  FUNCTION-BASED NORMAL               16
IDATA                          NO  NORMAL                            3178
IDATA                          NO  LOB                                 67
IDATA                          NO  FUNCTION-BASED NORMAL             1123
PROD_UPGRADE                   NO  NORMAL                             954

SQL> select username,default_tablespace from dba_users where username='INFODBA_TEST';

USERNAME                       DEFAULT_TABLESPACE
------------------------------ ------------------------------
INFODBA_TEST                        IDATA

SQL> select distinct(tablespace_name),owner from dba_indexes where owner='INFODBA_TEST';

TABLESPACE_NAME                OWNER
------------------------------ ------------------------------
IDATA                          INFODBA_TEST
PROD_UPGRADE                   INFODBA_TEST

SQL> select count(*) from dba_objects where owner='INFODBA_TEST';

  COUNT(*)
----------
     22134

SQL> select count(*) from dba_tables where owner='INFODBA_TEST';

  COUNT(*)
----------
     16182

SQL> SELECT s.owner,SUM (s.BYTES) / (1024 * 1024 * 1024) SIZE_IN_GB FROM dba_segments s where s.owner='INFODBA_TEST' GROUP BY s.owner;

OWNER                          SIZE_IN_GB
------------------------------ ----------
INFODBA_TEST                        169.27886962890625

SQL> select distinct(OWNER) from dba_synonyms where TABLE_OWNER='INFODBA_TEST';

no rows selected

SQL> select distinct(tablespace_name) from dba_segments where owner='INFODBA_TEST';

TABLESPACE_NAME
------------------------------
ILOG
IDATA
PROD_UPGRADE

SQL> SELECT TABLESPACE_NAME,USERNAME FROM DBA_TS_QUOTAS WHERE USERNAME='INFODBA_TEST';

TABLESPACE_NAME                USERNAME
------------------------------ ------------------------------
IDATA                          INFODBA_TEST
PROD_UPGRADE                   INFODBA_TEST
INDX                           INFODBA_TEST
ILOG                           INFODBA_TEST

SQL> select * from dba_role_privs where grantee='INFODBA_TEST';
SQL> SQL>
GRANTEE                        GRANTED_ROLE                   ADM DEF
------------------------------ ------------------------------ --- ---
INFODBA_TEST                        RESOURCE                       NO  YES
INFODBA_TEST                        SELECT_CATALOG_ROLE            NO  YES
INFODBA_TEST                        CONNECT                        NO  YES

SQL> select * from dba_sys_privs where grantee='INFODBA_TEST';

GRANTEE                        PRIVILEGE                                ADM
------------------------------ ---------------------------------------- ---
INFODBA_TEST                       UNLIMITED TABLESPACE                     NO
INFODBA_TEST                        CREATE TRIGGER                           NO
INFODBA_TEST                        CREATE PROCEDURE                         NO
INFODBA_TEST                        ALTER SESSION                            NO
INFODBA_TEST                        CREATE SESSION                           NO
INFODBA_TEST                        CREATE TABLE                             NO
INFODBA_TEST                        CREATE VIEW                              NO

7 rows selected.

