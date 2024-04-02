Pnmtopnm User Manual(0)                                                                                                                                                               Pnmtopnm User Manual(0)



NAME
       pnmtopnm - copy a PNM image

SYNOPSIS
       pnmtopnm

       [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pnmtopnm  simply copies a PNM image to Standard Output.  The output has the same major PNM format (PBM, PGM, or PPM) and maxval as the input.  This may seem an unnecessary duplication of cat, but it
       lets you convert between the plain (ASCII) and raw (binary) subformats of PNM.  Use the -plain Netpbm common option to ensure the output is plain PNM, and don't use -plain to ensure  the  output  is
       raw PNM.  See
        Common Options ⟨index.html#commonoptions⟩ .

       You  don't  normally need to convert between the PNM subformats, because any program that uses the Netpbm library to read a PNM image will read all of them directly.  But there are a lot of programs
       that don't use the Netpbm library and understand only the raw format.  Plain format is nice because it is human readable; people often use it to debug programs that process PNM images.

       pnmtopnm is really just another name for the program pamtopnm.  The latter does the job because like any Netpbm program that takes PAM input via the Netpbm programming library  facilities,  it  also
       takes PNM input.


HISTORY
       pnmtopnm was new in Netpbm 10.23 (July 2004).  It obsoleted pnmtoplainpnm, which specifically did the conversion to plain PNM.  There was no program to explicitly convert to raw PNM, but many Netpbm
       programs can be made, with the right options, to be idempotent (i.e. to do the same thing as pnmtopnm).

       Then David Jones realized that the existing pamtopnm already did everything that pnmtopnm did and more, so in Netpbm 10.27 (March 2005), pnmtopnm became simply an alternate name for pamtopnm.


SEE ALSO
       ppmtoppm(1)

       pgmtopgm(1)

       pamtopnm(1)

       pnm(5)



netpbm documentation                                                                            24 March 2005                                                                         Pnmtopnm User Manual(0)
