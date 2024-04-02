pdfjam-pocketmod(1)                                                                                                                                                   pdfjam-pocketmod(1)

NAME
       pdfjam-pocketmod - make an 8-page PDF document into a pocket-sized booklet

SYNOPSIS
       pdfjam-pocketmod SRC [PAGESPEC] [OPTION [OPTION] ...]

DESCRIPTION
       pdfjam-pocketmod  converts 8 pages of a PDF file into a single 8-up page, with pages ordered and oriented for folding into pocket-sized booklet ( as described at http://repocket‐
       mod.com/ ).

       SRC must be a regular PDF file (not /dev/stdin).

       If PAGESPEC is omitted, the first 8 pages are processed.

       OPTION is any option to pdfjam(1) other than --batch.

       pdfjam-pocketmod is a simple wrapper for pdfjam, which provides a front end to some of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex,
       with the pdfpages package, is required.

       pdfjam-pocketmod is part of the "PDFjam" package of tools, whose homepage is at http://go.warwick.ac.uk/pdfjam .

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfjam-pocketmod does not work with encrypted PDF files, and does not preserve hyperlinks.

       The '--keepinfo' option does not work.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam.

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1).

AUTHOR
       pdfjam-pocketmod is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                   pdfjam-pocketmod(1)
