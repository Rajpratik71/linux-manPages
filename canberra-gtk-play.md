canberra-gtk-play(1)                                                                     General Commands Manual                                                                     canberra-gtk-play(1)

NAME
       canberra-gtk-play - play a sound event

SYNOPSIS
       canberra-gtk-play [ OPTIONS... ]

DESCRIPTION
       This manual page documents briefly the canberra-gtk-play command.

       canberra-gtk-play plays sound events that are specified by the XDG Sound Theme and Name Specification.

OPTIONS
   Application Options
       -v, --version
              Display version number and quit

       -i, --id=STRING
              Event sound identifier

       -f, --file=PATH
              Play file

       -d, --description=STRING
              Event sound description

       -c, --cache-control={ permanent|volatile|never }
              Specify how canberra-gtk-play manages its cache. permanent will cause the sample to be cached permanently, volatile to be cached until the cache needs to be freed.

       -l, --loop=INTEGER
              Loop how many times (default: 1)

       -V, --volume=STRING
              A floating point dB value for the sample volume (ex: 0.0)

       --property=STRING
              An arbitrary property

       --display=DISPLAY
              X display to use

   Help Options
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

   GTK+ Options
       --class=CLASS
              Program class as used by the window manager

       --name=NAME
              Program name as used by the window manager

       --screen=SCREEN
              X screen to use

       --sync Make X calls synchronous

       --gtk-module=MODULES
              Load additional GTK+ modules

       --g-fatal-warnings
              Make all warnings fatal

AUTHORS
       canberra-gtk-play is Copyright 2008 Lennart Poettering.

       This manual page was written by Francois Wendling <frwendling@free.fr> for the Debian GNU/Linux system (but may be used by others).

                                                                                                2010-08-01                                                                           canberra-gtk-play(1)
