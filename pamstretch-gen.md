Pamstretch-gen User Manual(0)                                                                                                                                                   Pamstretch-gen User Manual(0)



NAME
       pamstretch-gen - use pamstretch and pamscale to scale by non-integer values


SYNOPSIS
       pamstretch-gen N [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamstretch-gen is a program which uses pamstretch(1) , pnmfile(1) , and pamscale(1)
        to smoothly scale up a PNM file by any ratio; it's like a more general version of pamstretch (hence the name). But other than the `any ratio' bit, it's much the same as pamstretch. :-)



LIMITATIONS
       The program uses awk just to make some simple floating-point calculations, which is probably overkill.  But using dc makes my head hurt.


SEE ALSO
       pamstretch(1) , pamscale(1)



AUTHOR
       Russell Marks (russell.marks@ntlworld.com).



netpbm documentation                                                                            10 April 2000                                                                   Pamstretch-gen User Manual(0)
