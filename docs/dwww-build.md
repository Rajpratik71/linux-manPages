DWWW-BUILD(8)                    Debian                    DWWW-BUILD(8)

NAME
       dwww-build - build dwww index lists

SYNOPSIS
       dwww-build [--verbose] --default
       dwww-build [--verbose] html-directory

DESCRIPTION
       dwww-build  builds  the  index  lists  of all available documents
       (manual pages, Info files, and so on); it should be run  whenever
       documentation  is  installed  or  removed.  dwww(7) does not work
       unless dwww-build has been run at least once; when the package is
       installed,  it  is run automatically.  The default dwww installa‐
       tion creates a /etc/cron.daily/dwww, which automatically  updates
       the pages each day.

       The html-directory argument specifies the directory where all the
       dwww HTML files will be stored.  No other files should be  stored
       there.   If  --default  is  used, the files are generated in dwww
       subdirectory of the directory specified  in  the  DWWW_DOCROOTDIR
       variable   in   the   /etc/dwww/dwww.conf   file.   (Default   is
       /var/www/dwww.)

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww(7).

FILES
       /etc/dwww/dwww-user.css
              If such a  file exists, its contents will be  appended  to
              the dwww.css file.

       /var/www/dwww
              Where  all  dwww HTML files are stored, if nothing else is
              specified.

       /var/lib/dwww
              Directory used for temporary created files. Can  be  over‐
              ridden with the DWWW_TMPDIR variable.

SEE ALSO
       dwww-build-menu(8), dwww(7).

AUTHOR
       Lars Wirzenius.
       See dwww(7) for copyrights and stuff.

dwww 1.11.1                February 15th, 2009             DWWW-BUILD(8)
