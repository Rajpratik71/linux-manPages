MYSQLDBCOPY(1)                                                    MySQL Utilities                                                   MYSQLDBCOPY(1)

NAME
       mysqldbcopy - Copy Database Objects Between Servers

SYNOPSIS
       mysqldbcopy [options] db_name [:new_db_name]

DESCRIPTION
       This utility copies a database on a source server to a database on a destination server. If the source and destination servers are
       different, the database names can be the same or different. If the source and destination servers are the same, the database names must be
       different.

       The utility accepts one or more database pairs on the command line. To name a database pair, use db_name:new_db_name syntax to specify the
       source and destination names explicitly. If the source and destination database names are the same, db_name can be used as shorthand for
       db_name:db_name.

       By default, the operation copies all objects (tables, views, triggers, events, procedures, functions, and database-level grants) and data
       to the destination server. There are options to turn off copying any or all of the objects as well as not copying the data.

       To exclude specific objects by name, use the --exclude option with a name in db.*obj* format, or you can supply a search pattern. For
       example, --exclude=db1.trig1 excludes the single trigger and --exclude=trig_ excludes all objects from all databases having a name that
       begins with trig and has a following character.

       By default, the utility creates each table on the destination server using the same storage engine as the original table. To override this
       and specify the storage engine to use for all tables created on the destination server, use the --new-storage-engine option. If the
       destination server supports the new engine, all tables use that engine.

       To specify the storage engine to use for tables for which the destination server does not support the original storage engine on the source
       server, use the --default-storage-engine option.

       The --new-storage-engine option takes precedence over --default-storage-engine if both are given.

       If the --new-storage-engine or --default-storage-engine option is given and the destination server does not support the specified storage
       engine, a warning is issued and the server's default storage engine setting is used instead.

       By default, the operation uses a consistent snapshot to read the source databases. To change the locking mode, use the --locking option
       with a locking type value. Use a value of no-locks to turn off locking altogether or lock-all to use only table locks. The default value is
       snapshot. Additionally, the utility uses WRITE locks to lock the destination tables during the copy.

       You can include replication statements for copying data among a master and slave or between slaves. The --rpl option permits you to select
       from the following replication statements to include in the export.

       ·   master

           Include the CHANGE MASTER statement to start a new slave with the current server acting as the master. This executes the appropriate
           STOP and START slave statements. The STOP SLAVE statement is executed at the start of the copy and the CHANGE MASTER followed by the
           START SLAVE statements are executed after the copy.

       ·   slave

           Include the CHANGE MASTER statement to start a new slave using the current server's master information. This executes the appropriate
           STOP and START slave statements. The STOP SLAVE statement is executed at the start of the copy and the CHANGE MASTER followed by the
           START SLAVE statements follow the copy.

       To include the replication user in the CHANGE MASTER statement, use the --rpl-user option to specify the user and password. If this option
       is omitted, the utility attempts to identify the replication user. In the event that there are multiple candidates or the user requires a
       password, the utility aborts with an error.

       If you attempt to copy databases on a server with GTIDs enabled (GTID_MODE = ON), a warning will be generated if the copy does not include
       all databases. This is because the GTID statements generated include the GTIDs for all databases and not only those databases in the
       export.

       The utility will also generate a warning if you copy databases on a GTID enabled server but use the --skip-gtid option.

       To make the most use of GTIDs, you should copy all of the databases on the server with the --all option.
             OPTIONS

       mysqldbcopy accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --default-storage-engine=<def_engine>

           The engine to use for tables if the destination server does not support the original storage engine on the source server.

       ·   --destination=<destination>

           Connection information for the destination server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>] (where <passwd> is optional and either <port> or <socket> must be provided).

       ·   --exclude=<exclude>, -x<exclude>

           Exclude one or more objects from the operation using either a specific name such as db1.t1 or a search pattern. Use this option
           multiple times to specify multiple exclusions. By default, patterns use LIKE matching. With the --regexp option, patterns use REGEXP
           matching.

           This option does not apply to grants.

       ·   --force

           Drop each database to be copied if exists before copying anything into it. Without this option, an error occurs if you attempt to copy
           objects into an existing database.

       ·   --locking=<locking>

           Choose the lock type for the operation. Permitted lock values are no-locks (do not use any table locks), lock-all (use table locks but
           no transaction and no consistent read), and snapshot (consistent read using a single transaction). The default is snapshot.

       ·   --new-storage-engine=<new_engine>

           The engine to use for all tables created on the destination server.

       ·   --quiet, -q

           Turn off all messages for quiet execution.

       ·   --regexp, --basic-regexp, -G

           Perform pattern matches using the REGEXP operator. The default is to use LIKE for matching.

       ·   --rpl=<dump_option>, --replication=<dump_option>

           Include replication information. Permitted values are master (include the CHANGE MASTER statement using the source server as the
           master), slave (include the CHANGE MASTER statement using the destination server's master information), and both (include the master
           and slave options where applicable).

       ·   --rpl-user=<replication_user>

           The user and password for the replication user requirement in the form: <user>[:<password>] or <login-path>. E.g. rpl:passwd Default =
           None.

       ·   l --skip-gtid

           Skip creation and execution of GTID statements during the copy operation.

       ·   --all

           Copy all of the databases on the server.

       ·   --skip=<objects>

           Specify objects to skip in the operation as a comma-separated list (no spaces). Permitted values are CREATE_DB, DATA, EVENTS,
           FUNCTIONS, GRANTS, PROCEDURES, TABLES, TRIGGERS, and VIEWS.

       ·   --source=<source>

           Connection information for the destination server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[::<port>][::<socket>] (where <passwd> is optional and either <port> or <socket> must be provided).

       ·   --threads

           Use multiple threads for cross-server copy. The default is 1.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       You must provide connection parameters (user, host, password, and so forth) for an account that has the appropriate privileges to access
       all objects in the operation.

       To copy all objects from a source, the user must have these privileges: SELECT and SHOW VIEW for the database, and SELECT for the mysql
       database.

       To copy all objects to a destination, the user must have these privileges: CREATE for the database, SUPER (when binary logging is enabled)
       for procedures and functions, and GRANT OPTION to copy grants.

       Actual privileges required may differ from installation to installation depending on the security privileges present and whether the
       database contains certain objects such as views or events and whether binary logging is enabled.

       The --new-storage-engine and --default-storage-engine options apply to all destination tables in the operation.

       Some option combinations may result in errors during the operation. For example, eliminating tables but not views may result in an error a
       the view is copied.

       The --rpl option is not valid for copying databases on the same server. An error will be generated.

       When copying data and including the GTID commands, you may encounter an error similar to "GTID_PURGED can only be set when GTID_EXECUTED is
       empty". This occurs because the destination server is not in a clean replication state. To aleviate this problem, you can issue a "RESET
       MASTER" command on the destination prior to executing the copy.

       Cloning databases that contain foreign key constraints does not change the constraint in the cloned table. For example, if table db1.t1 has
       a foreign key constraint on table db1.t2, when db1 is cloned to db2, table db2.t1 will have a foreign key constraint on db1.t2.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).

       If any database identifier specified as an argument contains special characters or is a reserved word, then it must be appropriately quoted
       with backticks (`). In turn, names quoted with backticks must also be quoted with single or double quotes depending on the operating
       system, i.e. (") in Windows or (') in non-Windows systems, in order for the utilities to read backtick quoted identifiers as a single
       argument. For example, to copy a database with the name weird`db.name with other:weird`db.name, the database pair must be specified using
       the following syntax (in non-Windows): '`weird``db.name`:`other:weird``db.name`'.
             EXAMPLES

       The following example demonstrates how to use the utility to copy a database named util_test to a new database named util_test_copy on the
       same server:

           $ mysqldbcopy \
             --source=root:pass@localhost:3310:/test123/mysql.sock \
             --destination=root:pass@localhost:3310:/test123/mysql.sock \
             util_test:util_test_copy
           # Source on localhost: ... connected.
           # Destination on localhost: ... connected.
           # Copying database util_test renamed as util_test_copy
           # Copying TABLE util_test.t1
           # Copying table data.
           # Copying TABLE util_test.t2
           # Copying table data.
           # Copying TABLE util_test.t3
           # Copying table data.
           # Copying TABLE util_test.t4
           # Copying table data.
           # Copying VIEW util_test.v1
           # Copying TRIGGER util_test.trg
           # Copying PROCEDURE util_test.p1
           # Copying FUNCTION util_test.f1
           # Copying EVENT util_test.e1
           # Copying GRANTS from util_test
           #...done.

       If the database to be copied does not contain only InnoDB tables and you want to ensure data integrity of the copied data by locking the
       tables during the read step, add a --locking=lock-all option to the command:

           $ mysqldbcopy \
             --source=root:pass@localhost:3310:/test123/mysql.sock \
             --destination=root:pass@localhost:3310:/test123/mysql.sock \
             util_test:util_test_copy --locking=lock-all
           # Source on localhost: ... connected.
           # Destination on localhost: ... connected.
           # Copying database util_test renamed as util_test_copy
           # Copying TABLE util_test.t1
           # Copying table data.
           # Copying TABLE util_test.t2
           # Copying table data.
           # Copying TABLE util_test.t3
           # Copying table data.
           # Copying TABLE util_test.t4
           # Copying table data.
           # Copying VIEW util_test.v1
           # Copying TRIGGER util_test.trg
           # Copying PROCEDURE util_test.p1
           # Copying FUNCTION util_test.f1
           # Copying EVENT util_test.e1
           # Copying GRANTS from util_test
           #...done.

       To copy one or more databases from a master to a slave, you can use the following command to copy the databases. Use the master as the
       source and the slave as the destination:

           $ mysqldbcopy --source=root@localhost:3310 \
             --destination=root@localhost:3311 test123 --rpl=master \
             --rpl-user=rpl
           # Source on localhost: ... connected.
           # Destination on localhost: ... connected.
           # Source on localhost: ... connected.
           # Stopping slave
           # Copying database test123
           # Copying TABLE test123.t1
           # Copying data for TABLE test123.t1
           # Connecting to the current server as master
           # Starting slave
           #...done.

       To copy a database from one slave to another attached to the same master, you can use the following command using the slave with the
       database to be copied as the source and the slave where the database needs to copied to as the destination:

           $ mysqldbcopy --source=root@localhost:3311 \
             --destination=root@localhost:3312 test123 --rpl=slave \
             --rpl-user=rpl
           # Source on localhost: ... connected.
           # Destination on localhost: ... connected.
           # Source on localhost: ... connected.
           # Stopping slave
           # Copying database test123
           # Copying TABLE test123.t1
           # Copying data for TABLE test123.t1
           # Connecting to the current server's master
           # Starting slave
           #...done.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                      MYSQLDBCOPY(1)
