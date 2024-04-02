IBUS-TABLE-CREATEDB(1)                                                                                                                                                          IBUS-TABLE-CREATEDB(1)

NAME
       ibus-table-createdb - create ibus-table database from table source

SYNOPSIS
       ibus-table-createdb  [  -n  name  |  --name name ] [ -s source | --source source ] [ -e extra | --extra extra ] [ -p pinyin | --pinyin pinyin ] [ -o ] [ --no-create-index ] [ -i ] [ --create-
       index-only ] [ -d ] [ --debug ]

DESCRIPTION
       ibus-table-createdb creates a database for ibus-table from a source table.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included below.

       -n --name database-file
              database-file specifies the file name for the binary database for the IME. The default is ''. If the file name of the database is not specified, the file name of the source file before
              the first '.' will be appended with '.db' and that will be used as the file name of the database.

       -s --source source-file
              source-file specifies the file which contains the source of the IME.  The default is ''.

       -e --extra extra-words-file
              extra-words-file specifies the file name for the extra words for the IME.  The default is ''.

       -p --pinyin pinyin-file
              pinyin-file specifies the source file for the pinyin.  The default is '/usr/share/ibus-table/data/pinyin_table.txt.bz2'.

       -o --no-create-index
              Do not create an index for a database (Only for distribution purposes, a normal user should not use this flag!)

       -i --create-index-only
              Only create an index for an existing database. Specifying the file name of the binary database with the -n or --name option is required when this option is used.

       -d --debug
              Print extra debug messages.

EXAMPLES
       ibus-table-createdb -n ipa-x-sampa.db -s ipa-x-sampa.txt
              Create the binary database ``ipa-x-sampa.db'' from the source file ``ipa-x-sampa.txt''.

       ibus-table-createdb -i -n ipa-x-sampa.db
              Create an index for the database ``ipa-x-sampa.db''.

AUTHOR
       This manual page was written by Mike FABIAN <mfabian@redhat.com>.

                                                                                             Apr 18, 2013                                                                       IBUS-TABLE-CREATEDB(1)
