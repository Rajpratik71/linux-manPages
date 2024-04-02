VIDALIA(1)                                                    General Commands Manual                                                   VIDALIA(1)

NAME
       vidalia - Controller GUI for tor

SYNOPSIS
       vidalia [options]

DESCRIPTION
       Vidalia allows you to start and stop Tor, view the status of Tor at a glance, and monitor Tor's bandwidth usage. Vidalia also makes it easy
       to contribute to the Tor network by helping you setup a Tor server, if you wish.  To find more information about what Tor is and how to use
       it, see the Tor homepage: https://www.torproject.org/

OPTIONS
       -help Displays this usage message and exits.

       -reset Resets ALL stored Vidalia settings.

       -datadir <directory>
              Sets Vidalia's datadir to <directory>

       -pidfile <directory/pidfile>
              Sets Vidalia's pidfile to <directory/pidfile>

       -logfile <file>
              Sets the name and location of Vidalia's log file. If this option is specified without a loglevel, the default level of 'notice' will
              be used.

       -loglevel [debug|info|notice|warn|error]
              Sets the verbosity of Vidalia's logging. If this option is specified without a logfile, the log messages will be printed to stdout.

       -style <directory>
              Sets Vidalia's interface style. [Windows|Motif|CDE|Plastique]

       -lang <langcode>
              Sets Vidalia's language. Run Vidalia with the -help option to see a list of available language codes.

SEE ALSO
       tor(1)

       http://www.torproject.org/projects/vidalia.html

AUTHORS
       Matt Edman <edmanm@vidalia-project.net>
       Justin Hipple <hipplej@vidalia-project.net>

       This manpage was written by Alexander Wirt <formorer@debian.org> for the Debian Distribution (but may be used by others).

0.2.21                                                               June 2006                                                          VIDALIA(1)
