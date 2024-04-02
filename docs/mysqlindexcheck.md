MYSQLINDEXCHECK                                                   MySQL Utilities                                                  MYSQLINDEXCHECK

NAME
       mysqlindexcheck - Identify Potentially Redundant Table Indexes

SYNOPSIS
       mysqlindexcheck [options] db[:table] ...

DESCRIPTION
       This utility reads the indexes for one or more tables and identifies duplicate and potentially redundant indexes.

       To check all tables in a database, specify only the database name. To check a specific table, name the table in db.table format. It is
       possible to mix database and table names.

       You can scan tables in any database except the internal databases mysql, INFORMATION_SCHEMA, and performance_schema.

       Depending on the index type, the utility applies the following rules to compare indexes (designated as idx_a and idx_b):

       ·   BTREE

           idx_b is redundant to idx_a if and only if the first n columns in idx_b also appear in idx_a. Order and uniqueness count.

       ·   HASH

           idx_a and idx_b are duplicates if and only if they contain the same columns in the same order. Uniqueness counts.

       ·   SPATIAL

           idx_a and idx_b are duplicates if and only if they contain the same column (only one column is permitted).

       ·   FULLTEXT

           idx_b is redundant to idx_a if and only if all columns in idx_b are included in idx_a. Order counts.

       To see DROP statements to drop redundant indexes, specify the --show-drops option. To examine the existing indexes, use the --verbose
       option, which prints the equivalent CREATE INDEX (or ALTER TABLE for primary keys.

       To display the best or worst nonprimary key indexes for each table, use the --best or --worst option. This causes the output to show the
       best or worst indexes from tables with 10 or more rows. By default, each option shows five indexes. To override that, provide an integer
       value for the option.

       To change the format of the index lists displayed for the --show-indexes, --best, and --worst options, use one of the following values with
       the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   sql

           print SQL statements rather than a list.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.

       Note: The --best and --worst lists cannot be printed as SQL statements.
             OPTIONS

       mysqlindexcheck accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --best[=<N>]

           If --stats is given, limit index statistics to the best N indexes. The default value of N is 5 if omitted.

       ·   --format=<index_format>, -f<index_format>

           Specify the index list display format for output produced by --stats. Permitted format values are grid, csv, tab, sql, and vertical.
           The default is grid.

       ·   --server=<source>

           Connection information for the server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or <login-path>[:<port>][:<socket>].

       ·   --show-drops, -d

           Display DROP statements for dropping indexes.

       ·   --show-indexes, -i

           Display indexes for each table.

       ·   --skip, -s

           Skip tables that do not exist.

       ·   --stats

           Show index performance statistics.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.

       ·   --worst[=<N>]

           If --stats is given, limit index statistics to the worst N indexes. The default value of N is 5 if omitted.
             NOTES

       You must provide connection parameters (user, host, password, and so forth) for an account that has the appropriate privileges to read all
       objects accessed during the operation.

       For the --format option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --format=g specifies the grid format. An error occurs if a prefix matches more than one valid value.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       To check all tables in the employees database on the local server to see the possible redundant and duplicate indexes, use this command:

           $ mysqlindexcheck --server=root@localhost employees
           # Source on localhost: ... connected.
           # The following indexes are duplicates or redundant \
             for table employees.dept_emp:
           #
           CREATE INDEX emp_no ON employees.dept_emp (emp_no) USING BTREE
           #     may be redundant or duplicate of:
           ALTER TABLE employees.dept_emp ADD PRIMARY KEY (emp_no, dept_no)
           # The following indexes are duplicates or redundant \
             for table employees.dept_manager:
           #
           CREATE INDEX emp_no ON employees.dept_manager (emp_no) USING BTREE
           #     may be redundant or duplicate of:
           ALTER TABLE employees.dept_manager ADD PRIMARY KEY (emp_no, dept_no)
           # The following indexes are duplicates or redundant \
             for table employees.salaries:
           #
           CREATE INDEX emp_no ON employees.salaries (emp_no) USING BTREE
           #     may be redundant or duplicate of:
           ALTER TABLE employees.salaries ADD PRIMARY KEY (emp_no, from_date)
           # The following indexes are duplicates or redundant \
             for table employees.titles:
           #
           CREATE INDEX emp_no ON employees.titles (emp_no) USING BTREE
           #     may be redundant or duplicate of:
           ALTER TABLE employees.titles ADD PRIMARY KEY (emp_no, title, from_date)

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                     MYSQLINDEXCHECK
