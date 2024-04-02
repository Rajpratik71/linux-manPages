MYSQLFAILOVER(1)                                                  MySQL Utilities                                                 MYSQLFAILOVER(1)

NAME
       mysqlfailover - Automatic replication failover

SYNOPSIS
       mysqlfailover [options]

DESCRIPTION
       This utility permits users to perform replication health monitoring and automatic failover on a replication topology consisting of a master
       and its slaves. The utility is designed to run interactively or continuously refreshing the health information at periodic intervals. Its
       primary mission is to monitor the master for failure and when a failure occurs, execute failover to the best slave available. The utility
       accepts a list of slaves to be considered the candidate slave.

       This utility is designed to work exclusively for servers that support global transaction identifiers (GTIDs) and have GTID_MODE=ON. MySQL
       server versions 5.6.9 and higher support GTIDs. See the MySQL server online reference manual for more information about setting up
       replication with GTIDs enabled.

       The user can specify the interval in seconds to use for detecting the master status and generating the health report using the --interval
       option. At each interval, the utility will check to see if the server is alive via a ping operation followed by a check of the connector to
       detect if the server is still reachable. The ping operation can be controlled with the --ping option (see below).

       If the master is found to be offline or unreachable, the utility will execute one of the following actions based on the value of the
       --failover-mode option.

       auto Execute automatic failover to the list of candidates first and if no slaves are viable, continue to locate a viable candidate from the
       list of slaves. If no slaves are found to be a viable candidate, the utility will generate and error and exit.

       Once a candidate is found, the utility will conduct failover to the best slave. The command will test each candidate slave listed for the
       prerequisites. Once a candidate slave is elected, it is made a slave of each of the other slaves thereby collecting any transactions
       executed on other slaves but not the candidate. In this way, the candidate becomes the most up-to-date slave.

       elect This mode is the same as auto except if no candidates specified in the list of candidate slaves are viable, it does not check the
       remaining slaves and generates and error and exits.

       fail This mode produces an error and does not failover when the master is downed. This mode is used to provide periodic health monitoring
       without the failover action taken.

       For all options that permit specifying multiple servers, the options require a comma-separated list of connection parameters in the
       following form (where the password, port, and socket are optional).:

           <*user*>[:<*passwd*>]@<*host*>[:<*port*>][:<*socket*>] or
           <*login-path*>[:<*port*>][:<*socket*>]

       The utility permits users to discover slaves connected to the master. In order to use the discover slaves feature, all slaves must use the
       --report-host and --report-port startup variables to specify the correct hostname and ip port of the slave. If these are missing or report
       the incorrect information, the slaves health may not be reported correctly or the slave may not be listed at all. The discover slaves
       feature ignores any slaves it cannot connect to.

       The discover slaves feature is run automatically on each interval.

       The utility permits the user to specify an external script to execute before and after the switchover and failover commands. The user can
       specify these with the --exec-before and --exec-after options. The return code of the script is used to determine success thus each script
       must report 0 (success) to be considered successful. If a script returns a value other than 0, the result code is presented in an error
       message.

       The utility also permits the user to specify a script to be used for detecting a downed master or an application-level event to trigger
       failover. This can be specified using the --exec-fail-check option. The return code for the script is used to invoke failover. A return
       code of 0 indicates failover should not take place. A return code other than 0 indicates failover should take place. This is checked at the
       start of each interval if a script is supplied. The timeout option is not used in this case and the script is run once at the start of each
       interval.

       The utility permits the user to log all actions taken during the commands. The --log option requires a valid path and file name of the file
       to use for logging operations. The log is active only when this option is specified. The option --log-age specifies the age in days that
       log entries are kept. The default is seven (7) days. Older entries are automatically deleted from the log file (but only if the --log
       option is specified).

       The format of the log file includes the date and time of the event, the level of the event (informational - INFO, warning - WARN, error -
       ERROR, critical failure - CRITICAL), and the message reported by the utility.

       The interface provides the user with a number of options for displaying additional information. The user can choose to see the replication
       health report (default), or choose to see the list of GTIDs in use, the UUIDs in use, and if logging is enabled the contents of the log
       file. Each of these reports is described below.

       health Display the replication health of the topology. This report is the default view for the interface. By default, this includes the
       host name, port, role (MASTER or SLAVE) of the server, state of the server (UP = is connected, WARN = not connected but can ping, DOWN =
       not connected and cannot ping), the GTID_MODE, and health state.

       The master health state is based on the following; if GTID_MODE=ON, the server must have binary log enabled, and there must exist a user
       with the REPLICATE SLAVE privilege.

       The slave health state is based on the following; the IO_THREAD and SQL_THREADS must be running, it must be connected to the master, there
       are no errors, the slave delay for non-gtid enabled scenarios is not more than the threshold provided by the --max-position and the slave
       is reading the correct master log file, and slave delay is not more than the --seconds-behind threshold option.

       At each interval, if the discover slaves option was specified at startup and new slaves are discovered, the health report is refreshed.

       gtid: Display the master's list of executed GTIDs, contents of the GTID variables; @@GLOBAL.GTID_EXECUTED, @@GLOBAL.GTID_PURGED, and
       @@GLOBAL.GTID_OWNED. Thus, the user can toggle through four screens by pressing the 'G' key repeatedly. The display will cycle through all
       four screens restarting after the fourth screen.

       UUID: Display universally unique identifiers (UUIDs) for all servers.

       Log: This option is visible only if the --log option is specified. Show the contents of the log file. This can be helpful to see at a later
       time when failover occurred and the actions or messages recorded at the time.

       The user interface is designed to match the size of the terminal window in which it is run. A refresh option is provided to permit users to
       resize their terminal windows or refresh the display at any time. However, the interface will automatically resize to the terminal window
       on each interval.

       The interface will display the name of the utility, the master's status including binary log file, position, and filters as well as the
       date and time of the next interval event.

       The interface will also permit the user to scroll up or down through a list longer than what the terminal window permits. When a long list
       is presented, the scroll options become enabled. The user can scroll the list up with the up arrow key and down with the down arrow key.

       Use the --verbose option to see additional information in the health report and additional messages during failover.

       The utility supports two modes of operation. The default mode, running as a console, works as described above. An additional mode that
       permits you to run the utility as a daemon is provided for POSIX platforms.

       When run as a daemon, the utility does not have interactivity. However, all events are written to the log file. You can control what is
       written to the log by using the --report-values option.

       To run the utility as a daemon, use the --daemon option. There are three commands that can by used in --daemon option. These include:

       ·   start

           Starts the daemon. The --log option is required.

       ·   stop

           Stops the daemon. If you used the option --pidfile, the value must be the same when starting the daemon.

       ·   restart

           Restarts the daemon. If you used the option --pidfile, the value must be the same when starting the daemon.

       ·   nodetach

           Starts the daemon, but it will not detach the process from the console. The --log option is required.

       The utility supports two modes of operation. The default mode, running as a console, works as described above. An additional mode that
       permits you to run the utility as a daemon is provided for POSIX platforms.

       When run as a daemon, the utility does not have interactivity. However, all events are written to the log file. You can control what is
       written to the log by using the --report-values option.

       To run the utility as a daemon, use the --daemon option. There are three commands that can by used in --daemon option. These include:

       ·   start

           Starts the daemon. The --log option is required.

       ·   stop

           Stops the daemon. The option --pidfile must be the same when starting the daemon.

       ·   restart

           Restarts the daemon. The option --pidfile must be the same when starting the daemon.

       ·   nodetach

           Starts the daemon, but it will not detach the process from the console. The --log option is required.
             OPTIONS

       mysqlfailover accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --candidates=<candidate slave connections>

           Connection information for candidate slave servers for failover in the form: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>]. Valid only with failover command. List multiple slaves in comma-separated list.

       ·   --daemon=<command>

           Run as a daemon. It can be start (start daemon), stop (stop daemon), restart (stop then start the daemon) or nodetach (start but do not
           detach the process). This option is only available for POSIX systems.

       ·   --discover-slaves-login=<user:password>

           At startup, query master for all registered slaves and use the user name and password specified to connect. Supply the user and
           password in the form <user>[:<passwd>] or <login-path>. For example, --discover=joe:secret will use 'joe' as the user and 'secret' as
           the password for each discovered slave.

       ·   --exec-after=<script>

           Name of script to execute after failover or switchover. Script name may include the path.

       ·   --exec-before=<script>

           Name of script to execute before failover or switchover. Script name may include the path.

       ·   --exec-fail-check=<script>

           Name of script to execute on each interval to invoke failover.

       ·   --exec-post-failover=<script>

           Name of script to execute after failover is complete and the utility has refreshed the health report.

       ·   --failover-mode=<mode>, -f <mode>

           Action to take when the master fails. 'auto' = automatically fail to best slave, 'elect' = fail to candidate list or if no candidate
           meets criteria fail, 'fail' = take no action and stop when master fails. Default = 'auto'.

       ·   --force

           Override the registration check on master for multiple instances of the console monitoring the same master. See notes.

       ·   --interval=<seconds>, -i <seconds>

           Interval in seconds for polling the master for failure and reporting health. Default = 15 seconds. Minimum is 5 seconds.

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

       ·   --pedantic, -p

           Used to stop failover if some inconsistencies are found (e.g. errant transactions on slaves or SQL thread errors) during servers
           checks. By default, the utility will only issue warnings if issues are found when checking slaves status during failover and will
           continue its execution unless this option is specified.

       ·   --pidfile=<pidfile>

           Pidfile for running mysqlfailover as a daemon. This file contains the PID (process identifier), that uniquely identify a process. It is
           needed to identify and control the process forked by mysqlfailover.

       ·   --ping=<number>

           Number of ping attempts for detecting downed server. Note: on some platforms this is the same as number of seconds to wait for ping to
           return. Default is 3 seconds.

       ·   --report-values=<report_values>

           Report values used in mysqlfailover running as a daemon. It can be health, gtid or uuid. Multiple values can be used separated by
           commas.

           ·   health

               Display the replication health of the topology.

           ·   gtid

               Display the master's list of executed GTIDs, contents of the GTID variables; @@GLOBAL.GTID_EXECUTED, @@GLOBAL.GTID_PURGED and
               @@GLOBAL.GTID_OWNED.

           ·   uuid

               Display universally unique identifiers (UUIDs) for all servers.

           Default = health.

       ·   --rpl-user=:<replication_user>

           The user and password for the replication user requirement , in the form: <user>[:<password>] or <login-path>. E.g. rpl:passwd

           Default = None.

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
           master.

           Default = 3.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       The login user must have the appropriate permissions to execute SHOW SLAVE STATUS, SHOW MASTER STATUS, and SHOW VARIABLES on the
       appropriate servers as well as grant the REPLICATE SLAVE privilege. Different permission are required by the failover utility to run
       successfully for master and slaves. In particular, users connectioned to slaves and candidates require SUPER, GRANT OPTION, REPLICATION
       SLAVE, and RELOAD privileges.

       In addition, the user connected to the master requires DROP, CREATE, INSERT and SELECT privileges to register the failover console. The
       utility checks permissions for the master, slaves, and candidates at startup.

       At startup, the console will attempt to register itself with the master. If another console is already registered, and the failover mode is
       auto or elect, the console will be blocked from running failover. When a console quits, it deregisters itself from the master. If this
       process is broken, the user may override the registration check by using the --force option.

       Mixing IP and hostnames is not recommended. The replication-specific utilities will attempt to compare hostnames and IP addresses as
       aliases for checking slave connectivity to the master. However, if your installation does not support reverse name lookup, the comparison
       could fail. Without the ability to do a reverse name lookup, the replication utilities could report a false negative that the slave is
       (not) connected to the master.

       For example, if you setup replication using MASTER_HOST=ubuntu.net on the slave and later connect to the slave with mysqlrplcheck and have
       the master specified as --master=192.168.0.6 using the valid IP address for ubuntu.net, you must have the ability to do a reverse name
       lookup to compare the IP (192.168.0.6) and the hostname (ubuntu.net) to determine if they are the same machine.

       Similarly, in order to avoid issues mixing local IP '127.0.0.1' with 'localhost', all the addresses '127.0.0.1' will be internally
       converted to 'localhost' by the utility. Nevertheless, It is best to use the actual hostname of the master when connecting or setting up
       replication.

       The utility will check to see if the slaves are using the option --master-info-repository=TABLE. If they are not, the utility will stop
       with an error.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).

       The console creates a special table in the mysql database that is used to keep track of which instance is communicating with the master. If
       you use the --force option, the console will remove the rows in this table. The table is constructed with:

           CREATE TABLE IF NOT EXISTS mysql.failover_console (host char(30), port char(10))

       When the console starts, a row is inserted containing the hostname and port of the master. On startup, if a row matches these values, the
       console will not start. If you use the --force option, the row is deleted.

       When running the utility using the --daemon option with nodetach the --pidfile option can be omitted, will be ignored if used.

       When running the utility using the --daemon option with nodetach the --pidfile option can be omitted, will be ignored if used.
             EXAMPLES

       To launch the utility, you must specify at a minimum the --master option and either the --discover-slaves-login option or the --slaves
       option. The option: option can be used in conjunction with the --slaves option to specify a list of known slaves (or slaves that do not
       report their host and ip) and to discover any other slaves connected to the master.

       An example of the user interface and some of the report views are shown in the following examples.

           Note
           The "GTID Executed Set" will display the first GTID listed in the SHOW MASTER STATUS view. If there are multiple GTIDs listed, the
           utility shall display [...]  to indicate there are additional GTIDs to view. You can view the complete list of GTIDs on the GTID
           display screens.

       The default interface will display the replication health report like the following. In this example the log file is enabled. A sample
       startup command is shown below:

           $ mysqlfailover --master=root@localhost:3331 --discover-slaves-login=root --log=log.txt
           MySQL Replication Monitor and Failover Utility
           Failover Mode = auto     Next Interval = Mon Mar 19 15:56:03 2012
           Master Information
           ------------------
           Binary Log File   Position  Binlog_Do_DB  Binlog_Ignore_DB
           mysql-bin.000001  571
           GTID Executed Set
           2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7 [...]
           Replication Health Status
           +------------+-------+---------+--------+------------+---------+
           | host       | port  | role    | state  | gtid_mode  | health  |
           +------------+-------+---------+--------+------------+---------+
           | localhost  | 3331  | MASTER  | UP     | ON         | OK      |
           | localhost  | 3332  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3333  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3334  | SLAVE   | UP     | ON         | OK      |
           +------------+-------+---------+--------+------------+---------+
           Q-quit R-refresh H-health G-GTID Lists U-UUIDs L-log entries

       Pressing the 'q' key will exit the utility. Pressing the 'r' key will refresh the current display. Pressing the 'h' key will return to the
       replication health report.

       If the user presses the 'g' key, the gtid report is shown like the following. The first page shown is the master's executed GTID set:

           MySQL Replication Monitor and Failover Utility
           Failover Mode = auto     Next Interval = Mon Mar 19 15:59:33 2012
           Master Information
           ------------------
           Binary Log File   Position  Binlog_Do_DB  Binlog_Ignore_DB
           mysql-bin.000001  571
           GTID Executed Set
           2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7 [...]
           Master GTID Executed Set
           +-------------------------------------------+
           | gtid                                      |
           +-------------------------------------------+
           | 2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7  |
           | 5503D37E-2DB2-11E2-A781-8077D4C14B33:1-3  |
           +-------------------------------------------+
           Q-quit R-refresh H-health G-GTID Lists U-UUIDs L-log entries Up|Down-scroll

       If the user continues to press the 'g' key, the display will cycle through the three gtid lists.

       If the list is longer than the screen permits as shown in the example above, the scroll up and down help is also shown. In this case, if
       the user presses the down arrow, the list will scroll down.

       If the user presses the 'u' key, the list of UUIDs used in the topology are shown.:

           MySQL Replication Monitor and Failover Utility
           Failover Mode = auto     Next Interval = Mon Mar 19 16:02:34 2012
           Master Information
           ------------------
           Binary Log File   Position  Binlog_Do_DB  Binlog_Ignore_DB
           mysql-bin.000001  571
           GTID Executed Set
           2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7 [...]
           UUIDs
           +------------+-------+---------+---------------------------------------+
           | host       | port  | role    | uuid                                  |
           +------------+-------+---------+---------------------------------------+
           | localhost  | 3331  | MASTER  | 55c65a00-71fd-11e1-9f80-ac64ef85c961  |
           | localhost  | 3332  | SLAVE   | 5dd30888-71fd-11e1-9f80-dc242138b7ec  |
           | localhost  | 3333  | SLAVE   | 65ccbb38-71fd-11e1-9f80-bda8146bdb0a  |
           | localhost  | 3334  | SLAVE   | 6dd6abf4-71fd-11e1-9f80-d406a0117519  |
           +------------+-------+---------+---------------------------------------+
           Q-quit R-refresh H-health G-GTID Lists U-UUIDs L-log entries

       If, once the master is detected as down and failover mode is auto or elect and there are viable candidate slaves, the failover feature will
       engage automatically and the user will see the failover messages appear. When failover is complete, the interface returns to monitoring
       replication health after 5 seconds. The following shows an example of failover occurring.:

           Failover starting...
           # Candidate slave localhost:3332 will become the new master.
           # Preparing candidate for failover.
           # Creating replication user if it does not exist.
           # Stopping slaves.
           # Performing STOP on all slaves.
           # Switching slaves to new master.
           # Starting slaves.
           # Performing START on all slaves.
           # Checking slaves for errors.
           # Failover complete.
           # Discovering slaves for master at localhost:3332
           Failover console will restart in 5 seconds.

       After the failover event, the new topology is shown in the replication health report.:

           MySQL Replication Monitor and Failover Utility
           Failover Mode = auto     Next Interval = Mon Mar 19 16:05:12 2012
           Master Information
           ------------------
           Binary Log File   Position  Binlog_Do_DB  Binlog_Ignore_DB
           mysql-bin.000001  1117
           GTID Executed Set
           2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7 [...]
           UUIDs
           +------------+-------+---------+--------+------------+---------+
           | host       | port  | role    | state  | gtid_mode  | health  |
           +------------+-------+---------+--------+------------+---------+
           | localhost  | 3332  | MASTER  | UP     | ON         | OK      |
           | localhost  | 3333  | SLAVE   | UP     | ON         | OK      |
           | localhost  | 3334  | SLAVE   | UP     | ON         | OK      |
           +------------+-------+---------+--------+------------+---------+
           Q-quit R-refresh H-health G-GTID Lists U-UUIDs L-log entries

       If the user presses the 'l' key and the --log option was specified, the interface will show the entries in the log file. Note: example
       truncated for space allowance.:

           MySQL Replication Monitor and Failover Utility
           Failover Mode = auto     Next Interval = Mon Mar 19 16:06:13 2012
           Master Information
           ------------------
           Binary Log File   Position  Binlog_Do_DB  Binlog_Ignore_DB
           mysql-bin.000001  1117
           GTID Executed Set
           2A67DE00-2DA1-11E2-A711-00764F2BE90F:1-7 [...]
           Log File
           +-------------------------+----------------------------------------- ... --+
           | Date                    | Entry                                    ...   |
           +-------------------------+----------------------------------------- ... --+
           | 2012-03-19 15:55:33 PM  | INFO Failover console started.           ...   |
           | 2012-03-19 15:55:33 PM  | INFO Failover mode = auto.               ...   |
           | 2012-03-19 15:55:33 PM  | INFO Getting health for master: localhos ...   |
           | 2012-03-19 15:55:33 PM  | INFO Master status: binlog: mysql-bin.00 ...   |
           +-------------------------+----------------------------------------- ... --+
           Q-quit R-refresh H-health G-GTID Lists U-UUIDs L-log entries Up|Down-scroll\

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                    MYSQLFAILOVER(1)
