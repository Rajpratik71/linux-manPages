Pgmtopbm User Manual(0)                                                                                                                                                               Pgmtopbm User Manual(0)



NAME
       pgmtopbm - convert a PGM image to PBM


SYNOPSIS
       pgmtopbm

       [-floyd | -fs | -threshold | -hilbert | -dither8 | -d8 | -cluster3 | -c3 | -cluster4 | -c4 | -cluster8 | -c8]

       [-value val]

       [-clump size]

       [pgmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       This program is obsolete since Netpbm 10.23 (July 2004).  Use pamditherbw(1)
        to do what this program used to do.

       pgmtopbm  never  was the simple converter it appeared to be.  It was a dithering program.  Unfortunately, it didn't do the dithering properly because it treated the PGM input samples as if they were
       directly proportional to light intensity, but they are actually gamma-adjusted.

       pamditherbw is backward compatible with pgmtopbm except that it


       ·      does the correct gamma adjustments.

       ·      produces PAM output instead of PBM.  (Modern Netpbm programs that accept PBM input also accept PAM input, but if you need actual PBM, you can use pamtopbm with pamditherbw).

              So use the manual for pamditherbw for pgmtopbm, except ignore anything that says it was added after Netpbm Release 10.23 and ignore any options that are not shown in the synopsis above.

       If you just want to convert a PGM image with maxval 1 to PBM, use pamtopnm(1)



netpbm documentation                                                                             20 June 2004                                                                         Pgmtopbm User Manual(0)
