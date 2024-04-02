GNUNET-UNINDEX(1)                      General Commands Manual                      GNUNET-UNINDEX(1)

NAME
       gnunet-unindex - a command line interface for deleting indexed files from GNUnet

SYNOPSIS
       gnunet-unindex [OPTIONS] FILENAME

DESCRIPTION
       gnunet-unindex is used for deleting indexed files from GNUnet.

       -c FILENAME, --config=FILENAME
              use config file (defaults: ~/.config/gnunet.conf)

       -h, --help
              print help page

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change  the  loglevel.   Possible values for LOGLEVEL are NOTHING, ERROR, WARNING, INFO
              and DEBUG.

       -v, --version
              print the version number

       -V, --verbose
              be verbose

NOTES
       You can only unindex files that you indexed and that you still have available locally in full.
       You  should use gnunet-unindex on files that you indexed (not inserted) and that you are going
       to delete or move locally.

       FILES

       ~/.config/gnunet.conf
              GNUnet configuration file

REPORTING BUGS
       Report bugs to <https://gnunet.org/bugs/> or by sending electronic  mail  to  <gnunet-develop‐
       ers@gnu.org>

SEE ALSO
       gnunet-fs-gtk(1), gnunet-publish(1), gnunet-search(1), gnunet-download(1), gnunet.conf(5)

GNUnet                                        6 Sep 2009                            GNUNET-UNINDEX(1)
