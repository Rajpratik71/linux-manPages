gnunet-datastore(1)                    General Commands Manual                    gnunet-datastore(1)

NAME
       gnunet-datastore - merge or convert GNUnet datastore databases

SYNOPSIS
       gnunet-datastore [OPTIONS]

DESCRIPTION
       gnunet-datastore can be used to convert or merge GNUnet datastores.  This is useful if a data‐
       store is to be migrated between SQL databases, i.e. from sqlite to  postgres  or  vice  versa.
       gnunet-datastore  basically  takes two configuration files (which must specify different data‐
       bases) and reads in all of the data from the datasource (-s option) and copies it to the  des‐
       tination  (-c option).  Note that replication level information is lost in the process at this
       time.

       -c FILENAME, --config=FILENAME
              configuration file to use for the destination database

       -h, --help
              print help page

       -i, --list-indexed
              print information about files that are currently indexed by file-sharing

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -s FILENAME, --sourcecfg=FILENAME
              configuration file to use for the source database

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

GNUnet                                       30 May 2013                          gnunet-datastore(1)
