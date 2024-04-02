DVIBOOK(1)                                                                       General Commands Manual                                                                       DVIBOOK(1)

NAME
       dvibook - rearrange pages in DVI file into signatures

SYNOPSIS
       dvibook [ -q ] [ -s<num> ] [ -r ] [ -i infile ] [ -o outfile ] [ infile [ outfile ] ]

DESCRIPTION
       Dvibook rearranges pages from a DVI file produced by TeX into ``signatures'' for printing books or booklets, creating a new DVI file usable by any of the TeX conversion programs.

       The  -s  option  selects the size of signature which will be used. The signature size is the number of sides which will be folded and bound together; the number given should be a
       multiple of four. The default is to use one signature for the whole file. Extra blank sides will be added if the file does not contain a multiple of four pages.

       By default, dvibook rearranges the pages into left-hand side binding signatures; the -r option switches to right-hand side binding signatures. This might be useful for pTeX  ver‐
       tical writing (tate-kumi) documents.

       Dvibook normally prints the page numbers of the pages rearranged; the -q option suppresses this.

AUTHOR
       Angus Duggan, from dviselect(1), by Chris Torek, University of Maryland

SEE ALSO
       dviconcat(1), dviselect(1), latex(1), tex(1)
       MC-TeX User's Guide
       The TeXbook

BUGS
       Dvibook  does not adjust the parameters in the postamble; however, since these values are normally used only to size certain structures in the output conversion programs, and the
       parameters never need to be adjusted upward, this has not proven to be a problem.

                                                                                                                                                                               DVIBOOK(1)
