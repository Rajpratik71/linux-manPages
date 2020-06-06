pdfunite(1)                                                                              General Commands Manual                                                                              pdfunite(1)

NAME
       pdfunite - Portable Document Format (PDF) page merger

SYNOPSIS
       pdfunite [options] PDF-sourcefile1..PDF-sourcefilen PDF-destfile

DESCRIPTION
       pdfunite merges several PDF (Portable Document Format) files in order of their occurrence on command line to one PDF result file.

       Neither of the PDF-sourcefile1 to PDF-sourcefilen should be encrypted.

OPTIONS
       -v     Print copyright and version information.

       -h     Print usage information.  (-help and --help are equivalent.)

EXAMPLE
       pdfunite sample1.pdf sample2.pdf sample.pdf

       merges all pages from sample1.pdf and sample2.pdf (in that order) and creates sample.pdf

AUTHOR
       The pdfunite software and documentation are copyright 1996-2004 Glyph & Cog, LLC and copyright 2005-2011 The Poppler Developers - http://poppler.freedesktop.org

SEE ALSO
       pdfseparate(1),

                                                                                            15 September 2011                                                                                 pdfunite(1)
