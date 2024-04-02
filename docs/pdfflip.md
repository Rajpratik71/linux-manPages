pdfflip(1)                                                                                                                                                                     pdfflip(1)

NAME
       pdfflip - rotate the pages of pdf files

SYNOPSIS
       pdfflip [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfflip reflects (left-right) the pages of files in the Adobe Portable Document Format (PDF).

       If no source PDF file ('SRC') is specified, input is from /dev/stdin. If 'PAGESPEC' is omitted, all pages are processed.

       Source files are processed sequentially into a single output unless the '--batch' option is used, in which case they are processed separately.

       pdfflip  operates  on  one  or  more  PDF  files,  and  (either  with the '--batch' option or with '--outfile DIR' where 'DIR' is a directory) the resulting files have the suffix
       '-flipped' applied to their names by default.  To change the suffix, use the '--suffix' option, for example

              pdfflip --suffix 'reflected' --batch myfile1.pdf myfile2.pdf

       will result in files named 'myfile1-reflected.pdf' and 'myfile2-reflected.pdf'.

       pdfflip is a simple wrapper for pdfjam, which is a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex with  the  pdf‐
       pages package is required.

       pdfflip is part of the "PDFjam" package of tools, whose homepage is at http://go.warwick.ac.uk/pdfjam.

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the available options and site/user defaults, see the output of

                  pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfflip does not work with encrypted PDF files, and does not preserve hyperlinks.

       Please report bugs! See the website at http://go.warwick.ac.uk/pdfjam .

SEE ALSO
       pdfjam(1).

LICENSE
       PDFjam is distributed under the GNU public license.

AUTHOR
       pdfflip is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                            pdfflip(1)
