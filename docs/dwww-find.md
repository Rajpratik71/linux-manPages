DWWW-FIND(8)                     Debian                     DWWW-FIND(8)

NAME
       dwww-find - find documentation related to a search argument

SYNOPSIS
       dwww-find [--program|--menu|--documentation|--docfile|--doc-base-
       list] [--skip=number] argument [...]

DESCRIPTION
       dwww-find is part of the dwww package, which provides  access  to
       on-line documentation on a Debian system via WWW.

       dwww-find  searches  for  a documentation related to a given pro‐
       gram, for entries from Debian Documentation Menu, or at least for
       documents  registered with doc-base.  It returns a HTML-formatted
       document with search results.

OPTIONS
       --program
              Search for documentation  (man pages,  info  files,  etc.)
              related to program specified by argument.

       --menu Search for entries in Debian Documentation Menu pages gen‐
              erated by dwww-build-menu(8).

       --documentation
              Search in documentation files  registered  with  doc-base.
              It uses search++(1) for searching.

       --docfile
              Search  for  documentation for package, which contains the
              file specified by the argument.  The file must be  located
              in  or below a directory that has been allowed by the sys‐
              tem administrator; see dwww(7) for more info.

       --doc-base-list
              Show list of registerered doc-base files for  given  argu‐
              ment,  which  should  be  specified as format/document-id,
              where  document-id  is  an  identificator  of   registered
              doc-base  document,  and  format is a name of format (e.g.
              text or pdf) registered by the  document,  for  which  the
              list list is to be generated.

       --skip=number
              Works  only  with  --documentation.  Skip number of search
              results.

       When no options are specified, --program is assumed.

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww.

SEE ALSO
       dwww(7), dwww-quickfind(8), dwww-build-menu(8),  dwww-index++(8),
       search++(1),        Debian        doc-base        Manual       in
       /usr/share/doc/doc-base/doc-base.html/index.html.

AUTHORS
       Lars Wirzenius.  Robert Luberda.
       See dwww(7) for copyrights and stuff.

dwww 1.11.4                January 15th, 2011               DWWW-FIND(8)
