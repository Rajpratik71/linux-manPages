ACCESSDB(8)                                                                                 Manual pager utils                                                                                ACCESSDB(8)

NAME
       accessdb - dumps the content of a man-db database in a human readable format

SYNOPSIS
       /usr/sbin/accessdb [-d?V] [<index-file>]

DESCRIPTION
       accessdb will output the data contained within a man-db database in a human readable form.  By default, it will dump the data from /var/cache/man/index.<db-type>, where <db-type> is dependent on
       the database library in use.

       Supplying an argument to accessdb will override this default.

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

2.7.5                                                                                           2015-11-06                                                                                    ACCESSDB(8)
