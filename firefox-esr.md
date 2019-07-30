FIREFOX(ESR)                                                                           firefox-esr                                                                           FIREFOX(ESR)

NAME
       firefox-esr - a Web browser for X11 derived from the Mozilla browser

SYNOPSIS
       firefox-esr [OPTIONS] [URL]

       /usr/lib/firefox-esr/firefox-esr [OPTIONS] [URL]

DESCRIPTION
       Firefox ESR is an open-source web browser, designed for standards compliance, performance and portability.

USAGE
       If there is an Firefox ESR browser already running, firefox-esr will arrange for it to create a new browser window; otherwise it will start a new instance.

OPTIONS
       A summary of the options supported by firefox-esr is included below.

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

   Mozilla options
       -h, -help
              Show summary of options.

       -v, -version
              Print Firefox ESR version.

       -P [profile]
              Start with profile. When no profile is given, displays the Profile Manager. May require -no-remote, see below.

       -migration
              Start with migration wizard. May require -no-remote, see below.

       -ProfileManager
              Start with profile manager. May require -no-remote, see below.

       -no-remote
              Don't  connect  to  a running Firefox ESR instance. This option can be necessary in conjunction to several of the options above, that won't have any effect when an Firefox
              ESR instance is running unless -no-remote is used at the same time.

       -UILocale locale
              Start with locale resources as User Interface locale. By default, it is guessed from environment and available locales for Firefox ESR.

       -safe-mode
              Starts Firefox ESR in safe mode, i.e. disabling all extensions and showing a bit more debugging messages.

       -jsconsole
              Start with Javascript Console

       -new-window URL
              Open URL in a new window in an already running Firefox ESR process.

       -new-tab URL
              Open URL in a new tab in an already running Firefox ESR process.

       -chrome url
              Load the specified chrome.

ENVIRONMENT
       MOZILLA_DISABLE_PLUGINS - when set, totally disables loading browser plugins (the ones that appear at the about:plugins url)

FILES
       /usr/bin/firefox-esr - symbolic link to /usr/lib/firefox-esr/firefox-esr.

       /usr/lib/firefox-esr/firefox-esr - Firefox ESR executable.

       /usr/lib/firefox-esr/firefox-bin - Legacy executable.

BUGS
       To report a bug, please visit http://bugzilla.mozilla.org/ and/or report bugs to the Debian Bug Tracking System, as usual.

AUTHORS
       The Mozilla Organization
              http://www.mozilla.org/about.html

November 4, 2004                                                                            1                                                                                FIREFOX(ESR)
