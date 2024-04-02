GNUNET-FS-GTK(1)                       General Commands Manual                       GNUNET-FS-GTK(1)

NAME
       gnunet-fs-gtk - a gtk interface for accessing GNUnet

SYNOPSIS
       gnunet-fs-gtk [OPTIONS]

DESCRIPTION
       gnunet-fs-gtk  is  a gtk+ based GUI for searching, downloading and publishing files on GNUnet.
       It supports queries of the form "foo bar" or "+foo +bar" for  both  keywords  being  mandatory
       (note that keywords are case-sensitive), just like gnunet-search.

       -h, --help
              print help page

       -c FILENAME, --config=FILENAME
              load config file (default: ~/.config/gnunet.conf)

       -t, --tray
              start with main window minimized (only put icon in tray)

       -v, --version
              print the version number

NOTES
       Some functionality of gnunet-fs-gtk can be accessed by pressing down the right mouse button in
       appropriate locations.

FILES
       ~/.config/gnunet.conf
              User's GNUnet configuration file

REPORTING BUGS
       Report bugs by using mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-search(1), gnunet-publish(1), gnunet-download(1), gnunet.conf(5), gnunet-arm(1)

GNUnet                                       25 Feb 2012                             GNUNET-FS-GTK(1)
