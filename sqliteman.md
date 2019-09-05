SQLITEMAN(1)                                                  General Commands Manual                                                 SQLITEMAN(1)

NAME
       sqliteman - GUI SQL admin tool

SYNOPSIS
       sqliteman [options] [databasefile]

DESCRIPTION
       sqliteman is a GUI tool for use by admins and developers to query, modify and examine SQLite compatible database files.

       It  offers  an  interface  similar  to other GUI query tools, for example MySQL Query Browser, and allows the user to issue SQL queries and
       examine the database schema.  In addition there are dialogs for creating tables and views, building simple queries  and  analyzing  statis‐
       tics, as well as importing and exporting data.

OPTIONS
       This program follow the usual GNU command line syntax, with long options starting with two dashes (`-').

       -h, --help
              Show summary of options.

       -v, --version
              Show version of program.

       -l, --lang
              Set a GUI language. E.g. --lang cs for Czech

       -la, --langs
              Lists available languages

       ( + various Qt options )

SEE ALSO
       sqliteman has documentation accessible from the Help menu within the application.

       sqliteman's website: http://sqliteman.com/

AUTHOR
       sqliteman was written by Petr Vanek.

       This manual page was written by David Claughton <dave@eclecticdave.com>, for the Debian project (but may be used by others).

                                                                   May 22, 2009                                                       SQLITEMAN(1)
