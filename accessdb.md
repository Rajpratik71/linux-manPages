ACCESSDB(8)                                                                                   Manual pager utils                                                                                  ACCESSDB(8)



NAME
       accessdb - dumps the content of a man-db database in a human readable format

SYNOPSIS
       /usr/sbin/accessdb [-d?V] [<index-file>]

DESCRIPTION
       accessdb will output the data contained within a man-db database in a human readable form.  By default, it will dump the data from /var/cache/man/index.<db-type>, where <db-type> is dependent on the
       database library in use.

       Supplying an argument to accessdb will override this default.

       $mtime$ -> "795987034"
       $version$ -> "2.3.1"
       apropos -> "1 1 795981542 A - - search the manual page names and descriptions"
       catman -> "8 8 795981544 A - - create or update the pre-formatted manual pages"
       man -> "1 1 795981542 A - - an interface to the on-line reference manuals"
       mandb -> "8 8 795981544 A - - create or update the manual page index caches"
       manpath -> " 1 5"
       manpath~1 -> "1 1 795981542 A - - determine search path for manual pages"
       manpath~5 -> "5 5 795981543 A - - format of the /etc/man_db.config file"
       whatis -> "1 1 795981543 A - - search the manual page names"
       zsoelim -> "1 1 795981543 A - - satisfy .so requests in roff input"

OPTIONS
       -d, --debug
              Print debugging information.

       -?, --help
              Print a help message and exit.

       --usage
              Print a short usage message and exit.

       -V, --version
              Display version information.

AUTHOR
       Wilf. (G.Wilford@ee.surrey.ac.uk).
       Fabrizio Polacco (fpolacco@debian.org).
       Colin Watson (cjwatson@debian.org).



2.6.6                                                                                             2014-01-23                                                                                      ACCESSDB(8)
