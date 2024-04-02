pdfpun(1)                                                                                                                                                                       pdfpun(1)

NAME
       pdfpun - n-up the pages of a pdf file, with right-to-left ordering

SYNOPSIS
       pdfpun SRC [PAGESPEC] --outfile FILENAME [OPTION [OPTION] ...]

DESCRIPTION
       pdfpun  converts  a  file  in the Adobe Portable Document Format (PDF) to a "n-up" PDF file, that is, with multiple input pages per output page, for more economical printing etc.
       The pages are ordered right-to-left in the output.  The default processing is to 2-up landscape output with no frame around pages, equivalent to  using  the  options  '--nup  2x1
       --landscape --frame false'.

       SRC must be a PDF file; '/dev/stdin' can be used for PDF input via a pipeline.

       If PAGESPEC is omitted, all pages are processed (equivalent to '-' as PAGESPEC)

       OPTION is any option of pdfjam(1) other than --batch.

       pdfpun  is a simple wrapper for pdfjam, which provides a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex, with the
       pdfpages package, is required.

       pdfpun is part of the "PDFjam" package of tools, whose homepage is at http://www.warwick.ac.uk/go/pdfjam.

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfpun does not work with encrypted PDF files, and does not preserve hyperlinks.

       The '--keepinfo' option does not work.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1) pdfnup(1).

AUTHOR
       pdfpun is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                             pdfpun(1)
