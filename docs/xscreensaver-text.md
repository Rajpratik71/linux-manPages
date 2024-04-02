xscreensaver-text(1)                                            XScreenSaver manual                                           xscreensaver-text(1)

NAME
       xscreensaver-text - prints some text to stdout, for use by screen savers.

SYNOPSIS
       xscreensaver-text [--verbose] [--columns N] [--text STRING] [--file PATH] [--program CMD] [--url URL]

DESCRIPTION
       The  xscreensaver-text  script  prints  out  some text for use by various screensavers, according to the options set in the ~/.xscreensaver
       file.  This may dump the contents of a file, run a program, or load a URL.

OPTIONS
       xscreensaver-text accepts the following options:

       --columns N or --cols N
               Where to wrap lines; default 72 columns.

       --verbose or -v
               Print diagnostics to stderr.  Multiple -v switches increase the amount of output.

       Command line options may be used to override the settings in the ~/.xscreensaver file:

       --string STRING
               Print the given string.  It may contain % escape sequences as per strftime(2).

       --file PATH
               Print the contents of the given file.  If --cols is specified, re-wrap the lines; otherwise, print them as-is.

       --program CMD
               Run the given program and print its output.  If --cols is specified, re-wrap the output.

       --url HTTP-URL
               Download and print the contents of the HTTP document.  If it contains HTML, RSS, or Atom, it will be converted to plain-text.

               Note: this re-downloads the document every time it is run!  It might be considered abusive for you to point this at  a  web  server
               that you do not control!

ENVIRONMENT
       HTTP_PROXY or http_proxy
           to get the default HTTP proxy host and port.

BUGS
       The RSS and Atom output is always ISO-8859-1, regardless of locale.

       URLs should be cached, use "If-Modified-Since", and obey "Expires".

SEE ALSO
       xscreensaver-demo(1), xscreensaver(1), fortune(1), phosphor(1), apple2(1), starwars(1), fontglide(1), dadadodo(1), webcollage(1),
       http://www.livejournal.com/stats/latest-rss.bml,
       https://en.wikipedia.org/w/index.php?title=Special:NewPages&feed=rss,
       driftnet(1), EtherPEG, EtherPeek

COPYRIGHT
       Copyright © 2005 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any pur‐
       pose is hereby granted without fee, provided that the above copyright notice appear in all copies and that both that copyright  notice  and
       this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for any pur‐
       pose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 20-Mar-2005.

X Version 11                                                    5.40 (12-Aug-2018)                                            xscreensaver-text(1)
