DT2DV(1)                                                                         General Commands Manual                                                                         DT2DV(1)

NAME
       dt2dv - convert a DTL text representation of a TeX DVI file to a binary DVI file

SYNOPSIS
       dt2dv [-debug] [-group] [-si] [-so] [input-DTL-file] [output-DVI-file]

       In the absence of the -si and -so options, both file arguments are required in the order input-DTL-file output-DVI-file.  But also see the OPTIONS section below.  No default file
       extensions are supplied.

DESCRIPTION
       dt2dv converts a text representation of a TeX DVI file, usually produced by the companion dv2dt(1) utility, back to a binary DVI file.  DTL  (DVI  Text  Language)  files  can  be
       edited,  with care, and then restored to DVI form for processing by any TeX DVI driver program.  In DTL files, font directory names and font names are preceded by a length field,
       which must be updated if the names are modified.

       dvitype(1) can also display a textual representation of DVI files, but in some implementations at least, it cannot be used in batch mode, and its output is  not  well-suited  for
       conversion back to a DVI file.

       The  format  of  TeX  DVI  files is fully described in Donald E. Knuth, TeX: The Program, Addison-Wesley (1986), ISBN 0-201-13437-3, as well as in the dvitype(1) literate program
       source code.  Brief descriptions of the DTL and DVI formats are given in dv2dt(1).

OPTIONS
       -debug   Turn on detailed debugging output.

       -group   Expect each DTL command to be in parentheses.

       -si      Read all DTL commands from standard input.

       -so      Write all DVI commands to standard output.

SEE ALSO
       dv2dt(1), dvitype(1), tex(1).

FILES
       *.dvi   binary TeX DVI file.

       *.dtl   text representation of a TeX DVI file in DVI Text Language format.

AUTHOR
       dt2dv and dv2dt(1) were written by
              Geoffrey Tobin
              Department of Electronic Engineering
              La Trobe University
              Bundoora, Victoria 3083
              Australia
              Tel: +61 3 479 3736
              FAX: +61 3 479 3025
              Email: <G.Tobin@ee.latrobe.edu.au>

       These manual pages were written primarily by
              Nelson H. F. Beebe, Ph.D.
              Center for Scientific Computing
              Department of Mathematics
              University of Utah
              Salt Lake City, UT 84112
              Tel: +1 801 581 5254
              FAX: +1 801 581 4148
              Email: <beebe@math.utah.edu>

Version 0.6.0                                                                         08 March 1995                                                                              DT2DV(1)
