DWWW-QUICKFIND(8)                Debian                DWWW-QUICKFIND(8)

NAME
       dwww-quickfind - find quickly which package a program belongs to.

SYNOPSIS
       dwww-quickfind --build dbfile
       dwww-quickfind program dbfile

DESCRIPTION
       dwww-quickfind is part of the dwww package, which provides access
       to on-line documentation on a Debian system via WWW.

       dwww-quickfind searches  for  program  using  the  database  file
       dbfile.   If  used  with  --build, dwww-quickfind builds programs
       database and stores it in  the file dbfile.

FILES
       /var/cache/dwww/quickfind.dat
              Default file used as the database file.

SEE ALSO
       dwww(7), dwww-find(8).

AUTHOR
       Lars Wirzenius.
       See dwww(7) for copyrights and stuff.

dwww 1.11.1                February 15th, 2009         DWWW-QUICKFIND(8)
