Nautilus(1)                General Commands Manual                Nautilus(1)

NAME
       nautilus - a file manager for GNOME

SYNOPSIS
       nautilus [options] URIs...

DESCRIPTION
       nautilus is a file manager, designed for the GNOME 3 desktop.

OPTIONS
       -c, --check
              Perform a quick set of self-check tests.

       --version
              Show the version of the program.

       -g, --geometry=GEOMETRY
              Create the initial window with the given geometry. Deprecated -
              the geometry is saved and loaded using GSettings.

       -w, --new-window
              Always open a new window for browsing specified URIs.

       -n, --no-default-window
              Only create windows for explicitly specified URIs.

       --no-desktop
              Never manage the desktop  (ignore  the  GSettings  preference).
              Deprecated - the desktop is managed in a separate binary.

       -q, --quit
              Quit Nautilus.

       -s, --select
              Select specified URI in parent folder.

       -h, --help
              Show a summary of options.

       Other standard GNOME options not listed here are also supported.

SEE ALSO
       The documentation may be accessed by pressing F1 in the application or
       via the application menu.

       For      further      information,       visit       the       website
       https://wiki.gnome.org/Apps/Nautilus

BUGS
       All  bugs  in the application may be reported at the GNOME Bugzilla at
       https://bugzilla.gnome.org/buglist.cgi?product=nautilus

                              23 September 2016                   Nautilus(1)
