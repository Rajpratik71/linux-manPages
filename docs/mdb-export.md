mdb-export(1)                                          Executable programs or shell commands                                         mdb-export(1)

NAME
       mdb-export - Export data in an MDB database table to CSV format.

SYNOPSIS
       mdb-export [-H] [-d delimiter] [-R row_delim] [[-Q] | [-q quote [-X escape]]] [-I backend] [-D format] [-N namespace] [-b strip|raw|octal] database table

DESCRIPTION
       mdb-export is a utility program distributed with MDB Tools.

       It  produces  a  CSV  (comma separated value) output for the given table. Such output is suitable for importation into databases or spread‐
       sheets.

OPTIONS
       -H     Suppress header row

       -Q     Don't wrap text-like fields (text, memo, date) in quotes.  If not specified text fiels will be surrounded by " (double quote)  char‐
              acters.

       -d     Specify an alternative column delimiter If no delimiter is specified, table names will be delimited by a , (comma) character.

       -R     Specify a row delimiter

       -I backend
              INSERT  statements  (instead of CSV). You must specify which SQL backend dialect to use. Allowed values are: access, sybase, oracle,
              postgres, mysql and sqlite.

       -D     Set the date format (see strftime(3) for details)

       -q     Use to wrap text-like fields. Default is ".

       -X     Use to escape quoted characters within a field.  Default is doubling.

       -N namespace
              Prefix identifiers with namespace.

       -b strip|raw|octal
              Binary export mode: strip binaries, export as-is, or output  style octal data.

NOTES
ENVIRONMENT
       MDB_JET3_CHARSET
              Defines the charset of the input JET3 (access 97) file. Default is CP1252. See iconv(1).

       MDBICONV
              Defines the output charset to use for the SQL file. Default is UTF-8. mdbtools must have been compiled with iconv.

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

SEE ALSO
       gmdb2(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-array(1) mdb-header(1) mdb-parsecsv(1) mdb-schema(1) mdb-tables(1)

HISTORY
       mdb-export first appeared in MDB Tools 0.1.

AUTHORS
       The mdb-export utility was written by Brian Bruns.

BUGS
       Memo fields are allowed to contain a newline characters, the current program does nothing about this.

MDBTools 0.7.1                                                    09 August 2016                                                     mdb-export(1)
