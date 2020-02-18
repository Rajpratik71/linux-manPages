DWWW-TXT2HTML(8)                 Debian                 DWWW-TXT2HTML(8)

NAME
       dwww-txt2html - simple txt to HTML converter for dwww

SYNOPSIS
       dwww-txt2html [--man] [--utf8] [file]

DESCRIPTION
       dwww-txt2html  is part of the dwww package, which provides access
       to on-line documentation on a Debian system via WWW.

       dwww-txt2html is a very simple text to HTML filter,  which  reads
       text to convert from a file argument if was given or stdin other‐
       wise.  Converts `<', `>', and `&' properly. Adds <pre> and </pre>
       tags,  but  it  does  not  add  <html>  or  <body> tags.  Handles
       backspace characters.
       Converts local man pages and documentation  files  references  to
       anchors  and  adds  links  for  both  http  and  ftp  sites, mail
       addresses or Debian `closes: #bug_no'  statements  (e.g.  closes:
       #100000).

       dwww-txt2html is usually run by the dwww-convert(8) command.

OPTIONS
       --man  Input is an uncompressed manual page.

       --utf8 Input is encoded in UTF-8.

SEE ALSO
       dwww(7), dwww-convert(8), dwww-cache(8).

AUTHOR
       Lars Wirzenius. Modified and improved by Robert Luberda.
       See dwww(7) for copyrights and stuff.

dwww 1.11.1                February 15th, 2009          DWWW-TXT2HTML(8)
