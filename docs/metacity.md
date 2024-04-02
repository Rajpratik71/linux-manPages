METACITY(1)                                                   General Commands Manual                                                  METACITY(1)

NAME
       METACITY - minimal GTK3 Window Manager

SYNOPSIS
       metacity  [--display=DISPLAY] [--replace] [--sm-client-id=ID] [--sm-disable] [--sm-save-file=FILENAME] [--sync] [--composite] [--no-compos‐
       ite] [--no-force-fullscreen] [--version] [--help]

DESCRIPTION
       This manual page documents briefly metacity.

       metacity is a minimal X window manager aimed at nontechnical users and is designed to integrate well  with  the  GNOME  desktop.   metacity
       lacks  some features that may be expected by traditional UNIX or other technical users; these users may want to investigate other available
       window managers for use with GNOME or standalone.

OPTIONS
       --display=DISPLAY
              Connect to X display DISPLAY.

       --replace
              a window manager which is running is replaced by metacity.  Users are encouraged to change the GNOME window manager by  running  the
              new WM with the --replace or -replace option, and subsequently saving the session.

       --sm-client-id=ID
              Specify a session management ID.

       --sm-disable
              Disable the session management.

       --sm-save-file=FILENAME
              Load a session from FILENAME.

       --sync Make X calls synchronous

       --composite
              Turn compositing on

       --no-composite
              Turn compositing off

       --no-force-fullscreen
              Don't make fullscreen windows that are maximized and have no decorations

       --version
              Print the version number.

       -?, --help
              Show summary of options.

CONFIGURATION
       metacity  configuration  can be found under Preferences->Windows and Preferences->Keyboard Shortcuts on the menu-panel. Advanced configura‐
       tion can be achieved directly through gsettings.

SEE ALSO
       metacity-message(1)

AUTHOR
       The original manual page was written by Thom May <thom@debian.org>.  It was updated  by  Akira  TAGOH  <tagoh@debian.org>  for  the  Debian
       GNU/Linux system (with permission to use by others), and then updated by Luke Morton and Philip O'Brien for inclusion in metacity.

                                                                    16 May 2013                                                        METACITY(1)
