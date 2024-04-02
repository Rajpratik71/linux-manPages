mdb-tables(1)                                          Executable programs or shell commands                                         mdb-tables(1)

NAME
       mdb-tables - Get listing of tables in an MDB database

SYNOPSIS
       mdb-tables [-S] [-1 | -d delimiter] database

DESCRIPTION
       mdb-tables is a utility program distributed with MDB Tools.

       It produces a list of tables contained within an MDB database in a format suitable for use in shell scripts.

OPTIONS
       -S     Show system tables. System tables are generally those beginning with 'MSys'

       -1     specifies that the tables should be listed 1 per line.

       -d delimiter
              specifies an alternative delimiter. If no delimiter is specified, table names will be delimited by a tab character, or by newline if
              the -1 option was specified.

NOTES
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
       mdb-tables first appeared in MDB Tools 0.3.

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-array(1) mdb-header(1) mdb-parsecsv(1) mdb-schema(1)

AUTHORS
       The mdb-tables utility was written by Brian Bruns.

BUGS
       Access allows for tables to have spaces embeded in the table name.
              You must specify a delimiter (-d) if you intend on piping the output of mdb-tables to a program such as awk or cut.

MDBTools 0.7.1                                                    09 August 2016                                                     mdb-tables(1)
