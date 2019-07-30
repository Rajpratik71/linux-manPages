DVITYPE(1)                                                                       General Commands Manual                                                                       DVITYPE(1)

NAME
       dvitype, odvitype - translate a dvi file for humans

SYNOPSIS
       dvitype dvi_name[.dvi]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The dvitype program translates a DVI (DeVice Independent) file output by (for example) tex(1) or gftodvi(1), to a file that humans can read. It also serves as a DVI file-validat‐
       ing program (i.e., if dvitype can read it, it's correct) and as an example of a DVI-reading program for future device drivers.

       The output file can include all commands, just the important ones, or none at all (in which case only errors are reported).  A subinterval of pages may be selected for  translit‐
       eration; the magnification and resolution of the ``output device'' may be changed; and so on. All options are specified with an on-line dialog.

       The .dvi extension is supplied if omitted from dvi_name.  The output goes to stdout.

OPTIONS
       -dpi=REAL
              Set resolution to REAL pixels per inch; default 300.0.

       -magnification=NUMBER
              Override existing magnification with NUMBER.

       -max-pages=NUMBER
              Process NUMBER pages; default one million.

       -output-level=NUMBER
              Verbosity level, from 0 to 4; default 4.

       -page-start=PAGE-SPEC
              Start at PAGE-SPEC, for example `2' or `5.*.-2'.

       -show-opcodes
              Show numeric opcodes (in decimal).

ENVIRONMENT
       The  environment  variable  TEXFONTS  is used to search for the TFM files used in the DVI file.  See tex(1) for the details of the searching.  If TEXFONTS is not set, it uses the
       system default.

SEE ALSO
       gftype(1), pktype(1).
       Donald E. Knuth, TeXware.

AUTHORS
       Donald E. Knuth wrote the program.  It was published as part of the TeXware technical report, available from the TeX Users Group.  Howard  Trickey  and  Pavel  Curtis  originally
       ported it to Unix.

Web2C 2019/dev                                                                         16 June 2015                                                                            DVITYPE(1)
