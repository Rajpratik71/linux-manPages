CATMAN(8)                                                                                 Manual pager utils                                                                                 CATMAN(8)

NAME
       catman - create or update the pre-formatted manual pages

SYNOPSIS
       catman [-d?V] [-M path] [-C file] [section] ...

DESCRIPTION
       catman  is used to create an up to date set of pre-formatted manual pages known as cat pages.  Cat pages are generally much faster to display than the original manual pages, but require extra
       storage space.  The decision to support cat pages is that of the local administrator, who must provide suitable directories to contain them.

       The options available to catman are the manual page hierarchies and sections to pre-format.  The default hierarchies are those specified as system  hierarchies  in  the  man-db  configuration
       file,  and  the default sections are either the colon-delimited contents of the environment variable $MANSECT or the standard set compiled into man if $MANSECT is undefined.  Supplying catman
       with a set of whitespace-delimited section names will override both of the above.

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
              If $MANSECT is set, its value is a colon-delimited list of sections and it is used to determine which manual sections to search and in what order.  The default is "1 n l 8 3  2  3posix
              3pm 3perl 3am 5 4 9 6 7", unless overridden by the SECTION directive in /etc/manpath.config.

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

2.8.3                                                                                         2018-04-05                                                                                     CATMAN(8)
