MYSQLRPLCHECK(1)                                                  MySQL Utilities                                                 MYSQLRPLCHECK(1)

NAME
       mysqlrplcheck - Check Replication Prerequisitiess

SYNOPSIS
       mysqlrplcheck [options]

DESCRIPTION
       This utility checks the prerequisites for replication between a master and a slave. These checks (called tests) are designed to ensure a
       healthy replication setup. The utility performs the following tests:

        1. Is the binary log enabled on the master?

        2. Are there binary logging exceptions (such as *_do_db or *_ignore_db settings)? If so, display them.

        3. Does the replication user exist on the master with the correct privileges?

        4. Are there server_id conflicts?

        5. Is the slave connected to this master? If not, display the master host and port.

        6. Are there conflicts between the master.info file on the slave and the values shown in SHOW SLAVE STATUS on the master?

        7. Are the InnoDB configurations compatible (plugin vs. native)?

        8. Are the storage engines compatible (have same on slave as master)?

        9. Are the lower_case_tables_names settings compatible? Warn if there are settings for lowercase/uppercase table names that can cause
           problems. See Bug #59240.

       10. Is the slave behind the master?

       The utility runs each test in turn unless there is a fatal error preventing further testing, such as a loss of connection to the servers.

       Each test can complete with one of the following states: pass (the prerequisites are met), fail (the prerequisites were met but one or more
       errors occurred or there are exceptions to consider), or warn (the test found some unusual settings that should be examined further but may
       not be in error).

       Use the --verbose option to see additional information such as server IDs, lower_case_table_name settings, and the contents of the master
       information file on the slave.

       To see the values from the SHOW SLAVE STATUS statement, use the --show-slave-status option.
             OPTIONS

       mysqlrplcheck accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --master=<source>

           Connection information for the master server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>]or
           <login-path>[:<port>][:<socket>].

       ·   --master-info-file=<file>

           The name of the master information file on the slave. The default is master.info read from the data directory. Note: This option
           requires that you run the utility on the slave and that you have appropriate read access for the file.

       ·   --quiet, -q

           Turn off all messages for quiet execution. Note: Errors and warnings are not suppressed.

       ·   --show-slave-status, -s

           Display the values from SHOW SLAVE STATUS on the master.

       ·   --slave=<source>

           Connection information for the slave server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>]or
           <login-path>[:<port>][:<socket>].

       ·   --suppress

           Suppress warning messages.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.

       ·   --width=<number>

           Change the display width of the test report. The default is 75 characters.
             NOTES

       The login user must have the appropriate permissions to execute SHOW SLAVE STATUS, SHOW MASTER STATUS, and SHOW VARIABLES on the
       appropriate servers.

       Mixing IP and hostnames is not recommended. The replication-specific utilities will attempt to compare hostnames and IP addresses as
       aliases for checking slave connectivity to the master. However, if your installation does not support reverse name lookup, the comparison
       could fail. Without the ability to do a reverse name lookup, the replication utilities could report a false negative that the slave is
       (not) connected to the master.

       For example, if you setup replication using MASTER_HOST=ubuntu.net on the slave and later connect to the slave with mysqlrplcheck and have
       the master specified as --master=192.168.0.6 using the valid IP address for ubuntu.net, you must have the ability to do a reverse name
       lookup to compare the IP (192.168.0.6) and the hostname (ubuntu.net) to determine if they are the same machine.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       To check the prerequisites of a master and slave that currently are actively performing replication, use the following command:

           $ mysqlrplcheck --master=root@host1:3310 --slave=root@host2:3311
           # master on host1: ... connected.
           # slave on host2: ... connected.
           Test Description                                                  Status
           ------------------------------------------------------------------------
           Checking for binary logging on master                             [pass]
           Are there binlog exceptions?                                      [pass]
           Replication user exists?                                          [pass]
           Checking server_id values                                         [pass]
           Is slave connected to master?                                     [pass]
           Check master information file                                     [pass]
           Checking InnoDB compatibility                                     [pass]
           Checking storage engines compatibility                            [pass]
           Checking lower_case_table_names settings                          [pass]
           Checking slave delay (seconds behind master)                      [pass]
           # ...done.

       As shown in the example, you must provide valid login information for both the master and the slave.

       To perform the same command but also display the contents of the master information file on the slave and the values of SHOW SLAVE STATUS
       as well as additional details, use this command:

           $ mysqlrplcheck --master=root@host1:3310 --slave=root@host2:3311 \
             --show-slave-status -vv
           # master on host1: ... connected.
           # slave on host2: ... connected.
           Test Description                                                  Status
           ------------------------------------------------------------------------
           Checking for binary logging on master                              [pass]
           Are there binlog exceptions?                                       [pass]
           Replication user exists?                                           [pass]
           Checking server_id values                                          [pass]
            master id = 10
             slave id = 11
           Is slave connected to master?                                      [pass]
           Check master information file                                      [pass]
           #
           # Master information file:
           #
                          Master_Log_File : clone-bin.000001
                      Read_Master_Log_Pos : 482
                              Master_Host : host1
                              Master_User : rpl
                          Master_Password : XXXX
                              Master_Port : 3310
                            Connect_Retry : 60
                       Master_SSL_Allowed : 0
                       Master_SSL_CA_File :
                       Master_SSL_CA_Path :
                          Master_SSL_Cert :
                        Master_SSL_Cipher :
                           Master_SSL_Key :
            Master_SSL_Verify_Server_Cert : 0
           Checking InnoDB compatibility                                      [pass]
           Checking storage engines compatibility                             [pass]
           Checking lower_case_table_names settings                           [pass]
             Master lower_case_table_names: 2
              Slave lower_case_table_names: 2
           Checking slave delay (seconds behind master)                       [pass]
           #
           # Slave status:
           #
                           Slave_IO_State : Waiting for master to send event
                              Master_Host : host1
                              Master_User : rpl
                              Master_Port : 3310
                            Connect_Retry : 60
                          Master_Log_File : clone-bin.000001
                      Read_Master_Log_Pos : 482
                           Relay_Log_File : clone-relay-bin.000006
                            Relay_Log_Pos : 251
                    Relay_Master_Log_File : clone-bin.000001
                         Slave_IO_Running : Yes
                        Slave_SQL_Running : Yes
                          Replicate_Do_DB :
                      Replicate_Ignore_DB :
                       Replicate_Do_Table :
                   Replicate_Ignore_Table :
                  Replicate_Wild_Do_Table :
              Replicate_Wild_Ignore_Table :
                               Last_Errno : 0
                               Last_Error :
                             Skip_Counter : 0
                      Exec_Master_Log_Pos : 482
                          Relay_Log_Space : 551
                          Until_Condition : None
                           Until_Log_File :
                            Until_Log_Pos : 0
                       Master_SSL_Allowed : No
                       Master_SSL_CA_File :
                       Master_SSL_CA_Path :
                          Master_SSL_Cert :
                        Master_SSL_Cipher :
                           Master_SSL_Key :
                    Seconds_Behind_Master : 0
            Master_SSL_Verify_Server_Cert : No
                            Last_IO_Errno : 0
                            Last_IO_Error :
                           Last_SQL_Errno : 0
                           Last_SQL_Error :
           # ...done.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                    MYSQLRPLCHECK(1)
