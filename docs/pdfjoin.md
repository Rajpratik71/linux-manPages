pdfjoin(1)                                                                                                                                                                     pdfjoin(1)

NAME
       pdfjoin - join together pages from multiple PDF files

SYNOPSIS
       pdfjoin [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfjoin concatenates the pages of multiple Portable Document Format (PDF) files together into a single file..

       If no source PDF file ('SRC') is specified, input (but just one file -- not very useful here!  is from /dev/stdin. If 'PAGESPEC' is omitted, all pages are processed.

       Source files are processed sequentially into a single output.  The '--batch' option of pdfjam(1) cannot be used.

       pdfjoin is a simple wrapper for pdfjam, which provides a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex, with the
       pdfpages package, is required.

       pdfjoin is part of the "PDFjam" package of tools, whose homepage is at http://go.warwick.ac.uk/pdfjam .

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       The pages of the output file will all have the same size and orientation.

       pdfjoin does not work with encrypted PDF files, and does not preserve hyperlinks.  The output pages are all one size.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1).

AUTHOR
       pdfjoin is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                            pdfjoin(1)
