FIREFOX(1)                                                                               General Commands Manual                                                                               FIREFOX(1)

NAME
       firefox - a free and open source web browser from Mozilla

SYNOPSIS
       firefox [OPTIONS] [url]

DESCRIPTION
       See http://support.mozilla.com/ for help using the browser.  This manpage only describes how to run it.

OPTIONS
       -h, --help
              Prints the command line options.

       -g, --debug
              Starts firefox in a debugger.

       -d, --debugger
              Specify the debugger in which to start firefox. The default is gdb. Used in conjunction with -g.

       -a, --debugger-args
              Specify arguments to pass to the debugger. Used in conjunction with -g.

       -no-remote
              Don't  connect to any other running instances of firefox. Use this if you want to run firefox in an entirely new process. By default, firefox will delegate a command to an already running
              instance.

       -ProfileManager
              Start the profilemanager. Use this to choose the profile you would like to run firefox with. You will need to also use -no-remote if there is already a running firefox instance.

       -P profile
              Start firefox with the profile named profile. Will start the profile manager if a valid profile name is not specified. You will need to also use -no-remote if there is already  a  running
              firefox instance.

       -safe-mode
              Start firefox in safe-mode. This disables all third-party extensions, and may be necessary if you are having problems with an extension you installed.

       -new-tab url
              Open url in a new tab.

       -new-window url
              Open url in a new window.

       -v, -version
              Print the current version of firefox.

       -UILocale locale
              Start firefox with the specified locale locale. Use this to override your environment

       -preferences
              Open the preferences dialog.

       -private
              Start firefox in private browsing mode

       -private-toggle
              Toggle private browsing mode

       -setDefaultBrowser
              Set firefox as the default web browser

       -search term
              Search for term with your default search engine

       -jsconsole
              Open the Error console. If firefox is not already running, this will open a new browser window too

firefox                                                                                         2011-02-09                                                                                     FIREFOX(1)
