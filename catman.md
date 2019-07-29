CATMAN(8)                                                                                     Manual pager utils                                                                                    CATMAN(8)



NAME
       catman - create or update the pre-formatted manual pages

SYNOPSIS
       catman [-d?V] [-M path] [-C file] [section] ...

DESCRIPTION
       catman is used to create an up to date set of pre-formatted manual pages known as cat pages.  Cat pages are generally much faster to display than the original manual pages, but require extra storage
       space.  The decision to support cat pages is that of the local administrator, who must provide suitable directories to contain them.

       The options available to catman are the manual page hierarchies and sections to pre-format.  The default hierarchies are those specified as system hierarchies in the man-db configuration  file,  and
       the  default  sections  are  either  the colon-delimited contents of the environment variable $MANSECT or the standard set compiled into man if $MANSECT is undefined.  Supplying catman with a set of
       whitespace-delimited section names will override both of the above.

       catman makes use of the index database cache associated with each hierarchy to determine which files need to be formatted.

OPTIONS
       -d, --debug
              Print debugging information.

       -M path, --manpath=path
              Specify an alternate colon-delimited manual page hierarchy search path.  By default, this is all paths indicated as system hierarchies in the man-db configuration file.

       -C file, --config-file=file
              Use this user configuration file rather than the default of ~/.manpath.

       -?, --help
              Print a help message and exit.

       --usage
              Print a short usage message and exit.

       -V, --version
              Display version information.

ENVIRONMENT
       MANSECT
              If $MANSECT is set, its value is a colon-delimited list of sections and it is used to determine which manual sections to search and in what order.  The default is "0 1 n l 8 3 2 5 4 9 6 7  1x
              3x  4x  5x 6x 8x 1bind 3bind 5bind 7bind 8bind 1cn 8cn 1m 1mh 5mh 8mh 1netpbm 3netpbm 5netpbm 0p 1p 3p 3posix 1pgsql 3pgsql 5pgsql 3C++ 8C++ 3blt 3curses 3ncurses 3form 3menu 3db 3gdbm 3f 3gk
              3paper 3mm 5mm 3perl 3pm 3pq 3qt 3pub 3readline 1ssl 3ssl 5ssl 7ssl 3t 3tk 3tcl 3tclx 3tix 7l 7nr 8c Cg g s m", unless overridden by the SECTION directive in /etc/manpath.config.

       MANPATH
              If $MANPATH is set, its value is interpreted as the colon-delimited manual page hierarchy search path to use.

FILES
       /etc/manpath.config
              man-db configuration file.

       /usr/man/index.(bt|db|dir|pag)
              A traditional global index database cache.

       /var/catman/index.(bt|db|dir|pag)
              An alternate or FSSTND compliant global index database cache.

SEE ALSO
       man(1), manpath(5), mandb(8)

AUTHOR
       Wilf. (G.Wilford@ee.surrey.ac.uk).
       Fabrizio Polacco (fpolacco@debian.org).
       Colin Watson (cjwatson@debian.org).



2.6.6                                                                                             2014-01-23                                                                                        CATMAN(8)
