MUTTER(1)                  General Commands Manual                  MUTTER(1)

NAME
       MUTTER - Clutter based compositing GTK2 Window Manager

SYNOPSIS
       mutter  [--display=DISPLAY] [--replace] [--sm-client-id=ID] [--sm-dis‐
       able] [--sm-save-file=FILENAME] [--version] [--help]

DESCRIPTION
       This manual page documents briefly mutter.

       mutter is a minimal X window manager aimed at nontechnical  users  and
       is  designed  to  integrate well with the GNOME desktop.  mutter lacks
       some features that may be expected by traditional UNIX or other  tech‐
       nical  users; these users may want to investigate other available win‐
       dow managers for use with GNOME or standalone.

OPTIONS
       --display=DISPLAY
              Connect to X display DISPLAY.

       --replace
              a window manager which is running is replaced by mutter.  Users
              are  encouraged  to  change the GNOME window manager by running
              the new WM with the --replace or -replace  option,  and  subse‐
              quently saving the session.

       --sm-client-id=ID
              Specify a session management ID.

       --sm-disable
              Disable the session management.

       --sm-save-file=FILENAME
              Load a session from FILENAME.

       --version
              Print the version number.

       -?, --help
              Show summary of options.

CONFIGURATION
       mutter configuration can be found under Preferences->Windows and Pref‐
       erences->Keyboard Shortcuts on the menu-panel. Advanced  configuration
       can be achieved directly through gsettings.

SEE ALSO
       mutter-message(1)

AUTHOR
       The  original  manual  page was written by Thom May <thom@debian.org>.
       It was updated  by  Akira  TAGOH  <tagoh@debian.org>  for  the  Debian
       GNU/Linux  system (with permission to use by others), and then updated
       by Luke Morton and Philip O'Brien for inclusion in mutter.

                               11 February 2006                     MUTTER(1)
