Pnmcomp User Manual(0)                                                                                                                                                                 Pnmcomp User Manual(0)



NAME
       pnmcomp - composite (overlay) two PNM images together


SYNOPSIS
       pnmcomp

       [-align={left|center|right|  beyondleft|beyondright}] [-valign={top|middle|bottom| above|below}] [-xoff=X] [-yoff=Y] [-alpha=alpha-pgmfile] [-invert] [-opacity=opacity] overlay_file [underlying_file
       [output_file]]

       Minimum unique abbreviation of option is acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of  the  equals  sign  to  separate  an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pnmcomp  was  obsoleted by pamcomp(1) , introduced with Netpbm 10.21 (March 2004).  pamcomp is backward compatible with pnmcomp, plus adds many additional functions, including the ability to process
       PAM images, and tends to produce better transparency results.

       pnmcomp remains in the Netpbm package because it may have fewer bugs for now than pamcomp, and is in some environments faster (but newer compilers have been seen to produce code for pamcomp signifi-
       cantly faster than that for pnmcomp).  Some day, pnmcomp will probably become an alias for pamcomp.

       You can use the pamcomp documentation for pnmcomp, considering the following differences:



       ·      pnmcomp options are a subset of pamcomp's, as
                   documented above.

       ·      pnmcomp always assumes the input is linear, as pamcomp
                   does when you specify its -linear option.

       ·      pnmcomp cannot process PAM images.



netpbm documentation                                                                           15 February 2004                                                                        Pnmcomp User Manual(0)
