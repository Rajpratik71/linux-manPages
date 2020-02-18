DWWW-CONVERT(8)                  Debian                  DWWW-CONVERT(8)

NAME
       dwww-convert - convert files to HTML for dwww

SYNOPSIS
       dwww-convert [--no-path-info] type location

DESCRIPTION
       dwww-convert  is  part of the dwww package, which provides access
       to on-line documentation on a Debian system via  WWW.   dwww-con‐
       vert converts documentation to HTML so that it can be viewed with
       a WWW browser.  dwww-convert is usually run by  the  WWW  server,
       but can also be run by hand.

       The type argument gives the type of the file, one of:

       file   An  arbitrary  file;  the  type  is  guessed  using simple
              heuristics based on the filename.

       dir    A  directory.   If  the  directory   contains   the   file
              index.html or index.htm that file will be returned. Other‐
              wise, A listing of the files in the  directory  is  gener‐
              ated.

       html   An HTML file.  The file is returned as is.

       man    A  manual page.  The location is the pathname of the nroff
              source file.

       runman A manual page.  The location is the  name  of  the  manual
              page  and its section, separated by a slash.  For example,
              the location would be intro/1 to  refer  to  the  intro(1)
              manual page.

       info   An Info file.

       text   A plain text file (using the ISO-8859-1 character set).

       An unknown file type is treated as text.

       The  location  argument gives the filename of the file.  The name
       must be complete, i.e., it must start at the root directory  (/).
       The  name must not contain any symbolic links (cf.  realpath(1)).
       The file must be located in or below a directory  that  has  been
       allowed by the system administrator; see dwww(7) for more info.

       The  file  may  be  compressed  with  gzip(1) or bzip2(1).  It is
       uncompressed automatically and invisibly.  Compression  is  indi‐
       cated by a filename that ends in `.gz' or `.bz2'.

OPTIONS
       --no-path-info
              Internal  option  used  by  the  dwww's  CGI script to let
              dwww-convert know, that the arguments following the option
              do  not  come  from  the  PATH_INFO variable, but from the
              QUERY_STRING.

FILES
       /etc/dwww/dwww.conf
              Configuration file for dwww.  See dwww(7) for more  infor‐
              mation.

SEE ALSO
       dwww(7), dwww-txt2html(8), dwww-build(8), dwww-cache(8).

AUTHOR
       Lars Wirzenius.  Modified by Robert Luberda.
       See dwww(7) for copyrights and stuff.

dwww 1.11.1                February 15th, 2009           DWWW-CONVERT(8)
