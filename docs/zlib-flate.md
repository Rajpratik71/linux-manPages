
ZLIB-FLATE(1)                                                                                User Commands                                                                               ZLIB-FLATE(1)

NAME
       zlib-flate - raw zlib compression program

SYNOPSIS
       zlib-flate -compress | -uncompress

DESCRIPTION
       The zlib-flate program is part of the qpdf package.

       The  zlib-flate program reads from standard input and writes to standard output either compressing or uncompressing its input using raw zlib compression.  It can be used to uncompress or com‐
       press raw PDF streams or other data that is compressed with raw zlib compression.  This program is provided primarily as a debugging tool, though it could be used for other purposes, such  as
       being called from a script that creates simple PDF files.

       This program should not be used as a general purpose compression tool.  Use something like gzip(1) instead.

       For details about qpdf, please see the qpdf manual, which can be found in /usr/share/doc/qpdf/qpdf-manual.html or /usr/share/doc/qpdf/qpdf-manual.pdf.

SEE ALSO
       qpdf(1), gzip(1)

zlib-flate from qpdf version 8.0.2                                                            April 2008                                                                                 ZLIB-FLATE(1)
