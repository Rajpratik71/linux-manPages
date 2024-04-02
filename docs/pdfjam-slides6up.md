pdfjam-slides6up(1)                                                                                                                                                   pdfjam-slides6up(1)

NAME
       pdfjam-slides6up - put presentation slides onto 6-up pages

SYNOPSIS
       pdfjam-slides6up [--pagenumbering SWITCH] [OPTION [OPTION] ...] [SRC [PAGESPEC] [SRC [PAGESPEC]] ...]

DESCRIPTION
       pdfjam-slides6up  converts  PDF files whose pages are presentation slides (with 4:3 aspect ratio) into 6-up versions suitable for making a handout (for example).  By default, the
       6-up pages do not themselves have page numbers.

       To put page numbers on the output pages, use either '--pagenumbering true' or, for example, '--pagenumbering 3.0cm' to place the page numbers a bit lower on  the  page  than  the
       default  position.   The  value of 'SWITCH' must be either 'true', 'false' or a dimension that can be used by LateX. (To be precise, it's the value of the 'footskip' dimension in
       LaTeX; by default, pdfjam-slides6up sets that as 2.7cm, which works pretty well in conjunction with both '--paper a4paper' and '--paper letterpaper'.)

       If no source PDF file ('SRC') is specified, input is from /dev/stdin. If 'PAGESPEC' is omitted, all pages are processed.

       Source files are processed sequentially into a single output unless the '--batch' option is used, in which case they are processed separately.

       pdfjam-slides6up is a simple wrapper for pdfjam, which provides a front end to many of the capabilities of the pdfpages package for pdflatex.  A working installation of pdflatex,
       with the pdfpages package, is required.

       pdfjam-slides6up  operates on one or more PDF files, and (either with the '--batch' option or with '--outfile DIR' where 'DIR' is a directory) the resulting files have the suffix
       '-6up' applied to their names by default.  To change the suffix, use the '--suffix' option, for example

              pdfjam-slides6up --suffix '2x3' --batch myslides1.pdf myslides2.pdf

       will result in files named 'myslides1-2x3.pdf' and 'myslides2-2x3.pdf'.

       By default a narrow line frame is printed around every slide.  This can be turned off if required by using the option '--frame false'.

       pdfjam-slides6up is part of the "PDFjam" package of tools, whose homepage is at http://www.warwick.ac.uk/go/pdfjam .

SETUP
       See http://go.warwick.ac.uk/pdfjam .

USAGE
       For the other available options and site/user defaults, see the output of

              pdfjam --help

       For further information and some examples see http://go.warwick.ac.uk/pdfjam .

LIMITATIONS AND BUGS
       pdfjam-slides6up does not work with encrypted PDF files, and does not preserve hyperlinks.

       Please report bugs! See the website at http://www.warwick.ac.uk/go/pdfjam .

LICENSE
       PDFjam is distributed under the GNU public license.

SEE ALSO
       pdfjam(1) pdfjam-slides3up(1) .

AUTHOR
       pdfjam-slides6up is written and maintained by David Firth as part of the PDFjam package.

                                                                                      10 March 2010                                                                   pdfjam-slides6up(1)
