MYSQLDBCOMPARE(1)                                                 MySQL Utilities                                                MYSQLDBCOMPARE(1)

NAME
       mysqldbcompare - Compare Two Databases and Identify Differences

SYNOPSIS
       mysqldbcompare [options] db1 [:db2] ...

DESCRIPTION
       This utility compares the objects and data from two databases to find differences. It identifies objects having different definitions in
       the two databases and presents them in a diff-style format of choice. Differences in the data are shown using a similar diff-style format.
       Changed or missing rows are shown in a standard format of GRID, CSV, TAB, or VERTICAL.

       Use the notation db1:db2 to name two databases to compare, or, alternatively just db1 to compare two databases with the same name. The
       latter case is a convenience notation for comparing same-named databases on different servers.

       The comparison may be run against two databases of different names on a single server by specifying only the --server1 option. The user can
       also connect to another server by specifying the --server2 option. In this case, db1 is taken from server1 and db2 from server2.

       Those objects considered in the database include tables, views, triggers, procedures, functions, and events. A count for each object type
       can be shown with the -vv option.

       The check is performed using a series of steps called tests. By default, the utility stops on the first failed test, but you can specify
       the --run-all-tests option to cause the utility to run all tests regardless of their end state.

       Note: Using --run-all-tests may produce expected cascade failures. For example, if the row counts differ among two tables being compared,
       the data consistency will also fail.

       The tests include the following:

        1. Check database definitions

           A database existence precondition check ensures that both databases exist. If they do not, no further processing is possible and the
           --run-all-tests option is ignored.

        2. Check existence of objects in both databases

           The test for objects in both databases identifies those objects missing from one or another database. The remaining tests apply only to
           those objects that appear in both databases. To skip this test, use the --skip-object-compare option. That can be useful when there are
           known missing objects among the databases.

        3. Compare object definitions

           The definitions (the CREATE statements) are compared and differences are presented. To skip this test, use the --skip-diff option. That
           can be useful when there are object name differences only that you want to ignore.

        4. Check table row counts

           This check ensures that both tables have the same number of rows. This does not ensure that the table data is consistent. It is merely
           a cursory check to indicate possible missing rows in one table or the other. The data consistency check identifies the missing rows. To
           skip this test, use the --skip-row-count option.

        5. Check table data consistency

           This check identifies both changed rows as well as missing rows from one or another of the tables in the databases. Changed rows are
           displayed as a diff-style report with the format chosen (GRID by default) and missing rows are also displayed using the format chosen.
           To skip this test, use the --skip-data-check option.

       You may want to use the --skip-xxx options to run only one of the tests. This might be helpful when working to bring two databases into
       synchronization, to avoid running all of the tests repeatedly during the process.

       Each test completes with one of the following states:

       ·   pass

           The test succeeded.

       ·   FAIL

           The test failed. Errors are displayed following the test state line.

       ·   SKIP

           The test was skipped due to a missing prerequisite or a skip option.

       ·   WARN

           The test encountered an unusual but not fatal error.

       ·   -

           The test is not applicable to this object.

       To specify how to display diff-style output, use one of the following values with the --difftype option:

       ·   unified (default)

           Display unified format output.

       ·   context

           Display context format output.

       ·   differ

           Display differ-style format output.

       ·   sql

           Display SQL transformation statement output.

       To specify how to display output for changed or missing rows, use one of the following values with the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.

       The --changes-for option controls the direction of the difference (by specifying the object to be transformed) in either the difference
       report (default) or the transformation report (designated with the --difftype=sql option). Consider the following command:

           mysqldbcompare --server1=root@host1 --server2=root@host2 --difftype=sql \
             db1:dbx

       The leftmost database (db1) exists on the server designated by the --server1 option (host1). The rightmost database (dbx) exists on the
       server designated by the --server2 option (host2).

       ·   --changes-for=server1: Produce output that shows how to make the definitions of objects on server1 like the definitions of the
           corresponding objects on server2.

       ·   --changes-for=server2: Produce output that shows how to make the definitions of objects on server2 like the definitions of the
           corresponding objects on server1.

       The default direction is server1.

       You must provide connection parameters (user, host, password, and so forth) for an account that has the appropriate privileges to access
       all objects in the operation.

       If the utility is to be run on a server that has binary logging enabled, and you do not want the comparison steps logged, use the
       --disable-binary-logging option.
             OPTIONS

       mysqldbcompare accepts the following command-line options:

       ·   --all, -a

           Include all databases. Added in release-1.3.5.

       ·   --help

           Display a help message and exit.

       ·   --changes-for=<direction>

           Specify the server to show transformations to match the other server. For example, to see the transformation for transforming object
           definitions on server1 to match the corresponding definitions on server2, use --changes-for=server1. Permitted values are server1 and
           server2. The default is server1.

       ·   --difftype=<difftype>, -d<difftype>

           Specify the difference display format. Permitted format values are unified, context, differ, and sql. The default is unified.

       ·   --disable-binary-logging

           If binary logging is enabled, disable it during the operation to prevent comparison operations from being written to the binary log.
           Note: Disabling binary logging requires the SUPER privilege.

       ·   --exclude=<exclude>, -x<exclude>

           Exclude one or more databases from the operation using either a specific name such as db1 or a search pattern. Use this option multiple
           times to specify multiple exclusions. By default, patterns use database patterns such as LIKE. With the --regexp option, patterns use
           regular expressions for matching names. Added in release-1.3.5.

       ·   --format=<format>, -f<format>

           Specify the display format for changed or missing rows. Permitted format values are grid, csv, tab, and vertical. The default is grid.

       ·   --quiet, -q

           Do not print anything. Return only an exit code of success or failure.

       ·   --regexp, --basic-regexp, -G

           Perform pattern matches using the REGEXP operator. The default is to use LIKE for matching. Added in release-1.3.5.

       ·   --run-all-tests, -t

           Do not halt at the first difference found. Process all objects. Shortcut changed from -a to -t in release-1.3.5.

       ·   --server1=<source>

           Connection information for the first server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --server2=<source>

           Connection information for the second server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[::<port>][::<socket>].

       ·   --show-reverse

           Produce a transformation report containing the SQL statements to conform the object definitions specified in reverse. For example, if
           --changes-for is set to server1, also generate the transformation for server2. Note: The reverse changes are annotated and marked as
           comments.

       ·   --skip-data-check

           Skip the data consistency check.

       ·   --skip-diff

           Skip the object definition difference check.

       ·   --skip-object-compare

           Skip the object comparison check.

       ·   --skip-row-count

           Skip the row count check.

       ·   --span-key-size=<number of bytes to use for key>

           Change the size of the key used for compare table contents. A higher value can help to get more accurate results comparing large
           databases, but may slow the algorithm.

           Default value is 8.

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.

       ·   --width=<number>

           Change the display width of the test report. The default is 75 characters.
             NOTES

       The login user must have the appropriate permissions to read all databases and tables listed.

       For the --difftype option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --difftype=d specifies the differ type. An error occurs if a prefix matches more than one valid value.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).

       If any database identifier specified as an argument contains special characters or is a reserved word, then it must be appropriately quoted
       with backticks (`). In turn, names quoted with backticks must also be quoted with single or double quotes depending on the operating
       system, i.e. (") in Windows or (') in non-Windows systems, in order for the utilities to read backtick quoted identifiers as a single
       argument. For example, to compare a database with the name weird`db.name with other:weird`db.name, the database pair must be specified
       using the following syntax (in non-Windows): '`weird``db.name`:`other:weird``db.name`'.
             EXAMPLES

       Use the following command to compare the emp1 and emp2 databases on the local server, and run all tests even if earlier tests fail:

           $ mysqldbcompare --server1=root@localhost emp1:emp2 --run-all-tests
           # server1 on localhost: ... connected.
           # Checking databases emp1 on server1 and emp2 on server2
           WARNING: Objects in server2:emp2 but not in server1:emp1:
             TRIGGER: trg
           PROCEDURE: p1
               TABLE: t1
                VIEW: v1
                                                               Defn    Row     Data
           Type      Object Name                               Diff    Count   Check
           ---------------------------------------------------------------------------
           FUNCTION  f1                                        pass    -       -
           TABLE     departments                               pass    pass    FAIL
           Data differences found among rows:
           --- emp1.departments
           +++ emp2.departments
           @@ -1,4 +1,4 @@
            *************************       1. row *************************
               dept_no: d002
           - dept_name: dunno
           + dept_name: Finance
            1 rows.
           Rows in emp1.departments not in emp2.departments
           *************************       1. row *************************
              dept_no: d008
            dept_name: Research
           1 rows.
           Rows in emp2.departments not in emp1.departments
           *************************       1. row *************************
              dept_no: d100
            dept_name: stupid
           1 rows.
           TABLE     dept_manager                              pass    pass    pass
           Database consistency check failed.
           # ...done

       Given: two databases with the same table layout. Data for each table contains:

           mysql> select * from db1.t1;
           +---+---------------+
           | a | b             |
           +---+---------------+
           | 1 | Test 789      |
           | 2 | Test 456      |
           | 3 | Test 123      |
           | 4 | New row - db1 |
           +---+---------------+
           4 rows in set (0.00 sec)
           mysql> select * from db2.t1;
           +---+---------------+
           | a | b             |
           +---+---------------+
           | 1 | Test 123      |
           | 2 | Test 456      |
           | 3 | Test 789      |
           | 5 | New row - db2 |
           +---+---------------+
           4 rows in set (0.00 sec)

       To generate the SQL statements for data transformations to make db1.t1 the same as db2.t1, use the --changes-for=server1 option. We must
       also include the -a option to ensure that the data consistency test is run. The following command illustrates the options used and an
       excerpt from the results generated:

           $ mysqldbcompare --server1=root:root@localhost \
               --server2=root:root@localhost db1:db2 --changes-for=server1 -a \
               --difftype=sql
           [...]
           #                                                   Defn    Row     Data
           # Type      Object Name                             Diff    Count
           Check #
           -------------------------------------------------------------------------
           # TABLE     t1                                      pass    pass    FAIL
           # # Data transformations for direction = server1:
           # Data differences found among rows: UPDATE db1.t1 SET b = 'Test 123'
           WHERE a = '1'; UPDATE db1.t1 SET b = 'Test 789' WHERE a = '3'; DELETE
           FROM db1.t1 WHERE a = '4'; INSERT INTO db1.t1 (a, b) VALUES('5', 'New
           row - db2');
           # Database consistency check failed.  # # ...done

       Similarly, when the same command is run with --changes-for=server2 and --difftype=sql, the following report is generated:

           $ mysqldbcompare --server1=root:root@localhost \
               --server2=root:root@localhost db1:db2 --changes-for=server2 -a \
               --difftype=sql
           [...]
           #                                                   Defn    Row     Data
           # Type      Object Name                             Diff    Count
           Check #
           -------------------------------------------------------------------------
           # TABLE     t1                                      pass    pass    FAIL
           # # Data transformations for direction = server2:
           # Data differences found among rows: UPDATE db2.t1 SET b = 'Test 789'
           WHERE a = '1'; UPDATE db2.t1 SET b = 'Test 123' WHERE a = '3'; DELETE
           FROM db2.t1 WHERE a = '5'; INSERT INTO db2.t1 (a, b) VALUES('4', 'New
           row - db1');

       With the --difftype=sql SQL generation option set, --show-reverse shows the object transformations in both directions. Here is an excerpt
       of the results:

           $ mysqldbcompare --server1=root:root@localhost \
           --server2=root:root@localhost db1:db2 --changes-for=server1 \
           --show-reverse -a --difftype=sql
           [...]
           #                                                   Defn    Row     Data
           # Type      Object Name                             Diff    Count
           Check #
           -------------------------------------------------------------------------
           # TABLE     t1                                      pass    pass    FAIL
           # # Data transformations for direction = server1:
           # Data differences found among rows: UPDATE db1.t1 SET b = 'Test 123'
           WHERE a = '1'; UPDATE db1.t1 SET b = 'Test 789' WHERE a = '3'; DELETE
           FROM db1.t1 WHERE a = '4'; INSERT INTO db1.t1 (a, b) VALUES('5', 'New
           row - db2');
           # Data transformations for direction = server2:
           # Data differences found among rows: UPDATE db2.t1 SET b = 'Test 789'
           WHERE a = '1'; UPDATE db2.t1 SET b = 'Test 123' WHERE a = '3'; DELETE
           FROM db2.t1 WHERE a = '5'; INSERT INTO db2.t1 (a, b) VALUES('4', 'New
           row - db1');
           # Database consistency check failed.  # # ...done

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                   MYSQLDBCOMPARE(1)
