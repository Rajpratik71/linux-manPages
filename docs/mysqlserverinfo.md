MYSQLSERVERINFO                                                   MySQL Utilities                                                  MYSQLSERVERINFO

NAME
       mysqlserverinfo - Display Common Diagnostic Information from a Server

SYNOPSIS
       mysqlserverinfo [options] db1 [:db2] ...

DESCRIPTION
       This utility displays critical information about a server for use in diagnosing problems. The information displayed includes the following:

       ·   Server connection information

       ·   Server version number

       ·   Data directory path name

       ·   Base directory path name

       ·   Plugin directory path name

       ·   Configuration file location and name

       ·   Current binary log coordinates (file name and position)

       ·   Current relay log coordinates (file name and position)

       This utility can be used to see the diagnostic information for servers that are running or offline. If you want to see information about an
       offline server, the utility starts the server in read-only mode. In this case, you must specify the --basedir, --datadir, and --start
       options to prevent the utility from starting an offline server accidentally. Note: Be sure to consider the ramifications of starting an
       offline server on the error and similar logs. It is best to save this information prior to running this utility.

       To specify how to display output, use one of the following values with the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.

       To turn off the headers for csv or tab display format, specify the --no-headers option.

       To see the common default settings for the local server's configuration file, use the --show-defaults option. This option reads the
       configuration file on the machine where the utility is run, not the machine for the host that the --server option specifies.

       To run the utility against several servers, specify the --server option multiple times. In this case, the utility attempts to connect to
       each server and read the information.

       To see the MySQL servers running on the local machine, use the --show-servers option. This shows all the servers with their process ID and
       data directory. On Windows, the utility shows only the process ID and port.
             OPTIONS

       mysqlserverinfo accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --basedir=<basedir>

           The base directory for the server. This option is required for starting an offline server.

           Is also used to access server tools, such as my_print_defaults that is required to read the login-path values from the login
           configuration file (.mylogin.cnf).

       ·   --datadir=<datadir>

           The data directory for the server. This option is required for starting an offline server.

       ·   --format=<format>, -f<format>

           Specify the output display format. Permitted format values are grid, csv, tab, and vertical. The default is grid.

       ·   --no-headers, -h

           Do not display column headers. This option applies only for csv and tab output.

       ·   --port-range=<start:end>

           The port range to check for finding running servers. This option applies only to Windows and is ignored unless --show-servers is given.
           The default range is 3306:3333.

       ·   --server=<server>

           Connection information for a server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or <login-path>[:<port>][:<socket>].
           Use this option multiple times to see information for multiple servers.

       ·   --show-defaults, -d

           Display default settings for mysqld from the local configuration file. It uses my_print_defaults to obtain the options.

       ·   --show-servers

           Display information about servers running on the local host. The utility examines the host process list to determine which servers are
           running.

       ·   --start, -s

           Start the server in read-only mode if it is offline. With this option, you must also give the --basedir and --datadir options.

       ·   --start-timeout

           Number of seconds to wait for the server to be online when started in read-only mode using the --start option. The default value is 10
           seconds.

           The --start-timeout option is available as of MySQL Utilities 1.2.4 / 1.3.3.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.

       For the --format option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --format=g specifies the grid format. An error occurs if a prefix matches more than one valid value.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       To display the server information for the local server and the settings for mysqld in the configuration file with the output in a vertical
       list, use this command:

           $ mysqlserverinfo --server=root:pass@localhost -d --format=vertical
           # Source on localhost: ... connected.
           *************************       1. row *************************
                    server: localhost:3306
                   version: 5.1.50-log
                   datadir: /usr/local/mysql/data/
                   basedir: /usr/local/mysql-5.1.50-osx10.6-x86_64/
                plugin_dir: /usr/local/mysql-5.1.50-osx10.6-x86_64/lib/plugin
               config_file: /etc/my.cnf
                binary_log: my_log.000068
            binary_log_pos: 212383
                 relay_log: None
             relay_log_pos: None
           1 rows.
           Defaults for server localhost:3306
             --port=3306
             --basedir=/usr/local/mysql
             --datadir=/usr/local/mysql/data
             --server_id=5
             --log-bin=my_log
             --general_log
             --slow_query_log
             --innodb_data_file_path=ibdata1:778M;ibdata2:50M:autoextend
           #...done.

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                     MYSQLSERVERINFO
