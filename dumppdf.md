DUMPPDF(1)                                                        PDFMiner Manual                                                       DUMPPDF(1)

NAME
       dumppdf - dumps internal contents of a PDF files

SYNOPSIS
       dumppdf [option...] file...

DESCRIPTION
       dumppdf dumps the internal contents of a PDF file in pseudo-XML format. This program is primarily for debugging purposes, but it's also
       possible to extract some meaningful contents

OPTIONS
       -a
           Dump all the objects. By default only the document trailer is printed.

       -i objno[,objno,...]
           Specifies PDF object IDs to display. Comma-separated IDs, or multiple -i options are accepted.

       -p pageno[,pageno,...]
           Specifies the comma-separated list of the page numbers to be extracted. Page numbers start at one. By default, it extracts text from
           all the pages.

       -r, -b, -t
           Specifies the output format of stream contents. Because the contents of stream objects can be very large, they are omitted when none of
           the options above is specified.

           With -r option, the “raw” stream contents are dumped without decompression. With -b option, the decompressed contents are dumped as a
           binary blob. With -t option, the decompressed contents are dumped in a text format, similar to repr() manner. When -r or -b option is
           given, no stream header is displayed for the ease of saving it to a file.

       -T
           Show the table of contents.

       -P password
           Provides the user password to access PDF contents.

       -d
           Increase the debug level.

EXAMPLES
       Dump all the headers and contents, except stream objects:

           $ dumppdf -a test.pdf

       Dump the table of contents:

           $ dumppdf -T test.pdf

       Extract a JPEG image:

           $ dumppdf -r -i6 test.pdf > image.jpeg

SEE ALSO
       pdf2txt(1)

AUTHORS
       Jakub Wilk <jwilk@debian.org>
           Wrote this manual page for the Debian system.

       Yusuke Shinyama <yusuke@cs.nyu.edu>
           Author of PDFMiner and its original HTML documentation.

dumppdf                                                             11/05/2015                                                          DUMPPDF(1)
