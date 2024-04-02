MYSQLPROCGREP(1)                                                  MySQL Utilities                                                 MYSQLPROCGREP(1)

NAME
       mysqlprocgrep - Search Server Process Lists

SYNOPSIS
       mysqlprocgrep [options]

DESCRIPTION
       This utility scans the process lists for the servers specified using instances of the --server option and selects those that match the
       conditions specified using the --age and --match-xxx options. For a process to match, all conditions given must match. The utility then
       either prints the selected processes (the default) or executes certain actions on them.

       If no --age or --match-xxx options are given, the utility selects all processes.

       The --match-xxx options correspond to the columns in the INFORMATION_SCHEMA.PROCESSLIST table. For example, --match-command specifies a
       matching condition for PROCESSLIST.COMMAND column values. There is no --match-time option. To specify a condition based on process time,
       use --age.

       Processes that can be seen and killed are subject to whether the account used to connect to the server has the PROCESS and SUPER
       privileges. Without PROCESS, the account cannot see processes belonging to other accounts Without SUPER, the account cannot kill processes
       belonging to other accounts

       To specify how to display output, use one of the following values with the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.
             Options

       mysqlprocgrep accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --age=<time>

           Select only processes that have been in the current state more than a given time. The time value can be specified in two formats:
           either using the hh:mm:ss format, with hours and minutes optional, or as a sequence of numbers with a suffix giving the period size.

           The permitted suffixes are s (second), m (minute), h (hour), d (day), and w (week). For example, 4h15m mean 4 hours and 15 minutes.

           For both formats, the specification can optionally be preceded by + or -, where + means older than the given time, and - means younger
           than the given time.

       ·   --format=<format>, -f<format>

           Specify the output display format. Permitted format values are grid, csv, tab, and vertical. The default is grid.

       ·   --kill-connection

           Kill the connection for all matching processes (like the KILL CONNECTION statement).

       ·   --kill-query

           Kill the query for all matching processes (like the KILL QUERY statement).

       ·   --match-command=<pattern>

           Match all processes where the Command field matches the pattern.

       ·   --match-db=<pattern>

           Match all processes where the Db field matches the pattern.

       ·   --match-host=<pattern>

           Match all processes where the Host field matches the pattern.

       ·   --match-info=<pattern>

           Match all processes where the Info field matches the pattern.

       ·   --match-state=<pattern>

           Match all processes where the State field matches the pattern.

       ·   --match-user=<pattern>

           Match all processes where the User field matches the pattern.

       ·   --print

           Print information about the matching processes. This is the default if no --kill-connection or --kill-query option is given. If a kill
           option is given, --print prints information about the processes before killing them.

       ·   --regexp, --basic-regexp, -G

           Perform pattern matches using the REGEXP operator. The default is to use LIKE for matching. This affects the --match-xxx options.

       ·   --server=<source>

           Connection information for a server to search in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>]. Use this option multiple times to search multiple servers.

       ·   --sql, --print-sql, -Q

           Instead of displaying the selected processes, emit the SELECT statement that retrieves information about them. If the --kill-connection
           or --kill-query option is given, the utility generates a stored procedure named kill_processes() for killing the queries rather than a
           SELECT statement.

       ·   --sql-body

           Like --sql, but produces the output as the body of a stored procedure without the CREATE PROCEDURE part of the definition. This could
           be used, for example, to generate an event for the server Event Manager.

           When used with a kill option, code for killing the matching queries is generated. Note that it is not possible to execute the emitted
           code unless it is put in a stored routine, event, or trigger. For example, the following code could be generated to kill all idle
           connections for user www-data:

               $ mysqlprocgrep --kill-connection --sql-body \
               >   --match-user=www-data --match-state=sleep
               DECLARE kill_done INT;
               DECLARE kill_cursor CURSOR FOR
                 SELECT
                       Id, User, Host, Db, Command, Time, State, Info
                     FROM
                       INFORMATION_SCHEMA.PROCESSLIST
                     WHERE
                         user LIKE 'www-data'
                       AND
                         State LIKE 'sleep'
               OPEN kill_cursor;
               BEGIN
                  DECLARE id BIGINT;
                  DECLARE EXIT HANDLER FOR NOT FOUND SET kill_done = 1;
                  kill_loop: LOOP
                     FETCH kill_cursor INTO id;
                     KILL CONNECTION id;
                  END LOOP kill_loop;
               END;
               CLOSE kill_cursor;

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       For the --format option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --format=g specifies the grid format. An error occurs if a prefix matches more than one valid value.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       For each example, assume that the root user on localhost has sufficient privileges to kill queries and connections.

       Kill all queries created by user mats that are younger than 1 minute:

           mysqlprocgrep --server=root@localhost \
             --match-user=mats --age=-1m --kill-query

       Kill all connections that have been idle for more than 1 hour:

           mysqlprocgrep --server=root@localhost \
             --match-command=sleep --age=1h --kill-connection

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                    MYSQLPROCGREP(1)
