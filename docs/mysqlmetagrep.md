MYSQLMETAGREP(1)                                                  MySQL Utilities                                                 MYSQLMETAGREP(1)

NAME
       mysqlmetagrep - Search Database Object Definitions

SYNOPSIS
       mysqlmetagrep [options] [pattern | server] ...

DESCRIPTION
       This utility searches for objects matching a given pattern on all the servers specified using instances of the --server option. It produces
       output that displays the matching objects. By default, the first nonoption argument is taken to be the pattern unless the --pattern option
       is given. If the --pattern option is given, all nonoption arguments are treated as connection specifications.

       Internally, the utility generates an SQL statement for searching the necessary tables in the INFORMATION_SCHEMA database on the designated
       servers and executes it in turn before collecting the result and printing it as a table. Use the --sql option to have the utility display
       the statement rather than execute it. This can be useful if you want to feed the output of the statement to another application such as the
       mysql monitor.

       The MySQL server supports two forms of patterns when matching strings: SQL Simple Patterns (used with the LIKE operator) and POSIX Regular
       Expressions (used with the REGEXP operator).

       By default, the utility uses the LIKE operator to match the name (and optionally, the body) of objects. To use the REGEXP operator instead,
       use the --regexp option.

       Note that since the REGEXP operator does substring searching, it is necessary to anchor the expression to the beginning of the string if
       you want to match the beginning of the string.

       To specify how to display output, use one of the following values with the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.
             SQL Simple Patterns

       The simple patterns defined by the SQL standard consist of a string of characters with two characters that have special meaning: %
       (percent) matches zero or more characters and _ (underscore) matches exactly one character.

       For example:

       ·   'mats%'

           Match any string that starts with 'mats'.

       ·   '%kindahl%'

           Match any string containing the word 'kindahl'.

       ·   '%_'

           Match any string consisting of one or more characters.
             POSIX Regular Expressions

       POSIX regular expressions are more powerful than the simple patterns defined in the SQL standard. A regular expression is a string of
       characters, optionally containing characters with special meaning:

       ·   .

           Match any character.

       ·   ^

           Match the beginning of a string.

       ·   $

           Match the end of a string.

       ·   [axy]

           Match a, x, or y.

       ·   [a-f]

           Match any character in the range a to f (that is, a, b, c, d, e, or f).

       ·   [^axy]

           Match any character excepta, x, or y.

       ·   a*

           Match a sequence of zero or more a.

       ·   a+

           Match a sequence of one or more a.

       ·   a?

           Match zero or one a.

       ·   ab|cd

           Match ab or cd.

       ·   a{5}

           Match five instances of a.

       ·   a{2,5}

           Match from two to five instances of a.

       ·   (abc)+

           Match one or more repetitions of abc.

       This is but a brief set of examples of regular expressions. The full syntax is described in the MySQL manual[1], but can often be found in
       regex(7).
             OPTIONS

       mysqlmetagrep accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --body, -b

           Search the body of stored programs (procedures, functions, triggers, and events). The default is to match only the name.

       ·   --database=<pattern>

           Look only in databases matching this pattern.

       ·   --format=<format>, -f<format>

           Specify the output display format. Permitted format values are grid, csv, tab, and vertical. The default is grid.

       ·   --object-types=<types>, --search-objects=<types>

           Search only the object types named in types, which is a comma-separated list of one or more of the values procedure, function, event,
           trigger, table, and database.

           The default is to search in objects of all types.

       ·   --pattern=<pattern>, -e=<pattern>

           The pattern to use when matching. This is required when the first nonoption argument looks like a connection specification rather than
           a pattern.

           If the --pattern option is given, the first nonoption argument is treated as a connection specifier, not as a pattern.

       ·   --regexp, --basic-regexp, -G

           Perform pattern matches using the REGEXP operator. The default is to use LIKE for matching. This affects the --database and --pattern
           options.

       ·   --server=<source>

           Connection information for a server to search in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>]. Use this option multiple times to search multiple servers.

       ·   --sql, --print-sql, -p

           Print rather than executing the SQL code that would be executed to find all matching objects. This can be useful to save the statement
           for later execution or to use it as input for other programs.

       ·   --version

           Display version information and exit.
             NOTES

       For the --format option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --format=g specifies the grid format. An error occurs if a prefix matches more than one valid value.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       Find all objects with a name that matches the pattern 't_' (the letter t followed by any single character):

           $ mysqlmetagrep --pattern="t_" --server=mats@localhost
           +------------------------+--------------+--------------+-----------+
           | Connection             | Object Type  | Object Name  | Database  |
           +------------------------+--------------+--------------+-----------+
           | mats:*@localhost:3306  | TABLE        | t1           | test      |
           | mats:*@localhost:3306  | TABLE        | t2           | test      |
           | mats:*@localhost:3306  | TABLE        | t3           | test      |
           +------------------------+--------------+--------------+-----------+

       To find all object that contain 't2' in the name or the body (for routines, triggers, and events):

           $ mysqlmetagrep -b --pattern="%t2%" --server=mats@localhost:3306
           +------------------------+--------------+--------------+-----------+
           | Connection             | Object Type  | Object Name  | Database  |
           +------------------------+--------------+--------------+-----------+
           | root:*@localhost:3306  | TRIGGER      | tr_foo       | test      |
           | root:*@localhost:3306  | TABLE        | t2           | test      |
           +------------------------+--------------+--------------+-----------+

       In the preceding output, the trigger name does not match the pattern, but is displayed because its body does.

       This is the same as the previous example, but using the REGEXP operator. Note that in the pattern it is not necessary to add wildcards
       before or after t2:

           $ mysqlmetagrep -Gb --pattern="t2" --server=mats@localhost
           +------------------------+--------------+--------------+-----------+
           | Connection             | Object Type  | Object Name  | Database  |
           +------------------------+--------------+--------------+-----------+
           | root:*@localhost:3306  | TRIGGER      | tr_foo       | test      |
           | root:*@localhost:3306  | TABLE        | t2           | test      |
           +------------------------+--------------+--------------+-----------+

COPYRIGHT
NOTES
        1. MySQL manual
           http://dev.mysql.com/doc/mysql/en/regexp.html

SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                    MYSQLMETAGREP(1)
