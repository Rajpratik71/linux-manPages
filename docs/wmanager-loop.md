WMANAGER-LOOP(1)       BSD General Commands Manual      WMANAGER-LOOP(1)

NAME
     wmanager-loop — loop running window managers chosen with wmanager

SYNOPSIS
     wmanager-loop [OPTIONS ...]

DESCRIPTION
     The wmanager-loop program starts either the window manager speci‐
     fied by the WM variable or the first window manager listed in
     ~/.wmanagerrc (or an X terminal emulator if none), and when it
     exits, runs wmanager(1) to prompt the user for the next window man‐
     ager.  It loops doing this until the user chooses “Exit this
     session” in wmanager(1).  Any options given to wmanager-loop will
     be passed on to wmanager(1).

     If the WM environment variable is set, the wmanager-loop program
     tries to interpret it as a window manager specification in the fol‐
     lowing ways in the specified order:

     ·   a full path to an executable file to run as the window manager;

     ·   the name of a window manager listed in the /.wmanagerrc file;
         e.g.  “fluxbox” would match the following line:

               fluxbox=/usr/bin/startfluxbox

     ·   the program name of a window manager listed in the /.wmanagerrc
         file; e.g.  “startfluxbox” would match the above example.

     ·   the start of such a program name; e.g.  “start” would match the
         above example.

     ·   the end of such a program name; e.g.  “box” would match the
         above example.

     If the WM variable is set and there is more than one line in
     ~/.wmanagerrc that matches the specification, wmanager-loop will
     exit with an error message.

     As mentioned above, if no window manager is specified in the WM
     environment variable or found in the ~/.wmanagerrc file, the
     wmanager-loop program attempts to start an X terminal emulator.  If
     the WMTERM environment variable is set, the wmanager-loop program
     uses it as the path to the emulator.  Otherwise it searches the
     user's path for a program named “x-terminal-emulator”, “urxvt”,
     “rxvt”, or “xterm” in this order, and starts the first one found
     using its full path.  If none of the common terminal emulators on
     the above list is found, the wmanager-loop program just runs
     “xterm” in the hope that something will come up on the user's dis‐
     play.

ENVIRONMENT
     The wmanager-loop program uses the following environment variables:

     WM      The name, path, or partial path to the first window manager
             to execute.

     WMTERM  The name of the X terminal emulator to execute if no window
             manager could be found in the ~/.wmanagerrc file.  If not
             specified, the wmanager-loop program searches the user's
             path as described above.

EXAMPLE
     To start using wmanager-loop, create a ~/.wmanagerrc file - gener‐
     ally with wmanagerrc-update(1) - and add something like the follow‐
     ing at the end of your ~/.xsession file:

           exec wmanager-loop -geometry +570+585

SEE ALSO
     wmanager(1), wmanagerrc-update(1)

HISTORY
     The wmanager-loop program was written by Tommi Virtanen in 2000 and
     later modified by Peter Pentchev.  This manual page was originally
     written in perldoc format by Tommi Virtanen in 2000, and converted
     to mdoc format and updated by Peter Pentchev in 2008.

AUTHORS
     Tommi Virtanen ⟨tv@debian.org⟩
     Peter Pentchev ⟨roam@ringlet.net⟩

BSD                         September 8, 2009                        BSD
