TWPRINT(8)                                                    System Manager's Manual                                                   TWPRINT(8)

NAME
       twprint - Tripwire database and report printer

SYNOPSIS
       twprint { -m r | --print-report } [ options... ]
       twprint { -m d | --print-dbfile } [ options... ]
             [ object1 [ object2... ]]

DESCRIPTION
       Prints Tripwire database and report files in clear text format.

   Report Printing mode
       In Report Printing mode, twprint verifies and displays the contents of a Tripwire report file (.twr).  If no report is specified on the
       command line, the report specified in the REPORTFILE variable in the configuration file will be used.  By default, this value includes the
       date and time to the nearest second.  Because this value is constantly changing, twprint may not be able to find the correct report file.
       For this reason, the (-r or --twrfile) flag should be used with the desired report name to print a specific report.

   Database Printing mode
       This option is used to print a Tripwire database file in human-readable (clear text) form.  In Database Printing mode, twprint verifies and
       prints the contents of a specified database to stdout.  If no database file is specified on the command line, the default database
       specified by the DBFILE variable in the configuration file is used.

OPTIONS
   Report printing mode:
           -m r               --print-report
           -v                 --verbose
           -s                 --silent, --quiet
           -c cfgfile         --cfgfile cfgfile
           -r report          --twrfile report
           -L localkey        --local-keyfile localkey
           -t { 0|1|2|3|4 }   --report-level { 0|1|2|3|4 }

       -m r, --print-report
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -r report, --twrfile report
              Print the specified report file.

       -L localkey, --local-keyfile localkey
              Use the specified local key file to perform verification with reports which are signed.

       -t level, --report-level level
              Specifies the detail level of the printed report, overriding the REPORTLEVEL variable in the configuration file. level must be a
              number from 0 to 4.

   Database printing mode:
           -m d           --print-dbfile
           -v             --verbose
           -s             --silent, --quiet
           -c cfgfile     --cfgfile cfgfile
           -d database    --dbfile database
           -L localkey    --local-keyfile localkey
           [ object1 [ object2... ]]

       -m d, --print-dbfile
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -d database, --dbfile database
              Print the specified database file.

       -L localkey, --local-keyfile localkey
              Use the specified local key file to read the database.

       [ object1 [ object2... ]]
              List of filesystem objects in the database to print. If no objects are specified, every object in the database will be printed. The
              format for a list of objects is: section: objname objname... section: objname...

VERSION INFORMATION
       This man page describes twprint version 2.4.

AUTHORS
       Tripwire, Inc.

COPYING PERMISSIONS
       Permission is granted to make and distribute verbatim copies of this man page provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this man page under the conditions for verbatim copying, provided that
       the entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this man page into another language, under the above conditions for modified
       versions, except that this permission notice may be stated in a translation approved by Tripwire, Inc.

       Copyright 2000 Tripwire, Inc. Tripwire is a registered trademark of Tripwire, Inc. in the United States and other countries. All rights
       reserved.

SEE ALSO
       twintro(8), tripwire(8), twadmin(8), siggen(8), twconfig(4), twpolicy(4), twfiles(5)

                                                                    1 July 2000                                                         TWPRINT(8)
