gnunet-fs(1)                           General Commands Manual                           gnunet-fs(1)

NAME
       gnunet-fs - measure and control the fs subsystem

SYNOPSIS
       gnunet-fs [OPTIONS]

DESCRIPTION
       gnunet-fs  is  a  tool  to  access  various  functions  of GNUnet's fs subsystem from the com‐
       mand-line.  Most of these are not expected to be useful for  end-users.   gnunet-fs  can  cur‐
       rently only be used to obtain a list of indexed files.  Other functions should be added in the
       near future.

       -c FILENAME, --config=FILENAME
              configuration file to use

       -h, --help
              print help page

       -i, --list-indexed
              print information about files that are currently indexed by file-sharing

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -v, --version
              print the version number

       -V, --verbose
              be verbose

NOTES
REPORTING BUGS
       Report bugs by using mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-publish(1)

GNUnet                                        2 Nov 2011                                 gnunet-fs(1)
