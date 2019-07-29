
FIG2PS2TEX(1)                                                 General Commands Manual                                                FIG2PS2TEX(1)

NAME
       fig2ps2tex - generate a TeX file for including a PostScript file

SYNOPSIS
       fig2ps2tex file

DESCRIPTION
       Fig2ps2tex  generates  a  TeX  file for including a PostScript file in a TeX document.  This involves calculating the bounding box from the
       Postscript document.  The TeX inclusion file is written to stdout.

       There is also Fig2ps2tex.sh for those systems without csh and/or dc (Linux for example).

       Note that the psfig macro package provides a more sophisticated approach to including Postscript files  in  LaTeX  docuements.   Fig2ps2tex
       works with plain TeX however.

USAGE
       Assume the Postscript file is called foo.ps .  The command

                                                              % fig2ps2tex foo.ps >foo.tex

       will create the inclusion file with bounding information.  Then include this file in your TeX document with the command

                                                                       \input{foo}

SEE ALSO
       psfig(1), latex(1), fig2dev(1), transfig(1).

AUTHOR
       Micah Beck
       Cornell University

       Man page by George Ferguson, ferguson@cs.rochester.edu.

COPYRIGHT
       Copyright 1994 Micah Beck

       The  X Consortium, and any party obtaining a copy of these files from the X Consortium, directly or indirectly, is granted, free of charge,
       a full and unrestricted irrevocable, world-wide, paid up, royalty-free, nonexclusive right and license to deal in this software  and  docu‐
       mentation  files  (the  "Software"),  including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
       and/or sell copies of the Software, and to permit persons who receive copies from any such party to do so, with the only requirement  being
       that this copyright notice remain intact.  This license includes without limitation a license to do the foregoing actions under any patents
       of the party supplying this software to the X Consortium.

                                                                    14 Mar 1991                                                      FIG2PS2TEX(1)
