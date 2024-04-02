DVICOPY(1)                                                                            Web2C 2019/dev                                                                           DVICOPY(1)

NAME
       dvicopy, odvicopy - produce modified copy of DVI file

SYNOPSIS
       dvicopy [options] [infile[.dvi] [outfile[.dvi]]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       dvicopy  reads  a  DVI  file, expands any references to virtual fonts to base fonts, and writes the resulting DVI file.  Thus you can use virtual fonts even if your DVI processor
       does not support them, by passing the documents through dvicopy first.

OPTIONS
       -magnification=NUMBER
              Override existing magnification with NUMBER.

       -max-pages=NUMBER
              Process NUMBER pages; default one million.

       -page-start=PAGE-SPEC
              Start at PAGE-SPEC, for example `2' or `5.*.-2'.

SEE ALSO
       dviselect(1), dvitype(1).

AUTHORS
       Peter Breitenlohner wrote the program.  Klaus Guntermann originally ported it to Unix.

24 January 1999                                                                            TeX                                                                                 DVICOPY(1)
