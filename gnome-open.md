gnome-open(1)                                                                            General Commands Manual                                                                            gnome-open(1)

NAME
       gnome-open - Open files and URLs using the GNOME file handlers

SYNOPSIS
       gnome-open [OPTION]... [URL]...

DESCRIPTION
       This program opens files using file handlers configured in GNOME.

OPTIONS
       Usage: gnome-open [OPTION...]

       Dynamic Modules

       --load-modules=MODULE1,MODULE2,...
              Dynamic modules to load

       Help Options

       -?, --help
              Show a brief help message

       --usage
              Display a brief usage message

       Bonobo activation Support

       --oaf-ior-fd=FD
              File descriptor to print IOR on

       --oaf-activate-iid=IID
              IID to activate

       --oaf-private
              Prevent registering of server with OAF

       GNOME Library

       --disable-sound
              Disable sound server usage

       --enable-sound
              Enable sound server usage

       --espeaker=HOSTNAME:PORT
              Host:port on which the sound server to use is running

       --version
              Prints the version number

EXAMPLES
       Open a web page
              gnome-open www.gnome.org

       Open an OpenOffice.org document
              gnome-open Spinach.odf

       Open a directory in Nautilus
              gnome-open ~

       Send an e-mail
              gnome-open mailto:gnome-list@mail.gnome.org

       Possible useless use of gnome-open
              gnome-open /usr/share/applications/gedit.desktop

REPORTING BUGS
       Please report bugs at http://bugzilla.gnome.org/

AUTHOR
       This manual page was written by Jonathan Carter <jonathan@ubuntu.com>

GNOME                                                                                           2008-07-04                                                                                  gnome-open(1)
