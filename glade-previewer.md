GLADE-PREVIEWER(1)                                                 User Commands                                                GLADE-PREVIEWER(1)

NAME
       glade-previewer - Preview glade user interface definitions

SYNOPSIS
       glade-previewer [OPTION...]

DESCRIPTION
       glade-previewer is a tool that can load and display a User Interface that has been defined with glade. glade itself uses glade-previewer,
       but it can also be used as a standalone utility.

OPTIONS
       The following options can be specified:

       -f FILENAME, --filename=FILENAME
           Name of the file to preview.

       -t TOPLEVEL, --toplevel=TOPLEVEL
           Name of the toplevel to preview.

       -l, --listen
           Listen on standard input.

       -v, --version
           Output version information and exit.

       --display=DISPLAY
           X display to use.

       One of the --filename or --listen options has to be specified.

SEE ALSO
       glade(1)

GNOME                                                                                                                           GLADE-PREVIEWER(1)
