FIREFOX(1)                                                                                   Linux User's Manual                                                                                   FIREFOX(1)



NAME
       firefox - a Web browser for X11 derived from the Mozilla browser


SYNOPSIS
       firefox [OPTIONS] [URL]


DESCRIPTION
       Mozilla Firefox is an open-source web browser, designed for standards compliance, performance and portability.


USAGE
       firefox is a simple shell script that will set up the environment for the actual executable.


OPTIONS
       A summary of the options supported by firefox is included below.


   GTK options
       --gdk-debug=FLAGS Gdk debugging flags to set

       --gdk-no-debug=FLAGS
              Gdk debugging flags to unset

       --gtk-debug=FLAGS
              Gtk+ debugging flags to set

       --gtk-no-debug=FLAGS
              Gtk+ debugging flags to unset

       --gtk-module=MODULE
              Load an additional Gtk module


   X11 options
       --display=DISPLAY
              X display to use

       --sync Make X calls synchronous

       --no-xshm
              Don't use X shared memory extension

       --xim-preedit=STYLE

       --xim-status=STYLE

       --g-fatal-warnings
              Make all warnings fatal


   Firefox options
       -h, -help
              Show summary of options.

       -height value
              Set height of startup window to value.

       -width value
              Set width of startup window to value.

       -v, -version
              Print /usr/bin/firefox-bin version.

       -CreateProfile profile
              Create profile.

       -P profile
              Start with profile.

       -ProfileManager
              Start with profile manager.

       -UILocale lang-region
              Start with lang-region resources.

       -contentLocale lang-region
              Start with lang-region resources.

       -remote command
              Execute command in an already running Firefox process.  For more info, see: http://www.mozilla.org/unix/remote.html

       -no-remote
              Don't try to control an already running instance.

       -jsconsole
              Start with Javascript Console

       -chrome url
              Load the specified chrome.

       -new-window url
              Open URL in a new window if Firefox is already running.

       -new-tab url
              Open URL in a new tab if Firefox is already running.

       -preferences
              Open Firefox preferences menu.

       -safe-mode
              Disables extensions and themes for this session.



       FILES  /usr/bin/firefox - shell script wrapping firefox
              /usr/lib/firefox/firefox - firefox executable


VERSION
       3.0


BUGS
       To report a bug, please visit http://bugzilla.mozilla.org/


SEE ALSO
       mozilla(1)


AUTHORS
       The Mozilla Organization
              http://www.mozilla.org/about.html



firefox                                                                                        January 04, 2006                                                                                    FIREFOX(1)
