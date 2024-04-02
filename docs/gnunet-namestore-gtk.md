GNUNET-NAMESTORE-GTK(1)                General Commands Manual                GNUNET-NAMESTORE-GTK(1)

NAME
       gnunet-namestore-gtk - a gtk interface for editing GNS zones

SYNOPSIS
       gnunet-namestore-gtk [OPTIONS]

DESCRIPTION
       gnunet-namestore-gtk  is a gtk+ based GUI for editing zones in the GNU Name System.  It should
       work just like your typical DNS zone editor.  In addition, if built with libqrencode, it  will
       display (and offer to export) a QR code image of the public key for the current zone.

       -h, --help
              print help page

       -c FILENAME, --config=FILENAME
              load config file (default: ~/.config/gnunet.conf)

       -t, --tray
              start with main window minimized (only put icon in tray)

       -v, --version
              print the version number

FILES
       ~/.config/gnunet.conf
              User's GNUnet configuration file

REPORTING BUGS
       Report  bugs  by  using  mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-setup(1)

GNUnet                                        7 Oct 2013                      GNUNET-NAMESTORE-GTK(1)
