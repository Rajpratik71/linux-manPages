FIREFOX(1)                                                                                   Linux User's Manual                                                                                   FIREFOX(1)



NAME
       firefox - a Web browser for X11 derived from the Mozilla browser


SYNOPSIS
       firefox [OPTIONS ...] [URL]

       firefox-bin [OPTIONS] [URL]


DESCRIPTION
       Mozilla Firefox is an open-source web browser, designed for standards compliance, performance and portability.


USAGE
       firefox is a simple shell script that will set up the environment for the actual executable, firefox-bin.


OPTIONS
       A summary of the options supported by firefox is included below.


   X11 options
       --display=DISPLAY
              X display to use

       --sync Make X calls synchronous

       --g-fatal-warnings
              Make all warnings fatal


   Firefox options
       -h, -help
              Show summary of options.

       -v, -version
              Print Firefox version.

       -P profile
              Start with profile.

       --profile path
              Start with profile at path.

       --migration
              Start with migration wizard.

       --ProfileManager
              Start with ProfileManager.

       --no-remote
              Do not accept or send remote commands; implies --new-instance.

       --new-instance
              Open new instance, not a new window in running instance.

       --UILocale locale
              Start with locale resources as UI Locale.

       --save-mode
              Disables extensions and themes for this session.

       --headless
              Run without a GUI.

       --marionette
              Enable remote control server.

       --browser
              Open a browser window.

       --new-window url
              Open url in a new window.

       --new-tab url
              Open url in a new tab.

       --private-window url
              Open url in a new private window.

       --preferences
              Open Preferences dialog.

       --screenshot [path]
              Save screenshot to path or in working directory.

       --window-size width[,height]
              Width and optionally height of screenshot.

       --search term
              Search term with your default search engine.



       --jsconsole
              Open the Browser Console.

       --jsdebugger
              Open the Browser Toolbox.

       --wait-for-jsdebugger
              Spin event loop until JS debugger connects.  Enables debugging (some) application startup code paths.  Only has an effect when --jsdebugger is also supplied.

       --devtools
              Open DevTools on initial load.

       --start-debugger-server [ws:][port|path]
              Start the debugger server on a TCP port or Unix domain socket path. Defaults to TCP port 6000. Use WebSocket protocol if ws: prefix is specified.

       --recording file
              Record drawing for a given URL.

       --recording-output file
              Specify destination file for a drawing recording.

       --setDefaultBrowser
              Set this app as the default browser.


FILES
       /usr/bin/firefox - shell script wrapping firefox
       /usr/lib64/firefox/firefox-bin - firefox executable


VERSION
       57.0


BUGS
       To report a bug, please visit http://bugzilla.mozilla.org/


AUTHORS
       The Mozilla Organization
              http://www.mozilla.org/about.html

       Tobias Girstmair
              https://gir.st/



firefox                                                                                       November 30, 2017                                                                                    FIREFOX(1)
