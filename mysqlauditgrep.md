MYSQLAUDITGREP(1)                                                 MySQL Utilities                                                MYSQLAUDITGREP(1)

NAME
       mysqlauditgrep - Search an audit log

SYNOPSIS
        mysqlauditgrep [OPTIONS]... AUDIT_LOG_FILE
        mysqlauditgrep --file-stats[--format=FORMAT] AUDIT_LOG_FILE
        mysqlauditgrep --format=FORMAT AUDIT_LOG_FILE
        mysqlauditgrep [--users=USERS] [--start-date=START_DATE] [--end-date=END_DATE] [--pattern=PATTERN[--regexp]] [--query-type=QUERY_TYPE]
       [--event-type=EVENT_TYPE] [--status=STATUS] [--format=FORMAT] AUDIT_LOG_FILE

DESCRIPTION
       This utility allows you to search the current or archived audit logs, allowing you to display data from the audit log file according to the
       defined search criterion. It also allows you to output the results in different formats, namely GRID (default), TAB, CSV, VERTICAL, and RAW
       (the original XML format).

       This utility allows you to search and filter the returned audit log records by: users (--users), date and time ranges (--start-date and
       --end-date), SQL query types (--query-type), logged event and record types (--event-type), status (--status), and matching patterns
       (--pattern). Any of these search options can be combined and used together, with the retrieved records resulting from all passed in options
       being true.

       The --pattern supports two types of pattern matching: standard SQL, used with the SQL LIKE operator (SQL patterns), and standard REGEXP
       (POSIX regular expression patterns).

       This utility always requires an audit log file to be passed in, so the AUDIT_LOG_FILE argument is searched as a full path and file name for
       the audit log file. If not specified, a notification concerning this requirement will be printed. And if --format is passed in without
       search parameters, then all the records of the audit log are displayed in the specified format.

       The --file-stats option is not considered a search criteria, and is used to display the file statistics of a specified audit log. Other
       search options will be ignored when the --file-stats option is used, except the --format option will continue to format the results
       accordingly.

       To specify the format of the generated results, use one of the following values with the --format option:

        1. GRID (default)

           Display output in grid or table format like that of the mysql monitor.

        2. CSV

           Display output in comma-separated values format.

        3. VERTICAL

           Display output in single-column format like that of the \G command for the mysql monitor.

        4. RAW

           Display output results in the original raw format of the audit log records, which is written in XML.
             Standard SQL Pattern Matching

       The simple patterns defined by the SQL standard enables users to use two characters with special meanings: “%” (percent) matches zero or
       more characters, and “_” (underscore) matches exactly one arbitrary character. In standard SQL, these types of patterns are used with the
       LIKE comparison operator, and they are case-insensitive by default. This utility assumes that they are case-insensitive.

       For example:

       ·   "audit%"

           Match any string that starts with "audit".

       ·   "%log%"

           Match any string containing the word "log".

       ·   "%_"

           Match any string consisting of one or more characters.

       For documentation about the standard SQL pattern matching syntax, see Pattern Matching[1].
             REGEXP Pattern Matching (POSIX)

       Standard REGEXP patterns are more powerful than the simple patterns defined in the SQL standard. A regular expression is a string of
       ordinary and special characters specified to match other strings. Unlike SQL Patterns, REGEXP patterns are case-sensitive. The REGEXP
       syntax defines the following characters with special meaning:

       ·   .

           Match any character.

       ·   ^

           Match the beginning of a string.

       ·   $

           Match the end of a string.

       ·   \

           Match zero or more repetitions of the preceding regular expression.

       ·   +

           Match one or more repetitions of the preceding regular expression.

       ·   ?

           Match zero or one repetition of the preceding regular expression.

       ·   |

           Match either the regular expressions from the left or right of |.

       ·   []

           Indicates a set of characters to match. Note that, special characters lose their special meaning inside sets. In particular, ^ acquires
           a different meaning if it is the first character of the set, matching the complementary set (i.e., all the characters that are not in
           the set will be matched).

       ·   {m}

           Match m repetitions of the preceding regular expression.

       ·   {m,n}

           Match from m to n repetitions of the preceding regular expression.

       ·   ()

           Define a matching group, and matches the regular expression inside the parentheses.

       For example:

       ·   "a\*"

           Match a sequence of zero or more a.

       ·   "a+"

           Match a sequence of one or more a.

       ·   "a?"

           Match zero or one a.

       ·   "ab|cd"

           Match ab or cd.

       ·   "[axy]"

           Match a, x or y.

       ·   "[a-f]"

           Match any character in the range a to f (that is, a, b, c, d, e, or f).

       ·   "[^axy]"

           Match any character excepta, x or y.

       ·   "a{5}"

           Match exactly five copies of a.

       ·   "a{2,5}"

           Match from two to five copies of a.

       ·   "(abc)+"

           Match one or more repetitions of abc.

       This is a brief overview of regular expressions that can be used to define this type of patterns. The full syntax is described in the
       Python "re" module docs[2], supporting the definition of much more complex pattern matching expression.
             OPTIONS

       mysqlauditgrep accepts the following command-line options:

       ·   --end-date=<END_DATE>

           End date/time to retrieve log entries until the specified date/time range. If not specified or the value is 0, all entries to the end
           of the log are displayed. Accepted formats: "yyyy-mm-ddThh:mm:ss" or "yyyy-mm-dd".

       ·   --event-type=<EVENT_TYPE>

           Comma-separated list of event types to search in all audit log records matching the specified types. Supported values are: Audit,
           Binlog Dump, Change user, Close stmt, Connect Out, Connect, Create DB, Daemon, Debug, Delayed insert, Drop DB, Execute, Fetch, Field
           List, Init DB, Kill, Long Data, NoAudit, Ping, Prepare, Processlist, Query, Quit, Refresh, Register Slave, Reset stmt, Set option,
           Shutdown, Sleep, Statistics, Table Dump, Time.

       ·   --file-stats

           Display the audit log file statistics.

       ·   --format=FORMAT, -f FORMAT

           Output format to display the resulting data. Supported format values: GRID (default), TAB, CSV, VERTICAL and RAW.

       ·   --help

           Display a help message and exit.

       ·   --pattern=<PATTERN>, -e <PATTERN>

           Search pattern to retrieve all entries with at least one attribute value matching the specified pattern. By default the standard SQL
           LIKE patterns are used for matching. If the --regexp option is set, then REGEXP patterns must be specified for matching.

       ·   --query-type=<QUERY_TYPE>

           Comma-separated list of SQL statements/commands to search for and match. Supported values: CREATE, ALTER, DROP, TRUNCATE, RENAME,
           GRANT, REVOKE, SELECT, INSERT, UPDATE, DELETE, COMMIT, SHOW, SET, CALL, PREPARE, EXECUTE, DEALLOCATE.

       ·   --regexp, --basic-regexp, -G

           Indicates that pattern matching will be performed using a regular expression REGEXP (from the Python re module). By default, the simple
           standard SQL LIKE patterns are used for matching. This affects how the value specified by the --pattern option is interpreted.

       ·   --start-date=<START_DATE>

           Starting date/time to retrieve log entries from the specified date/time range. If not specified or the value is 0, all entries from the
           start of the log are displayed. Accepted formats: yyyy-mm-ddThh:mm:ss or yyyy-mm-dd.

       ·   --status=<STATUS>

           Comma-separated list of status values or intervals to search for all audit log records with a matching status. Status values are
           non-negative integers (corresponding to MySQL error codes). Status intervals are closed (i.e., include both endpoints) and defined
           simply using a dash between its endpoints. For Example: 1051,1068-1075,1109,1146.

           The --status option is available as of MySQL Utilities 1.2.4 / 1.3.3.

       ·   --users=<USERS>, -u <USERS>

           Comma-separated list of user names, to search for their associated log entries. For example: "dan,jon,john,paul,philip,stefan".

       ·   --verbose, -v

           Specify how much information to display. Use this option multiple times to increase the amount of information. For example, -v =
           verbose, -vv = more verbose, -vvv = debug.

       ·   --version

           Display version information and exit.
             NOTES

       This utility is available as of μ 1.2.0.

       This utility can only be applied to servers with the audit log plugin enabled[3]. And the audit log plugin is available as of MySQL Server
       versions 5.5.28 and 5.6.10.

       This utility requires the use of Python version 2.6 or higher, but does not support Python 3.

       Single or double quote characters (respectively, ' or ") can be used around option values. In fact, quotes are required to set some options
       values correctly, such as values with whitespace. For example, to specify the event types Create DB and Drop DB for the --event-type
       option, the following syntax must be used: --event-type='Create DB,Drop DB' or --event-type="Create DB,Drop DB".
             EXAMPLES

       To display the audit log file statistics and output the results in CSV format, run the following command:

           shell> mysqlauditgrep --file-stats --format=CSV /SERVER/data/audit.log
             #
             # Audit Log File Statistics:
             #
             File,Size,Created,Last Modified
             audit.log,9101,Thu Sep 27 13:33:11 2012,Thu Oct 11 17:40:35 2012
             #
             # Audit Log Startup Entries:
             #
             SERVER_ID,STARTUP_OPTIONS,NAME,TIMESTAMP,MYSQL_VERSION,OS_VERSION,VERSION
             1,/SERVER/sql/mysqld --defaults-file=/SERVER/my.cnf,Audit,2012-09-27T13:33:11,5.5.29-log,x86_64-Linux,1

       To display the audit log entries of specific users, use the following command:

           shell> mysqlauditgrep --users=tester1,tester2 /SERVER/data/audit.log

       To display the audit log file statistics, run the following command:

           shell> mysqlauditgrep --users=tester1,tester2 /SERVER/data/audit.log
             +---------+------------+----------+----------------------+----------------+------------+----------+------------+------------+----------------------------------+
             | STATUS  | SERVER_ID  | NAME     | TIMESTAMP            | CONNECTION_ID  | HOST       | USER     | PRIV_USER  | IP         | SQLTEXT                          |
             +---------+------------+----------+----------------------+----------------+------------+----------+------------+------------+----------------------------------+
             | 0       | 1          | Connect  | 2012-09-28T11:26:50  | 9              | localhost  | root     | tester1    | 127.0.0.1  | None                             |
             | 0       | 1          | Query    | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | SET @@session.autocommit = OFF   |
             | 0       | 1          | Ping     | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | None                             |
             | 0       | 1          | Query    | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | SHOW VARIABLES LIKE 'READ_ONLY'  |
             | 0       | 1          | Query    | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | COMMIT                           |
             | 0       | 1          | Ping     | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | None                             |
             | 0       | 1          | Query    | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | COMMIT                           |
             | 0       | 1          | Quit     | 2012-09-28T11:26:50  | 9              | None       | root     | tester1    | None       | None                             |
             | 0       | 1          | Connect  | 2012-10-10T15:55:55  | 11             | localhost  | tester2  | root       | 127.0.0.1  | None                             |
             | 0       | 1          | Query    | 2012-10-10T15:55:55  | 11             | None       | tester2  | root       | None       | select @@version_comment limit 1 |
             | 0       | 1          | Query    | 2012-10-10T15:56:10  | 11             | None       | tester2  | root       | None       | show databases                   |
             | 1046    | 1          | Query    | 2012-10-10T15:57:26  | 11             | None       | tester2  | root       | None       | show tables test                 |
             | 1046    | 1          | Query    | 2012-10-10T15:57:36  | 11             | None       | tester2  | root       | None       | show tables test                 |
             | 0       | 1          | Query    | 2012-10-10T15:57:51  | 11             | None       | tester2  | root       | None       | show tables in test              |
             | 0       | 1          | Quit     | 2012-10-10T15:57:59  | 11             | None       | tester2  | root       | None       | None                             |
             | 0       | 1          | Connect  | 2012-10-10T17:35:42  | 12             | localhost  | tester2  | root       | 127.0.0.1  | None                             |
             | 0       | 1          | Query    | 2012-10-10T17:35:42  | 12             | None       | tester2  | root       | None       | select @@version_comment limit 1 |
             | 0       | 1          | Quit     | 2012-10-10T17:47:22  | 12             | None       | tester2  | root       | None       | None                             |
             +---------+------------+----------+----------------------+----------------+------------+----------+------------+------------+----------------------------------+

       To display the audit log entries for a specific date/time range, use the following command:

           shell> mysqlauditgrep --start-date=2012-09-27T13:33:47 --end-date=2012-09-28 /SERVER/data/audit.log
             +---------+----------------------+--------+----------------+---------------------------------------------------------------------------+
             | STATUS  | TIMESTAMP            | NAME   | CONNECTION_ID  | SQLTEXT                                                                   |
             +---------+----------------------+--------+----------------+---------------------------------------------------------------------------+
             | 0       | 2012-09-27T13:33:47  | Ping   | 7              | None                                                                      |
             | 0       | 2012-09-27T13:33:47  | Query  | 7              | SELECT * FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME LIKE 'audit%'  |
             | 0       | 2012-09-27T13:33:47  | Query  | 7              | COMMIT                                                                    |
             | 0       | 2012-09-27T13:34:48  | Quit   | 7              | None                                                                      |
             | 0       | 2012-09-27T13:34:48  | Quit   | 8              | None                                                                      |
             +---------+----------------------+--------+----------------+---------------------------------------------------------------------------+

       To display the audit log entries matching a specific SQL LIKE pattern, use the following command:

           shell> mysqlauditgrep --pattern="% = ___"; /SERVER/data/audit.log
             +---------+----------------------+--------+---------------------------------+----------------+
             | STATUS  | TIMESTAMP            | NAME   | SQLTEXT                         | CONNECTION_ID  |
             +---------+----------------------+--------+---------------------------------+----------------+
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF  | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF  | 8              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF  | 9              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF  | 10             |
             +---------+----------------------+--------+---------------------------------+----------------+

       To display the audit log entries matching a specific REGEXP pattern, use the following command:

           shell> mysqlauditgrep --pattern=".* = ..." --regexp /SERVER/data/audit.log
             +---------+----------------------+--------+---------------------------------+----------------+
             | STATUS  | TIMESTAMP            | NAME   | SQLTEXT                         | CONNECTION_ID  |
             +---------+----------------------+--------+---------------------------------+----------------+
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF  | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF  | 8              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF  | 9              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF  | 10             |
             +---------+----------------------+--------+---------------------------------+----------------+

       To display the audit log entries of specific query types, use the following command:

           shell> mysqlauditgrep --query-type=show,SET /SERVER/data/audit.log
             +---------+----------------------+--------+-------------------------------------------------+----------------+
             | STATUS  | TIMESTAMP            | NAME   | SQLTEXT                                         | CONNECTION_ID  |
             +---------+----------------------+--------+-------------------------------------------------+----------------+
             | 0       | 2012-09-27T13:33:39  | Query  | SET NAMES 'latin1' COLLATE 'latin1_swedish_ci'  | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF                  | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SHOW VARIABLES LIKE 'READ_ONLY'                 | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SHOW VARIABLES LIKE 'datadir'                   | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SHOW VARIABLES LIKE 'basedir'                   | 7              |
             | 0       | 2012-09-27T13:33:39  | Query  | SET NAMES 'latin1' COLLATE 'latin1_swedish_ci'  | 8              |
             | 0       | 2012-09-27T13:33:39  | Query  | SET @@session.autocommit = OFF                  | 8              |
             | 0       | 2012-09-27T13:33:39  | Query  | SHOW VARIABLES LIKE 'READ_ONLY'                 | 8              |
             | 0       | 2012-09-27T13:33:39  | Query  | SHOW VARIABLES LIKE 'basedir'                   | 8              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET NAMES 'latin1' COLLATE 'latin1_swedish_ci'  | 9              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF                  | 9              |
             | 0       | 2012-09-28T11:26:50  | Query  | SHOW VARIABLES LIKE 'READ_ONLY'                 | 9              |
             | 0       | 2012-09-28T11:26:50  | Query  | SET NAMES 'latin1' COLLATE 'latin1_swedish_ci'  | 10             |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@session.autocommit = OFF                  | 10             |
             | 0       | 2012-09-28T11:26:50  | Query  | SHOW VARIABLES LIKE 'READ_ONLY'                 | 10             |
             | 0       | 2012-09-28T11:26:50  | Query  | SET @@GLOBAL.audit_log_flush = ON               | 10             |
             | 0       | 2012-09-28T11:26:50  | Query  | SHOW VARIABLES LIKE 'audit_log_policy'          | 10             |
             | 0       | 2012-09-28T11:26:50  | Query  | SHOW VARIABLES LIKE 'audit_log_rotate_on_size'  | 10             |
             | 0       | 2012-10-10T15:56:10  | Query  | show databases                                  | 11             |
             | 1046    | 2012-10-10T15:57:26  | Query  | show tables test                                | 11             |
             | 1046    | 2012-10-10T15:57:36  | Query  | show tables test                                | 11             |
             | 0       | 2012-10-10T15:57:51  | Query  | show tables in test                             | 11             |
             +---------+----------------------+--------+-------------------------------------------------+----------------+

       To display the audit log entries of specific event types, use the following command:

           shell> mysqlauditgrep --event-type="Ping,Connect" /SERVER/data/audit.log
             +---------+----------+----------------------+----------------+------------+---------+------------+------------+
             | STATUS  | NAME     | TIMESTAMP            | CONNECTION_ID  | HOST       | USER    | PRIV_USER  | IP         |
             +---------+----------+----------------------+----------------+------------+---------+------------+------------+
             | 0       | Connect  | 2012-09-27T13:33:39  | 7              | localhost  | root    | root       | 127.0.0.1  |
             | 0       | Ping     | 2012-09-27T13:33:39  | 7              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-27T13:33:39  | 7              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-27T13:33:39  | 7              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-27T13:33:39  | 7              | None       | None    | None       | None       |
             | 0       | Connect  | 2012-09-27T13:33:39  | 8              | localhost  | root    | root       | 127.0.0.1  |
             | 0       | Ping     | 2012-09-27T13:33:39  | 8              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-27T13:33:39  | 8              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-27T13:33:47  | 7              | None       | None    | None       | None       |
             | 0       | Connect  | 2012-09-28T11:26:50  | 9              | localhost  | root    | tester     | 127.0.0.1  |
             | 0       | Ping     | 2012-09-28T11:26:50  | 9              | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-28T11:26:50  | 9              | None       | None    | None       | None       |
             | 0       | Connect  | 2012-09-28T11:26:50  | 10             | localhost  | root    | root       | 127.0.0.1  |
             | 0       | Ping     | 2012-09-28T11:26:50  | 10             | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-28T11:26:50  | 10             | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-28T11:26:50  | 10             | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-28T11:26:50  | 10             | None       | None    | None       | None       |
             | 0       | Ping     | 2012-09-28T11:26:50  | 10             | None       | None    | None       | None       |
             | 0       | Connect  | 2012-10-10T15:55:55  | 11             | localhost  | tester  | root       | 127.0.0.1  |
             | 0       | Connect  | 2012-10-10T17:35:42  | 12             | localhost  | tester  | root       | 127.0.0.1  |
             +---------+----------+----------------------+----------------+------------+---------+------------+------------+

       To display the audit log entries with a specific status, use the following command:

           shell> mysqlauditgrep --status=1100-1199,1046 /SERVER/data/audit.log
             +---------+----------------------+--------+---------------------------------------------------------------------+----------------+
             | STATUS  | TIMESTAMP            | NAME   | SQLTEXT                                                             | CONNECTION_ID  |
             +---------+----------------------+--------+---------------------------------------------------------------------+----------------+
             | 1046    | 2012-10-10T15:57:26  | Query  | show tables test                                                    | 11             |
             | 1046    | 2012-10-10T15:57:36  | Query  | show tables test                                                    | 11             |
             | 1146    | 2012-10-10T17:44:55  | Query  | select * from teste.employees where salary > 500 and salary < 1000  | 12             |
             | 1046    | 2012-10-10T17:47:17  | Query  | select * from test_encoding where value = '<>"&'                    | 12             |
             +---------+----------------------+--------+---------------------------------------------------------------------+----------------+

       Note: You can view all successful commands with --status=0 and all unsuccessful ones with --status=1-9999.

       To display the audit log entries matching several search criteria, use the following command:

           shell> mysqlauditgrep --users=root --start-date=0 --end-date=2012-10-10 --event-type=Query \
                --query-type=SET --status=0 --pattern="%audit_log%" /SERVER/data/audit.log
             +---------+------------+--------+----------------------+----------------+-------+------------+------------------------------------+
             | STATUS  | SERVER_ID  | NAME   | TIMESTAMP            | CONNECTION_ID  | USER  | PRIV_USER  | SQLTEXT                            |
             +---------+------------+--------+----------------------+----------------+-------+------------+------------------------------------+
             | 0       | 1          | Query  | 2012-09-28T11:26:50  | 10             | root  | root       | SET @@GLOBAL.audit_log_flush = ON  |
             +---------+------------+--------+----------------------+----------------+-------+------------+------------------------------------+

COPYRIGHT
NOTES
        1. Pattern Matching
           http://dev.mysql.com/doc/refman/5.6/en/pattern-matching.html

        2. Python "re" module docs
           http://docs.python.org/2/library/re.html

        3. audit log plugin enabled
           http://dev.mysql.com/doc/refman/5.6/en/audit-log-plugin-installation.html

SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                   MYSQLAUDITGREP(1)
