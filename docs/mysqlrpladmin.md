MYSQLRPLADMIN(1)                                                  MySQL Utilities                                                 MYSQLRPLADMIN(1)

NAME
       mysqlrpladmin - Administration utility for MySQL replication

SYNOPSIS
       mysqlrpladmin [options]

DESCRIPTION
       This utility permits users to perform administrative actions on a replication topology consisting of a master and its slaves. The utility
       is designed to make it easy to recover from planned maintenance of the master or from an event that takes the master offline unexpectedly.

       The act of taking the master offline intentionally and switching control to another slave is called switchover. In this case, there is no
       loss of transactions as the master is locked and all slaves are allowed to catch up to the master. Once the slaves have read all events
       from the master, the master is shutdown and control switched to a slave (in this case called a candidate slave).

       Recovering from the loss of a downed master is more traumatic and since there is no way to know what transactions the master may have
       failed to send, the new master (called a candidate slave) must be the slave that is most up-to-date. How this is determined depends on the
       version of the server (see below). However, it can result in the loss of some transactions that were executed on the downed master but not
       sent. The utility accepts a list of slaves to be considered the candidate slave. If no slave is found to meet the requirements, the
       operation will search the list of known slaves.

       The utility also provides a number of useful commands for managing a replication topology including the following.

       elect This command is available to only those servers supporting global transaction identifiers (GTIDs), perform best slave election and
       report best slave to use in the event a switchover or failover is required. Best slave election is simply the first slave to meet the
       prerequisites. GTIDs are supported in version 5.6.5 and higher. This command requires the options --master and either --slaves or
       --discover-slaves-login.

       failover This command is available to only those servers supporting GTIDs. Conduct failover to the best slave. The command will test each
       candidate slave listed for the prerequisites. Once a candidate slave is elected, it is made a slave of each of the other slaves thereby
       collecting any transactions executed on other slaves but not the candidate. In this way, the candidate becomes the most up-to-date slave.
       This command requires the --slaves option. The --discover-slaves-login option is not allowed because, for failover, the master is presumed
       to be offline or otherwise unreachable (so there is no way to discover the slaves). The --master option is ignored for this command.

       gtid This command is available to only those servers supporting GTIDs. It displays the contents of the GTID variables,
       @@GLOBAL.GTID_EXECUTED, @@GLOBAL.GTID_PURGED, and @@GLOBAL.GTID_OWNED. The command also displays universally unique identifiers (UUIDs) for
       all servers. This command requires one of the following combinations: --master and --slaves, or --master and --discover-slaves-login.

       health Display the replication health of the topology. By default, this includes the host name, port, role (MASTER or SLAVE) of the server,
       state of the server (UP = is connected, WARN = not connected but can ping, DOWN = not connected and cannot ping), the GTID_MODE, and health
       state. This command requires one of the following combinations:

       ·   --master and --slaves;

       ·   --master and --discover-slaves-login;

       The master health state is based on the following; if GTID_MODE=ON, the server must have binary log enabled, and there must exist a user
       with the REPLICATE SLAVE privilege.

       The slave health state is based on the following; the IO_THREAD and SQL_THREADS must be running, it must be connected to the master, there
       are no errors, the slave delay for non-gtid enabled scenarios is not more than the threshold provided by the --max-position and the slave
       is reading the correct master log file, and slave delay is not more than the --seconds-behind threshold option.

       reset Execute the STOP SLAVE and RESET SLAVE commands on all slaves. This command requires the --slaves option. The --discover-slaves-login
       option is not allowed because it might not provide the expected result, excluding slaves with the IO thread stopped. Optionally, the
       --master option can also be used and in this case the utility will perform an additional check to verify if the specified slaves are
       associated (i.e. replication configured) to the given master.

       start Execute the START SLAVE command on all slaves. This command requires the --slaves option. The --discover-slaves-login option is not
       allowed because it might not provide the expected result, excluding slaves with the IO thread stopped. Optionally, the --master option can
       also be used and in this case the utility will perform an additional check to verify if the specified slaves are associated (i.e.
       replication configured) to the given master.

       stop Execute the STOP SLAVE command on all slaves. This command requires the --slaves option. The --discover-slaves-login option is not
       allowed because it might not provide the expected result, excluding slaves with the IO thread stopped. Optionally, the --master option can
       also be used and in this case the utility will perform an additional check to verify if the specified slaves are associated (i.e.
       replication configured) to the given master.

       switchover Perform slave promotion to a specified candidate slave as designated by the --new-master option. This command is available for
       both gtid-enabled servers and non-gtid-enabled scenarios. This command requires one of the following combinations:

       ·   --master, --new-master and --slaves;

       ·   --master, --new-master and --discover-slaves-login;

       Detection of a downed master is performed as follows. If the connection to the master is lost, wait --ping seconds and check again. If the
       master connection is lost and the master cannot be pinged or reconnected, the failover event occurs.

       For all commands that require specifying multiple servers, the options require a comma-separated list of connection parameters in the
       following form (where the password, port, and socket are optional).:

           <*user*>[:<*passwd*>]@<*host*>[:<*port*>][:<*socket*>] or
           <*login-path*>[:<*port*>][:<*socket*>]

       The utility permits users to discover slaves connected to the master. In order to use the discover slaves feature, all slaves must use the
       --report-host and --report-port startup variables to specify the correct hostname and ip port of the slave. If these are missing or report
       the incorrect information, the slaves health may not be reported correctly or the slave may not be listed at all. The discover slaves
       feature ignores any slaves it cannot connect to or with the IO thread stopped (i.e. not connected to the master).

       The utility permits the user to demote a master to a slave during the switchover operation. The --demote-master option tells the utility
       to, once the new master is established, make the old master a slave of the new master. This permits rotation of the master role among a set
       of servers.

       The utility permits the user to specify an external script to execute before and after the switchover and failover commands. The user can
       specify these with the --exec-before and --exec-after options. The return code of the script is used to determine success thus each script
       must report 0 (success) to be considered successful. If a script returns a value other than 0, the result code is presented in an error
       message.

       The utility permits the user to log all actions taken during the commands. The --log option requires a valid path and file name of the file
       to use for logging operations. The log is active only when this option is specified. The option --log-age specifies the age in days that
       log entries are kept. The default is seven (7) days. Older entries are automatically deleted from the log file (but only if the --log
       option is specified).

       The format of the log file includes the date and time of the event, the level of the event (informational - INFO, warning - WARN, error -
       ERROR, critical failure - CRITICAL), and the message reported by the utility.

       The utility has a number of options each explained in more detail below. Some of the options are specific to certain commands. Warning
       messages are issued whenever an option is used that does not apply to the command requested. A brief overview of each command and its
       options is presented in the following paragraphs.

       The start, stop, and reset commands require the --slaves option to list all of the slaves in the topology. Optionally, the --master option
       can be specified for the utility to check if the specified slaves are associated to the given master before executing the command, making
       sure that the command is only applied to slaves connected to the right replication master.

       The options required for the elect, health and gtid commands include the --master option to specify the existing master, and either the
       --slaves option to list all of the slaves in the topology or the --discover-slaves-login option to provide the user name and password to
       discover any slaves in the topology that are registered and connected to the master.

       The options required for switchover include the --master option to specify the existing master, the --new-master option to specify the
       candidate slave (the slave to become the new master), and either the --slaves option to list the considered slaves in the topology or the
       --discover-slaves-login option to provide the user name and password to discover any slaves in the topology that are registered and
       connected to the master.

       The failover command requires only the --slaves option to explicitly list all of the slaves in the topology because it is expected that the
       master is down when this command is used.

       Use the --verbose option to see additional information in the health report and additional messages during switchover or failover.
             OPTIONS

       mysqlrpladmin accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --candidates=<candidate slave connections>

           Connection information for candidate slave servers for failover in the form: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>]. Valid only with failover command. List multiple slaves in comma-separated list.

       ·   --demote-master

           Make master a slave after switchover.

       ·   --discover-slaves-login=<slave_login>

           At startup, query master for all registered slaves and use the user name and password specified to connect. Supply the user and
           password in the form <user>[:<passwd>] or <login-path>. For example, --discover=joe:secret will use 'joe' as the user and 'secret' as
           the password for each discovered slave.

       ·   --exec-after=<script>

           Name of script to execute after failover or switchover. Script name may include the path.

       ·   --exec-before=<script>

           Name of script to execute before failover or switchover. Script name may include the path.

       ·   --force

           Ignore prerequisite checks or any inconsistencies found (e.g. errant transactions on the slaves or SQL thread errors) forcing the
           execution of the specified command. This option need to be used carefully as it will not solve any detected issue, but will only ignore
           them displaying a warning message.

       ·   --format=<format>, -f <format>

           Display the replication health output in either grid (default), tab, csv, or vertical format.

       ·   --log=<log_file>

           Specify a log file to use for logging messages

       ·   --log-age=<days>

           Specify maximum age of log entries in days. Entries older than this will be purged on startup. Default = 7 days.

       ·   --master=<connection>

           Connection information for the master server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --max-position=<position>

           Used to detect slave delay. The maximum difference between the master's log position and the slave's reported read position of the
           master. A value greater than this means the slave is too far behind the master. Default = 0.

       ·   --new-master=<connection>

           Connection information for the slave to be used to replace the master for switchover in the form:
           <user>[:<passwd>]@<host>[:<port>][:<socket>] or <login-path>[:<port>][:<socket>]. Valid only with switchover command.

       ·   --no-health

           Turn off health report after switchover or failover.

       ·   --ping=<number>

           Number of ping attempts for detecting downed server. Note: on some platforms this is the same as number of seconds to wait for ping to
           return. This value is also used to check down status of master. Failover will wait ping seconds to check master response. If no
           response, failover event occurs.

       ·   --quiet, -q

           Turn off all messages for quiet execution.

       ·   --rpl-user=<replication_user>

           The user and password for the replication user requirement, in the format: <user>[:<password>] or <login-path>. E.g. rpl:passwd Default
           = None.

       ·   --script-threshold=<return_code>

           Value for external scripts to trigger aborting the operation if result is greater than or equal to the threshold.

           Default = None (no threshold checking).

       ·   --seconds-behind=<seconds>

           Used to detect slave delay. The maximum number of seconds behind the master permitted before slave is considered behind the master.
           Default = 0.

       ·   --slaves=<slave connections>

           Connection information for slave servers in the form: <user>[:<passwd>]@<host>[:<port>][:<socket>] or <login-path>[:<port>][:<socket>].
           List multiple slaves in comma-separated list. The list will be evaluated literally whereby each server is considered a slave to the
           master listed regardless if they are a slave of the master.

       ·   --timeout=<seconds>

           Maximum timeout in seconds to wait for each replication command to complete. For example, timeout for slave waiting to catch up to
           master. Default = 300 seconds.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       The login user must have the appropriate permissions to execute SHOW SLAVE STATUS, SHOW MASTER STATUS, and SHOW VARIABLES on the
       appropriate servers as well as grant the REPLICATE SLAVE privilege. The utility checks permissions for the master, slaves, and candidates
       at startup.

       Mixing IP and hostnames is not recommended. The replication-specific utilities will attempt to compare hostnames and IP addresses as
       aliases for checking slave connectivity to the master. However, if your installation does not support reverse name lookup, the comparison
       could fail. Without the ability to do a reverse name lookup, the replication utilities could report a false negative that the slave is
       (not) connected to the master.

       For example, if you setup replication using MASTER_HOST=ubuntu.net on the slave and later connect to the slave with mysqlrplcheck and have
       the master specified as --master=192.168.0.6 using the valid IP address for ubuntu.net, you must have the ability to do a reverse name
       lookup to compare the IP (192.168.0.6) and the hostname (ubuntu.net) to determine if they are the same machine.

       Similarly, if you use localhost to connect to the master, the health report may not show all of the slaves. It is best to use the actual
       hostname of the master when connecting or setting up replication.

       If the user does not specify the --rpl-user and the user has specified the switchover or failover command, the utility will check to see if
       the slaves are using --master-info-repository=TABLE. If they are not, the utility will stop with an error.

       All the commands require either the --slaves or --discover-slaves-login option but both cannot be used at the same time. In fact, some
       commands only allow the use of the --slaves option which is safer to specify the list slaves, because --discover-slaves-login might not
       provide an up to date list of available slaves.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       To perform best slave election for a topology with GTID_MODE=ON (server version 5.6.5 or higher) where all slaves are specified with the
       --slaves option, run the following command.:

           $ mysqlrpladmin --master=root@localhost:3331 \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 elect
           # Electing candidate slave from known slaves.
           # Best slave found is located on localhost:3332.
           # ...done.

       To perform best slave election supplying a candidate list, use the following command.:

           $ mysqlrpladmin --master=root@localhost:3331 \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 \
             --candidates=root@localhost:3333,root@localhost:3334 elect
           # Electing candidate slave from candidate list then slaves list.
           # Best slave found is located on localhost:3332.
           # ...done.

       To perform failover after a master has failed, use the following command.:

           $ mysqlrpladmin  \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 \
             --candidates=root@localhost:3333,root@localhost:3334 failover
           # Performing failover.
           # Candidate slave localhost:3333 will become the new master.
           # Preparing candidate for failover.
           # Creating replication user if it does not exist.
           # Stopping slaves.
           # Performing STOP on all slaves.
           # Switching slaves to new master.
           # Starting slaves.
           # Performing START on all slaves.
           # Checking slaves for errors.
           # Failover complete.
           # ...done.

       To see the replication health of a topology with GTID_MODE=ON (server version 5.6.5 or higher) and discover all slaves attached to the
       master, run the following command. We use the result of the failover command above.:

           $ mysqlrpladmin --master=root@localhost:3333 \
             --slaves=root@localhost:3332,root@localhost:3334 health
           # Getting health for master: localhost:3333.
           #
           # Replication Topology Health:
           +------------+-------+---------+--------+------------+---------+
           | host       | port  | role    | state  | gtid_mode  | health  |
           +------------+-------+---------+--------+------------+---------+
           | localhost  | 3333  | MASTER  | UP     | ON         | OK      |
           | localhost  | 3332  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3334  | SLAVE   | UP     | ON         | OK      |
           +------------+-------+---------+--------+------------+---------+
           # ...done.

       To view a detailed replication health report but with all of the replication health checks revealed, use the --verbose option as shown
       below. In this example, we use vertical format to make viewing easier.:

           $ mysqlrpladmin --master=root@localhost:3331 \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 \
             --verbose health
           # Getting health for master: localhost:3331.
           # Attempting to contact localhost ... Success
           # Attempting to contact localhost ... Success
           # Attempting to contact localhost ... Success
           # Attempting to contact localhost ... Success
           #
           # Replication Topology Health:
           *************************       1. row *************************
                       host: localhost
                       port: 3331
                       role: MASTER
                      state: UP
                  gtid_mode: ON
                     health: OK
                    version: 5.6.5-m8-debug-log
            master_log_file: mysql-bin.000001
             master_log_pos: 571
                  IO_Thread:
                 SQL_Thread:
                Secs_Behind:
            Remaining_Delay:
               IO_Error_Num:
                   IO_Error:
           *************************       2. row *************************
                       host: localhost
                       port: 3332
                       role: SLAVE
                      state: UP
                  gtid_mode: ON
                     health: OK
                    version: 5.6.5-m8-debug-log
            master_log_file: mysql-bin.000001
             master_log_pos: 571
                  IO_Thread: Yes
                 SQL_Thread: Yes
                Secs_Behind: 0
            Remaining_Delay: No
               IO_Error_Num: 0
                   IO_Error:
           *************************       3. row *************************
                       host: localhost
                       port: 3333
                       role: SLAVE
                      state: UP
                  gtid_mode: ON
                     health: OK
                    version: 5.6.5-m8-debug-log
            master_log_file: mysql-bin.000001
             master_log_pos: 571
                  IO_Thread: Yes
                 SQL_Thread: Yes
                Secs_Behind: 0
            Remaining_Delay: No
               IO_Error_Num: 0
                   IO_Error:
           *************************       4. row *************************
                       host: localhost
                       port: 3334
                       role: SLAVE
                      state: UP
                  gtid_mode: ON
                     health: OK
                    version: 5.6.5-m8-debug-log
            master_log_file: mysql-bin.000001
             master_log_pos: 571
                  IO_Thread: Yes
                 SQL_Thread: Yes
                Secs_Behind: 0
            Remaining_Delay: No
               IO_Error_Num: 0
                   IO_Error:
           4 rows.
           # ...done.

       To run the same failover command above, but specify a log file, use the following command.:

           $ mysqlrpladmin  \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 \
             --candidates=root@localhost:3333,root@localhost:3334 \
             --log=test_log.txt failover
           # Performing failover.
           # Candidate slave localhost:3333 will become the new master.
           # Preparing candidate for failover.
           # Creating replication user if it does not exist.
           # Stopping slaves.
           # Performing STOP on all slaves.
           # Switching slaves to new master.
           # Starting slaves.
           # Performing START on all slaves.
           # Checking slaves for errors.
           # Failover complete.
           # ...done.

       After this command, the log file will contain entries like the following:

           2012-03-19 14:44:17 PM INFO Executing failover command...
           2012-03-19 14:44:17 PM INFO Performing failover.
           2012-03-19 14:44:17 PM INFO Candidate slave localhost:3333 will become the new master.
           2012-03-19 14:44:17 PM INFO Preparing candidate for failover.
           2012-03-19 14:44:19 PM INFO Creating replication user if it does not exist.
           2012-03-19 14:44:19 PM INFO Stopping slaves.
           2012-03-19 14:44:19 PM INFO Performing STOP on all slaves.
           2012-03-19 14:44:19 PM INFO Switching slaves to new master.
           2012-03-19 14:44:20 PM INFO Starting slaves.
           2012-03-19 14:44:20 PM INFO Performing START on all slaves.
           2012-03-19 14:44:20 PM INFO Checking slaves for errors.
           2012-03-19 14:44:21 PM INFO Failover complete.
           2012-03-19 14:44:21 PM INFO ...done.

       To perform switchover and demote the current master to a slave, use the following command.:

           $ mysqlrpladmin --master=root@localhost:3331 \
             --slaves=root@localhost:3332,root@localhost:3333,root@localhost:3334 \
             --new-master=root@localhost:3332 --demote-master switchover
           # Performing switchover from master at localhost:3331 to slave at localhost:3332.
           # Checking candidate slave prerequisites.
           # Waiting for slaves to catch up to old master.
           # Stopping slaves.
           # Performing STOP on all slaves.
           # Demoting old master to be a slave to the new master.
           # Switching slaves to new master.
           # Starting all slaves.
           # Performing START on all slaves.
           # Checking slaves for errors.
           # Switchover complete.
           # ...done.

       If the replication health report is generated on the topology following the above command, it will display the old master as a slave as
       shown below.:

           # Replication Topology Health:
           +------------+-------+---------+--------+------------+---------+
           | host       | port  | role    | state  | gtid_mode  | health  |
           +------------+-------+---------+--------+------------+---------+
           | localhost  | 3332  | MASTER  | UP     | ON         | OK      |
           | localhost  | 3331  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3333  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3334  | SLAVE   | UP     | ON         | OK      |
           +------------+-------+---------+--------+------------+---------+

       You can use the discover slaves feature, if and only if all slaves report their host and port to the master. A sample command to generate a
       replication health report with discovery is shown below. Note that the option --discover-slaves-login cannot be used in conjunction with
       the --slaves option.:

           $ mysqlrpladmin --master=root@localhost:3332 --discover-slaves-login=root  health
           # Discovering slaves for master at localhost:3332
           # Discovering slave at localhost:3331
           # Found slave: localhost:3331
           # Discovering slave at localhost:3333
           # Found slave: localhost:3333
           # Discovering slave at localhost:3334
           # Found slave: localhost:3334
           # Checking privileges.
           #
           # Replication Topology Health:
           +------------+-------+---------+--------+------------+---------+
           | host       | port  | role    | state  | gtid_mode  | health  |
           +------------+-------+---------+--------+------------+---------+
           | localhost  | 3332  | MASTER  | UP     | ON         | OK      |
           | localhost  | 3331  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3333  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3334  | SLAVE   | UP     | ON         | OK      |
           +------------+-------+---------+--------+------------+---------+
           # ...done.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                    MYSQLRPLADMIN(1)
