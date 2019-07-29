MYSQLSERVERCLONE()                                                                                                              MYSQLSERVERCLONE()

NAME
       mysqlserverclone - Clone Existing Server to Create New Server

SYNOPSIS
       mysqlserverclone [options]

DESCRIPTION
       This utility permits an administrator to clone an existing MySQL server instance to start a new server instance on the same host. The
       utility creates a new datadir (--new-data), and starts the server with a socket file. You can optionally add a password for the login user
       account on the new instance.

       If the user does not have read and write access to the folder specified by the --new-data option, the utility shall issue an error.

       Similarly, if the folder specified by
        --new-data exists and is not empty, the utility will not delete the folder and will issue an error message. Users must specify the
       --delete-data option to permit the utility to remove the folder prior to starting the cloned server.
             OPTIONS

       mysqlserverclone accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --delete-data

           Delete the folder specified by --new-data if it exists and is not empty.

       ·   --mysqld=<options>

           Additional options for mysqld. To specify multiple options, separate them by spaces. Use appropriate quoting as necessary. For example,
           to specify --log-bin=binlog and --general-log-file="mylogfile", use:

               --mysqld="--log-bin=binlog --general-log-file='my log file'"

       ·   --new-data=<path_to_new_datadir>

           The full path name of the location of the data directory for the new server instance. If the directory does not exist, the utility will
           create it.

       ·   --new-id=<server_id>

           The server_id value for the new server instance. The default is 2.

       ·   --new-port=<port>

           The port number for the new server instance. The default is 3307.

       ·   --quiet, -q

           Turn off all messages for quiet execution.

       ·   --root-password=<password>

           The password for the root user of the new server instance.

       ·   --server=<source>

           Connection information for the server to be cloned in <user>[:<passwd>]@<host>[:<port>][:<socket>] format.

       ·   --start-timeout=<timeout_in_seconds>

           Number of seconds to wait for server to start. Default = 10 seconds.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.

       ·   --write-command=<file_name>, -w<file_name>

           Path name of file in which to write the command used to launch the new server instance.
             EXAMPLES

       The following command demonstrates how to create a new instance of a running server, set the root user password and enable binary logging:

           $ mkdir /source/test123
           $ mysqlserverclone --server=root:pass@localhost \
             --new-data=/Users/cbell/source/test123 --new-port=3310 \
             --root-password=pass --mysqld=--log-bin=mysql-bin
           # Cloning the MySQL server running on localhost.
           # Creating new data directory...
           # Configuring new instance...
           # Locating mysql tools...
           # Setting up empty database and mysql tables...
           # Starting new instance of the server...
           # Testing connection to new instance...
           # Success!
           # Setting the root password...
           # ...done.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

                                                                                                                                MYSQLSERVERCLONE()
