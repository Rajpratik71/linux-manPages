pdfbook(1)                                                                                                                                                                     pdfbook(1)

NAME
       pdfbook - put the pages of PDF files into 2-up signatures

SYNOPSIS
       pdfbook [--short-edge] [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfbook  makes  2-up  versions  of PDF files, with the pages ordered as signatures.  The default signature size is 4: to change this, use the option '--signature N', where N is a
       multiple of 4 (alternatively use '--signature* N' for right-edge binding).

       The default is to make pages suitable for long-edge binding.  For short-edge binding, use '--short-edge' as the  first  argument;  this  will  only  work  if  the  LaTeX  package
       'everyshi' is installed.

       The default output page orientation is landscape.  To change this, use the '--no-landscape' option.

       By default, the option '--booklet true' is used (see the pdfpages manual for details).  To turn this off, just specify '--booklet false'.

       If no source PDF file ('SRC') is specified, input is from /dev/stdin. If 'PAGESPEC' is omitted, all pages are processed.

       Source files are processed sequentially into a single output unless the '--batch' option is used, in which case they are processed separately.

       pdfbook is a simple wrapper for pdfjam, which provides a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex, with the
       pdfpages package, is required.

       pdfbook operates on one or more PDF files, and (either with the '--batch' option or with '--outfile DIR' where 'DIR' is a directory) the resulting files have the  suffix  '-book'
       applied to their names by default.  To change the suffix, use the '--suffix' option, for example

              pdfbook --suffix 'sig4' --batch myfile1.pdf myfile2.pdf

       will result in files named 'myfile1-sig4.pdf' and 'myfile2-sig4.pdf'.

       pdfbook is part of the "PDFjam" package of tools, whose homepage is at http://www.warwick.ac.uk/go/pdfjam.

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the other available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfbook does not work with encrypted PDF files, and does not preserve hyperlinks.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1).

AUTHOR
       pdfbook is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                            pdfbook(1)
