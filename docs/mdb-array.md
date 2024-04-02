mdb-array(1)                                           Executable programs or shell commands                                          mdb-array(1)

NAME
       mdb-array - Export data in an MDB database table to a C array.

SYNOPSIS
       mdb-array database table

DESCRIPTION
       mdb-array is a utility program distributed with MDB Tools.

       mdb-array prints a C source code file to stdout, containing an array representing the data of the specified table.

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

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-header(1) mdb-parsecsv(1) mdb-schema(1) mdb-tables(1)

AUTHORS
       The mdb-array utility was written by Brian Bruns.

MDBTools 0.7.1                                                    09 August 2016                                                      mdb-array(1)
