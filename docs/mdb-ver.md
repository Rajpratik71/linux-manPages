mdb-ver(1)                                             Executable programs or shell commands                                            mdb-ver(1)

NAME
       mdb-ver - Return the format of a given MDB database.

SYNOPSIS
       mdb-ver database
       mdb-ver -M

DESCRIPTION
       mdb-ver is a utility program distributed with MDB Tools.

       It  will return a single line of output with 'JET3' for those files produced in Access 97 format, 'JET4' for those produced by Access 2000,
       XP and 2003, 'ACE12' for those produced by Access 2007, or 'ACE14' for those produced by Access 2010.

OPTIONS
       -M     Prints the version of MDB Tools itself instead of the MDB file.

NOTES
       Access changed its format between Jet 3 used in Access 97 and Jet 4 used for Access 2000 and XP. The nature of the changes included  moving
       the page size from 2K to 4K and added support for unicode. MDB Tools actively supports both formats. Newer version are very much like Jet4.

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
       mdb-ver first appeared in MDB Tools 0.4.

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-array(1) mdb-header(1) mdb-parsecsv(1) mdb-schema(1) mdb-tables(1)

AUTHORS
       The mdb-ver utility was written by Brian Bruns.

BUGS
       mdb-ver does minimal checking on the validity of a file. It is possbile for it to misidentify a non-MDB file.

       mdb-ver does not recognize Access 2.0 (Jet 2).

MDBTools 0.7.1                                                    09 August 2016                                                        mdb-ver(1)
