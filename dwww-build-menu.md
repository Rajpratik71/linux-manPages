DWWW-BUILD-MENU(8)               Debian               DWWW-BUILD-MENU(8)

NAME
       dwww-build-menu - builds dwww Debian Documentation Menu

SYNOPSIS
       dwww-build-menu

DESCRIPTION
       dwww-build-menu  is  part  of  the  dwww  package, which provides
       access to on-line documentation on a Debian system via WWW.

       dwww-build-menu generates the  Debian  Documentation  Menu  pages
       (available on http://localhost/dwww/menu/), from files registered
       with doc-base program, found in the /var/lib/doc-base/documents

       The  generated  pages  are  stored  in  DWWW_DOCROOTDIR/dwww/menu
       directory. (Default is /var/www/dwww/menu.)

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww.

       /var/www/dwww/menu
              Default directory for generated menu pages.

       /var/lib/dwww
              Temporary directory used while generating the pages.

SEE ALSO
       dwww(7),  dwww-build(8),  install-docs(8), Debian doc-base Manual
       in /usr/share/doc/doc-base/doc-base.html/index.html.

AUTHOR
       Robert Luberda <robert@debian.org>.  See dwww(7)  for  copyrights
       and stuff.

dwww 1.11.1                February 15th, 2009        DWWW-BUILD-MENU(8)
