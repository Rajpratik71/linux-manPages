DWWW-REFRESH-CACHE(8)            Debian            DWWW-REFRESH-CACHE(8)

NAME
       dwww-refresh-cache - rebuilds dwww cache directory

SYNOPSIS
       dwww-refresh-cache

DESCRIPTION
       dwww-refresh-cache  is  a simple shell script, which deletes out‐
       dated cache files and rebuilds contents of the dwww cache  direc‐
       tory  /var/cache/dwww.   In  default  installation, the script is
       called from /etc/cron.daily/dwww, so the cache is refreshed every
       day.

CONFIGURATION VARIABLES
       DWWW_KEEPDAYS
              Specifies,  how  many  days  documents  that have not been
              accessed should be kept in the cache.  Default is 10 days.

       DWWW_QUICKFIND_DB
              Location of the  installed  packages  and  programs  cache
              file,  generated  with help of dwww-quickfind(8).  Default
              is /var/cache/dwww/quickfind.dat.

       DWWW_DOCBASE2PKG_DB
              Location of the cache file, which maps installed  doc-base
              files  to  packages names, used by the dwww-build-menu(8).
              Default is /var/cache/dwww/docbase2pkg.dat.

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww(7).

       /var/cache/dwww
              dwww cache directory.

       /etc/cron.daily/dwww.
              dwww daily cron job

SEE ALSO
       dwww(7), dwww-build-menu(8), dwww-cache(8), dwww-find(8).

AUTHOR
       Robert Luberda.
       See dwww(7), for copyrights and stuff.

dwww 1.11.1                February 15th, 2009     DWWW-REFRESH-CACHE(8)
