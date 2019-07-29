shotwell(1)                General Commands Manual                shotwell(1)

NAME
       shotwell - Digital photo manager

SYNOPSIS
       shotwell [OPTION]... [FILE]

DESCRIPTION
       Shotwell  is  a digital photo organizer designed for the GNOME desktop
       environment.  It allows you to import  photos  from  disk  or  camera,
       organize  them in various ways, view them in full-window or fullscreen
       mode, and export them to share with others.

OPTIONS
       -h, --help Show help options

       -d, --datadir=DIRECTORY
              Path to Shotwell's private data

       --no-runtime-monitoring
              Do not monitor library directory at runtime for changes

       -f, --fullscreen
              Open the viewer mode in fullscreen. Has no  effect  in  library
              mode.

       --no-startup-progress
              Don't display startup progress meter

       -V, --version
              Show the application's version

       --display=DISPLAY
              X display to use

EXAMPLES
       shotwell
              Opens Shotwell with the user's library.

       shotwell FILE
              Opens  an  image file for direct editing.  File is not imported
              into library and unsaved changes are lost on close.

NOTES
       Shotwell homepage: https://wiki.gnome.org/Apps/Shotwell

       Report bugs: https://bugzilla.gnome.org/enter_bug.cgi?product=Shotwell

AUTHOR
       This manual page was written by Jim Nelson jim@yorba.org  and  Allison
       Barlow allison@yorba.org.

                                                                  shotwell(1)
