pdfnup(1)                                                                                                                                                                       pdfnup(1)

NAME
       pdfnup - n-up the pages of pdf files

SYNOPSIS
       pdfnup [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfnup  converts files in the Adobe Portable Document Format (PDF) to "n-up" PDF files, that is, with multiple input pages per output page, for more economical printing etc.  The
       default processing is to 2-up landscape output with no frame around pages, equivalent to using the options '--nup 2x1 --landscape true --frame false'.

       If no source PDF file ('SRC') is specified, input is from /dev/stdin. If 'PAGESPEC' is omitted, all pages are processed.

       Source files are processed sequentially into a single output unless the '--batch' option is used, in which case they are processed separately.

       pdfnup operates on one or more PDF files, and (either with the '--batch' option or with '--outfile DIR' where 'DIR' is a directory) the resulting files  have  the  suffix  '-nup'
       applied to their names by default.  To change the suffix, use the '--suffix' option, for example

              pdfnup --nup 2x2 --suffix '2x2' --batch myfile1.pdf myfile2.pdf

       will result in files named 'myfile1-2x2.pdf' and 'myfile2-2x2.pdf'.

       pdfnup  is a simple wrapper for pdfjam, which provides a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex, with the
       pdfpages and geometry packages, is required.

       pdfnup is part of the "PDFjam" package of tools, whose homepage is at http://www.warwick.ac.uk/go/pdfjam .

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfnup does not work with encrypted PDF files, and does not preserve hyperlinks.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1) pdfpun(1) .

AUTHOR
       pdfnup is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                             pdfnup(1)
