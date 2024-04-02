mousetweaks(1)                                                                          General Commands Manual                                                                         mousetweaks(1)

NAME
       mousetweaks - Accessibility enhancements for pointing devices

SYNOPSIS
       mousetweaks [--dwell] [--ssc] [--dwell-time=FLOAT] [--ssc-time=FLOAT] [-m|--dwell-mode=STRING] [-c|--show-ctw] [-t|--threshold=INT] [-g|--geometry] [-s|--shutdown] [--daemonize] [-?|--help]

DESCRIPTION
       mousetweaks is a collection of accessibility enhancements for pointing devices. This manual page describes the mousetweaks daemon.

OPTIONS
       --dwell
              Automatically perform mouse clicks without using a physical button.

       --ssc  Trigger the secondary mouse button when the primary mouse button is held down for a specified amount of time.

       --dwell-time=FLOAT
              Time to keep the pointer motionless before a dwell click is performed.  Range: 0.2 - 3.0 seconds.

       --ssc-time=FLOAT
              Time to hold the primary mouse button before a simulated secondary click is performed. Range: 0.5 - 3.0 seconds.

       -m, --dwell-mode=STRING
              Select a dwell mode. Available options: window - Select the click type from a window or a panel applet.  gesture - Perform different clicks by moving in different directions.

       -c, --show-ctw
              Show the click-type window. Only useful in combination with --dwell-mode=window.

       -t, --threshold=INT
              Ignore small pointer movements. Range: 0 - 30 pixels.

       -g, --geometry
              Size and position of the click-type window. Expects a standard X Window System geometry string. ie. WIDTHxHEIGHT+X+Y

       -s, --shutdown
              Stop the mousetweaks daemon.

       --daemonize
              Start mousetweaks in the background, ie. spawn a child process.

       --login
              Start mousetweaks in login mode. Login mode enables workarounds specific to GDM. Currently unused.

FILES
       mousetweaks.pid
              The daemon creates a lock file in the $XDG_RUNTIME_DIR directory to keep track of its state. On systems with no user runtime directory, the $XDG_CACHE_HOME directory is used.

BUGS
       Report bugs to <http://bugzilla.gnome.org/> ⟨http://bugzilla.gnome.org/⟩

AUTHORS
       This manual page was written by Francesco Fumanti.

LICENSE
       Licenced under the GNU General Public License v3 or later.

                                                                                                                                                                                        mousetweaks(1)
