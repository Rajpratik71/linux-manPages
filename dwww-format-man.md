DWWW-FORMAT-MAN(8)               Debian               DWWW-FORMAT-MAN(8)

NAME
       dwww-format-man - batch format manual pages for dwww

SYNOPSIS
       dwww-format-man [-v|--verbose] directory ...

DESCRIPTION
       dwww-format-man  looks  for manual pages in the directories named
       on the command line.  It formats each manual page, and  puts  the
       formatted  version into the dwww document cache.  System adminis‐
       trator's can run dwww-format-man if they want to make  it  faster
       to  retrieve  manual  pages  via dwww.  If dwww-format-man is not
       run, dwww will automatically  format  manual  pages  not  in  its
       cache.   Long  pages  take a few moments to format, but rarely so
       slow that it is worth running.

       dwww-format-man   runs   dwww-convert(8)   with   privileges   of
       DWWW_CGIUSER (see dwww(7)).

OPTIONS
       -v, --verbose
              Print each processed file name.

SEE ALSO
       dwww(7), dwww-convert(8).

AUTHOR
       Lars Wirzenius <liw@iki.fi>.  Slightly modified by Robert Luberda
       <robert@debian.org>.
       See dwww(7) for copyrights and stuff.

dwww 1.13.0                February 10th, 2016        DWWW-FORMAT-MAN(8)
