mdb-parsecsv(1)                                        Executable programs or shell commands                                       mdb-parsecsv(1)

NAME
       mdb-parsecsv - Convert CSV table dump into C file.

SYNOPSIS
       mdb-parsecsv file

DESCRIPTION
       mdb-parsecsv is a utility program distributed with MDB Tools.

       mdb-parsecsv takes a CSV file representing a database table, and converts it into a C array.

NOTES
       If the first argument does not exist as a file, mdb-parsecsv will look for the same filename with '.txt' appended.

       The file extension is stripped, and the output written to the base name plus a '.c' extension.

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
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-array(1) mdb-header(1) mdb-schema(1) mdb-tables(1)

AUTHORS
       The mdb-parsecsv utility was written by Brian Bruns.

MDBTools 0.7.1                                                    09 August 2016                                                   mdb-parsecsv(1)
