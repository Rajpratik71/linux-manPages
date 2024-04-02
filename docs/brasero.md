BRASERO(1)                                                                                 General Commands Manual                                                                                 BRASERO(1)



NAME
       brasero - Simple and easy to use CD/DVD burning application for the Gnome Desktop

SYNOPSIS
       brasero [options] [uri] [uri] ...

DESCRIPTION
       This manual page documents briefly the brasero command.

       Brasero is a disc burning application. It is designed to be simple and easy to use.  It allows to create data CD/DVD, audio CD, to copy CD/DVD and to burn images. It has some nices features, such as
       a song, image and video previewer. It can also search for files (thanks to beagle) and display a playlist and its contents.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included below.  For a complete description, see the Info files.

       -p, --project=PROJECT
              Open the specified project.

       -a, --audio
              Open an empty audio project.

       -d, --data
              Open an empty data project.

       -c, --copy=PATH
              Copy a disc.

       -j, --cover=PATH
              Cover to use.

       -o, --video
              Open a video project adding the URIs given on the command line.

       -i, --image=PATH
              Uri of an image file or a cue file to be burnt (autodetected).

       -e,  --empty
              Force brasero to display the project selection page.

       -b,  --blank
              Open the blank disc dialog.

       -k, --check
              Open the check disc dialog.

       -n, --ncb
              Open a data project with the contents of burn:/// URI.

       -r, --burn-and-remove-project=PATH
              Burn the specified project and REMOVE it.

       --display=DISPLAY
              X display to use.

       -?, --help
              Show summary of options.

AUTHOR
       Brasero manual page was written by Philippe Rouquier <philippero@libertysurf.fr> and Luis Medinas <lmedinas@gmail.com>.



GNOME                                                                                          January 11, 2009                                                                                    BRASERO(1)
