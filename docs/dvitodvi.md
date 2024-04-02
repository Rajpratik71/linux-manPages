DVITODVI(1)                                                                      General Commands Manual                                                                      DVITODVI(1)

NAME
       dvitodvi - rearrange pages in a DVI file

SYNOPSIS
       dvitodvi [ -q ] [ -i infile ] [ -o outfile ] [ -wwidth ] [ -hheight ] pagespecs [ infile [ outfile ] ]

DESCRIPTION
       Dvitodvi rearranges pages from a DVI file, creating a new DVI file.  Dvitodvi can be used to perform a large number of arbitrary re-arrangements of Documents, including arranging
       for printing 2-up, 4-up, booklets, reversing, selecting front or back sides of documents, scaling, etc.

       pagespecs follow the syntax:

              pagespecs   = [modulo:][mag@]specs

              specs       = spec[+specs][,specs]

              spec        = [-]pageno[(xoff,yoff)]

       modulo is the number of pages in each block. The value of modulo should be greater than 0; the default value is 1.  The optional mag parameter adjusts the file's magnification by
       the  magnification specified. The magnification and modulo can be specified in reverse order if desired.  specs are the page specifications for the pages in each block. The value
       of the pageno in each spec should be between 0 (for the first page in the block) and modulo-1 (for the last page in each block) inclusive.  The optional dimensions xoff and  yoff
       shift  the  page  by the specified (positive) amount.  xoff and yoff are in PostScript's points, but may be followed by the units cm or in to convert to centimetres or inches, or
       the flag w or h to specify as a multiple of the width or height.  If the optional minus sign is specified, the page is relative to the end of the document, instead of the start.

       If page specs are separated by + the pages will be merged into one page; if they are separated by , they will be on separate pages.  If there is only one page specification, with
       pageno zero, the pageno may be omitted.

       The -w option gives the width which is used by the w dimension specifier, and the -h option gives the height which is used by the h dimension specifier. These dimensions are also
       used (after scaling) to set the clipping path for each page.

       Dvitodvi normally prints the page numbers of the pages re-arranged; the -q option suppresses this.

EXAMPLES
       This section contains some sample re-arrangements. To put two pages on one sheet (of landscaped A3 paper), the pagespec to use is:

              2:0+1(21cm,0)

       To reduce an A3 page to A4 size, the pagespec to use is:

              700@(-.3in,-.3in)

       To select all of the odd pages in reverse order, use:

              2:-0

AUTHOR
       Angus Duggan, from dviselect(1), by Chris Torek, University of Maryland

SEE ALSO
       dviconcat(1), dvibook(1), dviselect(1), latex(1), tex(1)
       MC-TeX User's Guide
       The TeXbook

BUGS
       Dvitodvi does not adjust some of the parameters in the postamble. This may be a problem if these values are used to size certain structures in the output conversion programs.

                                                                                                                                                                              DVITODVI(1)
