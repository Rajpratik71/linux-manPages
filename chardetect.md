CHARDET(1)                                   User Commands                                  CHARDET(1)

NAME
       chardet - universal character encoding detector

SYNOPSIS
       chardet [file ...]

DESCRIPTION
       Report heuristically-detected character encoding for each file.

       For  every specified file (defaulting to stdin if no files are specified), reads and determines
       the character encoding of the file content. Reports the name  and  confidence  level  for  each
       file's detected character encoding.

SEE ALSO
       /usr/share/doc/python-chardet-doc/index.html

AUTHOR
       chardet module was written by Mark Pilgrim <mark@diveintomark.org>

       This manual page was written by Piotr Ożarowski <piotr@debian.org>, for the Debian project (but
       may be used by others).

chardet 2.2.1                                December 2013                                  CHARDET(1)
