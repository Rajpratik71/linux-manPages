mdb-header(1)                                          Executable programs or shell commands                                         mdb-header(1)

NAME
       mdb-header - Write header file from an MDB database

SYNOPSIS
       mdb-header [database]

DESCRIPTION
       mdb-header is a utility program distributed with MDB Tools.

       It will dump the names and types of the tables and columns in an MDB database in a C header format.

       It will create three files - types.h and dumptypes.[ch]

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

EXIT STATUS
       mdb-header exits with error code 1 if there was anunsupported type.

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-array(1) mdb-parsecsv(1) mdb-schema(1) mdb-tables(1)

AUTHORS
       The mdb-header utility was written by Brian Bruns.

BUGS
       Only a few types are currently supported.

MDBTools 0.7.1                                                    09 August 2016                                                     mdb-header(1)
