## commands used for stop and start the oracle listener and db service before and after the server patching or restart:

```bash
# stop the db listener service
lsnrctl status LISTENER
lsnrctl stop LISTENER
lsnrctl status LISTENER
```
Login using sqlplus and sys password
```bash
sqlplus sys as sysdba
# shutdown database
SQL> shutdown immediate;
SQL> exit
# check status
ps -ef |grep pmon

#######DO THE PATCHING OR RESTART THE SERVER

# Database Startup Commands:
ps -ef |grep pmon
-bash-4.2$ sqlplus sys as sysdba
# starting the db
SQL> startup;
SQL> exit
# check status
ps -ef |grep pmon
# start the db listener service
lsnrctl status LISTENER
lsnrctl start LISTENER
lsnrctl status LISTENER