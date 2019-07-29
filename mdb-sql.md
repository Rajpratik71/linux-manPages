mdb-sql(1)                                             Executable programs or shell commands                                            mdb-sql(1)

NAME
       mdb-sql - SQL interface to MDB Tools

SYNOPSIS
       mdb-sql [-HFp] [-d delimiter] [-i file] [-o file] [database]

DESCRIPTION
       mdb-sql is a utility program distributed with MDB Tools.

       mdb-sql allows querying of an MDB database using a limited SQL subset language.

OPTIONS
       -H     Suppress header row.

       -F     Suppress footer row.

       -p     Turn  off  pretty printing. By default results are printed in an ascii table format which looks nice but is not conducive to manipu‐
              lating the output with unix tools. This option prints output plainly in a tab separated format.

       -d     Specify an alternative column delimiter. If no delimiter is specified, columns will be delimited by a tab character if pretty print‐
              ing (-p) is turned off. If pretty printing is enabled this option is meaningless.

       -i     Specify an input file. This option allows an input file containing the SQL to be passed to mdb-sql.  See Notes.

       -o     Specify an output file. This option allows the name of an output file to be used instead of stdout.

COMMANDS
       mdb-sql in interactive mode takes some special commands.

       connect to <database>
              If  no database was specified on the command line this command is necessary before any querys are issued. It also allows the switch‐
              ing of databases once in the tool.

       disconnect
              Will disconnect from the current database.

       go     Each batch is sent to the parser using the 'go' command.

       reset A batch can be cleared using the 'reset' command.

       list tables
              The list tables command will display a list of available tables in this database, similar to the mdb-tables utility on  the  command
              line.

       describe table <table>
              Will display the column information for the specified table.

       quit   Will exit the tool.

SQL LANGUAGE
       The  currently  implemented  SQL  subset is quite small, supporting only single table queries, no aggregates, and limited support for WHERE
       clauses. Here is a brief synopsis of the supported language.

       select:
              SELECT [* | <column list>] FROM <table> WHERE <where clause>

       column list:
              <column> [, <column list>]

       where clause:
              <column> <operator> <literal> [AND <where clause>]

       operator:
              =, =>, =<, <>, like, <, >

       literal:
              integers, floating point numbers, or string literal in single quotes

NOTES
       When passing a file (-i) or piping output to mdb-sql the final 'go' is optional. This allow constructs like

       echo "Select * from Table1" | mdb-sql mydb.mdb

       to work correctly.

       The -i command can be passed the string 'stdin' to test entering text as if using a pipe.

ENVIRONMENT
       MDB_JET3_CHARSET
              Defines the charset of the input JET3 (access 97) file. Default is CP1252. See iconv(1).

       MDBICONV
              Defines the output charset. Default is UTF-8. mdbtools must have been compiled with iconv.

       MDBOPTS
              semi-column separated list of options:

              ·  use_index

              ·  no_memo

              ·  debug_like

              ·  debug_write

              ·  debug_usage

              ·  debug_ole

              ·  debug_row

              ·  debug_props

              ·  debug_all is a shortcut for all debug_* options

HISTORY
       mdb-sql first appeared in MDB Tools 0.3.

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-ver(1) mdb-array(1) mdb-header(1) mdb-parsecsv(1) mdb-schema(1) mdb-tables(1) isql(1)

AUTHORS
       The mdb-sql utility was written by Brian Bruns.

BUGS
       The supported SQL syntax is a very limited subset and deficient in several ways.

MDBTools 0.7.1                                                    09 August 2016                                                        mdb-sql(1)
