MYSQLREPLICATE(1)                                                 MySQL Utilities                                                MYSQLREPLICATE(1)

NAME
       mysqlreplicate - Set Up and Start Replication Between Two Servers

SYNOPSIS
       mysqlreplicate [options]

DESCRIPTION
       This utility permits an administrator to start replication from one server (the master) to another (the slave). The user provides login
       information for the slave and connection information for connecting to the master. It is also possible to specify a database to be used to
       test replication.

       The utility reports conditions where the storage engines on the master and the slave differ. It also reports a warning if the InnoDB
       storage engine differs on the master and slave. For InnoDB to be the same, both servers must be running the same “type” of InnoDB (built-in
       or the InnoDB Plugin), and InnoDB on both servers must have the same major and minor version numbers and enabled state.

       By default, the utility issues warnings for mismatches between the sets of storage engines, the default storage engine, and the InnoDB
       storage engine. To produce errors instead, use the --pedantic option, which requires storage engines to be the same on the master and
       slave.

       The -vv option displays any discrepancies between the storage engines and InnoDB values, with or without the --pedantic option.

       Replication can be started using one of the following strategies.

       ·   Start from the current position (default)

           Start replication from the current master binary log file and position. The utility uses the SHOW MASTER STATUS statement to retrieve
           this information.

       ·   Start from the beginning

           Start replication from the first event recorded in the master binary log. To do this, use the --start-from-beginning option.

       ·   Start from a binary log file

           Start replication from the first event in a specific master binary log file. To do this, use the --master-log-file option.

       ·   Start from a specific event

           Start replication from specific event coordinates (specific binary log file and position). To do this, use the --master-log-file and
           --master-log-pos options.
             OPTIONS

       mysqlreplicate accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --master=<master>

           Connection information for the master server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --master-log-file=<master_log_file>

           Begin replication from the beginning of this master log file.

       ·   --master-log-pos=<master_log_pos>

           Begin replication from this position in the master log file. This option is not valid unless --master-log-file is given.

       ·   --pedantic, -p

           Fail if both servers do not have the same set of storage engines, the same default storage engine, and the same InnoDB storage engine.

       ·   --rpl-user=<replication_user>

           The user and password for the replication user, in the format: <user>[:<password>] or <login-path>. The default is rpl:rpl.

       ·   --slave=<slave>

           Connection information for the slave server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --start-from-beginning, -b

           Start replication at the beginning of events logged in the master binary log. This option is not valid unless both --master-log-file
           and --master-log-pos are given.

       ·   --test-db=<test_database>

           The database name to use for testing the replication setup. If this option is not given, no testing is done, only error checking.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       The login user for the master server must have the appropriate permissions to grant access to all databases and the ability to create a
       user account. For example, the user account used to connect to the master must have the WITH GRANT OPTION privilege.

       The server IDs on the master and slave must be nonzero and unique. The utility reports an error if the server ID is 0 on either server or
       the same on the master and slave. Set these values before starting this utility.

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

       To set up replication between two MySQL instances running on different ports of the same host using the default settings, use this command:

           $ mysqlreplicate --master=root@localhost:3306 \
             --slave=root@localhost:3307 --rpl-user=rpl:rpl
           # master on localhost: ... connected.
           # slave on localhost: ... connected.
           # Checking for binary logging on master...
           # Setting up replication...
           # ...done.

       The following command uses --pedantic to ensure that replication between the master and slave is successful if and only if both servers
       have the same storage engines available, the same default storage engine, and the same InnoDB storage engine:

           $ mysqlreplicate --master=root@localhost:3306 \
             --slave=root@localhost:3307 --rpl-user=rpl:rpl -vv --pedantic
           # master on localhost: ... connected.
           # slave on localhost: ... connected.
           # master id = 2
           #  slave id = 99
           # Checking InnoDB statistics for type and version conflicts.
           # Checking storage engines...
           # Checking for binary logging on master...
           # Setting up replication...
           # Flushing tables on master with read lock...
           # Connecting slave to master...
           # CHANGE MASTER TO MASTER_HOST = [...omitted...]
           # Starting slave...
           # status: Waiting for master to send event
           # error: 0:
           # Unlocking tables on master...
           # ...done.

       The following command starts replication from the current position of the master (which is the default):

           $ mysqlreplicate --master=root@localhost:3306 \
                --slave=root@localhost:3307 --rpl-user=rpl:rpl
            # master on localhost: ... connected.
            # slave on localhost: ... connected.
            # Checking for binary logging on master...
            # Setting up replication...
            # ...done.

       The following command starts replication from the beginning of recorded events on the master:

           $ mysqlreplicate --master=root@localhost:3306 \
                --slave=root@localhost:3307 --rpl-user=rpl:rpl \
                --start-from-beginning
            # master on localhost: ... connected.
            # slave on localhost: ... connected.
            # Checking for binary logging on master...
            # Setting up replication...
            # ...done.

       The following command starts replication from the beginning of a specific master binary log file:

           $ mysqlreplicate --master=root@localhost:3306 \
                --slave=root@localhost:3307 --rpl-user=rpl:rpl \
                --master-log-file=my_log.000003
            # master on localhost: ... connected.
            # slave on localhost: ... connected.
            # Checking for binary logging on master...
            # Setting up replication...
            # ...done.

       The following command starts replication from specific master binary log coordinates (specific log file and position):

           $ mysqlreplicate --master=root@localhost:3306 \
                --slave=root@localhost:3307 --rpl-user=rpl:rpl \
                --master-log-file=my_log.000001 --master-log-pos=96
            # master on localhost: ... connected.
            # slave on localhost: ... connected.
            # Checking for binary logging on master...
            # Setting up replication...
            # ...done.

             RECOMMENDATIONS

       You should set read_only=1 in the my.cnf file for the slave to ensure that no accidental data changes, such as INSERT, DELETE, UPDATE, and
       so forth, are permitted on the slave other than those produced by events read from the master.

       Use the --pedantic and -vv options for setting up replication on production servers to avoid possible problems with differing storage
       engines.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                   MYSQLREPLICATE(1)
