DVIPOS(1)                                                                                ConTeXt                                                                                DVIPOS(1)

NAME
       dvipos - compute positions in a DVI file

SYNOPSIS
       dvipos [ OPTION... ] infile[.dvi]

DESCRIPTION
       dvipos  parses  a  DVI file looking for pos: specials.  It currently recognizes pos:pxy, pos:pxywhd, pos:pxyplus, pos:begbox, pos:endbox, pos:beglines, and pos:endlines.  It then
       outputs the information from those specials along with information that only a DVI postprocessor could determine, such as the current x and y location.  The output looks like:
          \pospxywhd{text:54}{54}{10663sp}{8535sp}{21326sp}{34081sp}{0sp}
       and is suitable for including in a tex(1) or pdftex(1) auxilliary file, such as document.tuo, to be read in by the next run of the tex(1) or similar typesetting engine.

OPTIONS
       -h, --help
              print usage.

       -W, --warning
              print warnings.

       -v, --verbose
              print verbose output.

       -d, --debug
              print dvitype(1) debugging data.

       -s, --smashchars
              regard height and depth as zero.

       -o, --output=FILE
              send all output to FILE.  Without this option, output goes to stdout.

       -b, --bbox[=FILE]
              send bounding box to FILE (default FILE is infile.pos).

       -f, --framed[=BASE]
              request copy of DVI file, BASE.dvi, with bounding boxes framed (default FILE is infile_frames.dvi).  See the --framesize option.

       -m, --mag=INT
              override tex(1) magnification by INT.

       -w, --framesize=INT
              set frame rule size by INT (default 6554 = .1pt).

       -p, --pages=X:Y
              set page ranges from X to Y.

USAGE
       dvipos is run mostly behind the scenes by ConTeXt's texexec(1) between runs of tex(1) or pdftex(1), in order to provide information to and get information about positional graph‐
       ics.   These graphics are provided by the MetaFun interface to mpost(1).  dvipos is not used (or needed) in PDF-output mode but is needed for DVI-output mode.  pdftex(1) starting
       with version 1.40 can produce position information even in DVI mode, so once the ConTeXt macros take advantage of this feature, the need for dvipos will fade.

       Until then, here is a typical use of dvipos:
          dvipos notes.dvi
       The position information that is output is collected by texexec(1) to include in the notes.tuo auxilliary file to use in the next run.

EXAMPLES
       Extract positions from doc.dvi, with output to doc.loc:
              dvipos -o doc.loc doc.dvi

       Same as above, but also send bbox information to doc.pos:
              dvipos -b -o doc.loc doc.dvi

       Instead send bbox information to /tmp/debug.pos:
              dvipos -b=/tmp/debug.pos -o doc.loc doc.dvi

SEE ALSO
       dvips(1), dvitype(1), mpost(1), pdftex(1), tex(1), texexec(1).

       For more about positional graphics, see the MetaFun documentation on the ConTeXt wiki ⟨http://wiki.contextgarden.net/MetaFun⟩.

BUGS
       If you specify a file for the -b option, you must join the option and name with = rather than (the more common) space:
          dvipos -b=/tmp/debug.pos notes.dvi
       works, but
          dvipos -b /tmp/debug.pos notes.dvi
       does not.

AUTHOR
       dvipos is written by Jin-Hwan Cho <chofchof@ktug.or.kr>.  It is free software (GPLv2 or later).  This manpage was written by Sanjoy Mahajan <sanjoy@mit.edu> and is in the  public
       domain.

dvipos 20070107 (KPATHSEA)                                                             January 2007                                                                             DVIPOS(1)
