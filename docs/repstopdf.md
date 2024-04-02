EPSTOPDF(1)                                                                      General Commands Manual                                                                      EPSTOPDF(1)

NAME
       epstopdf, repstopdf - convert an EPS file to PDF

SYNOPSIS
       epstopdf [options] [epsfile [pdffile.pdf]]

DESCRIPTION
       By default, epstopdf converts the input PostScript file to PDF, using Ghostscript.

       Epstopdf  transforms  the Encapsulated PostScript file epsfile (or standard input) so that it is guaranteed to start at the 0,0 coordinate, and it sets a page size exactly corre‐
       sponding to the BoundingBox.  Thus, the result needs no cropping, and the PDF MediaBox is correct.

       By default, the output name is the input name with any extension replaced by .pdf.  An output name ending with .pdf can also be given as a second argument on the command line, or
       the --outfile (-o) option can be used with any name.

       The output is PDF 1.5 by default; use, e.g.,
       --gsopt=-dCompatibilityLevel=1.7
       to change this. (Until epstopdf 2.28 (released September 2018), the PDF version was whatever the underlying Ghostscript or other interpreter produced by default.)

       PJL commands at the start of a file are removed.  DOS EPS binary files (TN 5002) are supported.

       If the bounding box in the input is incorrect, of course there will be resulting problems.

OPTIONS
       Options  may start with either "-" or "--", and may be unambiguously abbreviated.  It is best to use the full option name in scripts to avoid possible collisions with new options
       in the future.

       General script options:

       --help display help message and exit

       --version
              display version information and exit

       --outfile=file
              write result to file.  If this option is not given, and --nogs or --filter is specified, write to standard output; otherwise, the default is to construct the  output  file
              name by replacing any extension in the input file with `.pdf'.

       --[no]debug
              write debugging info (default: false).

       --[no]exact
              scan ExactBoundingBox (default: false).

       --[no]filter
              read standard input and (unless --outfile is given) write standard output (default: false).

       --[no]gs
              run  Ghostscript  (default:  true).   With --nogs, output (to standard output by default) the PostScript that would normally be converted; that is, the input PostScript as
              modified by epstopdf.

       --[no]hires
              scan HiresBoundingBox (default: false).

       --restricted=val
              turn on restricted mode (default: [true for repstopdf, else false]); this forbids the use of --gscmd and other options and imposes restrictions on  the  input  and  output
              file names according to the values of openin_any and openout_any (see the Web2c manual, http://tug.org/web2c).

       Options for Ghostscript (more info below):

       --gscmd=val
              pipe output to val (default: [gswin32c on Windows, else gs])

       --gsopt=val
              include val as one argument in the gs command (can be repeated).

       --gsopts=val
              split val at whitespace and include each resulting word as an argument in the gs command (can be repeated).

       --autorotate=val
              set AutoRotatePages (default: None); recognized val choices: None, All, PageByPage.  For EPS files, PageByPage is equivalent to All.

       --[no]compress
              use compression in the output (default: true); if turned off, passes -dUseFlateCompression=false.

       --device=dev
              use -sDEVICE=dev (default: pdfwrite); not allowed in restricted mode.

       --[no]embed
              embed fonts (default: true); passes -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true.

       --[no]gray
              grayscale output (default: false); passes -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray.

       --pdfsettings=val
              use -dPDFSETTINGS=/val (default is `prepress' if --embed, else empty); recognized val choices: screen, ebook, printer, prepress, default.

       --[no]quiet
              use -q, a.k.a. -dQUIET (default: false).

       --res=dpi, dpixdpi
              set image resolution (default: [use gs default]); ignored if --debug is set.

       --[no]safer
              use -d(NO)QUIET (default: true).

       In addition to the specific options above, additional options to be used with gs can be specified with either or both of the two cumulative options --gsopts and --gsopt.

       --gsopts takes a single string of options, which is split at whitespace, each resulting word then added to the gs command line individually.

       --gsopt adds its argument as a single option to the gs command line.  It can be used multiple times to specify options separately, and is necessary if an option or its value con‐
       tains whitespace.

       In restricted mode, options are limited to those with names and values known to be safe.  Some options taking booleans, integers or fixed names are allowed, those taking  general
       strings are not.

EXAMPLES
       These examples all equivalently convert `test.eps' to `test.pdf':
       epstopdf test.eps
       epstopdf test.eps test.pdf
       cat test.eps | epstopdf --filter >test.pdf
       cat test.eps | epstopdf -f -o=test.pdf

       Example for using HiResBoundingBox instead of BoundingBox:
       epstopdf --hires test.eps

       Example for epstopdf's attempt at correcting PostScript:
       $program --nogs test.ps >testcorr.ps

       In all cases, you can add --debug (-d) to see more about what epstopdf is doing.

BUGS
       The case of "%%BoundingBox: (atend)" when input is not seekable (e.g., from a pipe) is not supported.

       Report  bugs  in  the  program or this man page to tex-k@tug.org.  When reporting bugs, please include an input file and the command line options specified, so the problem can be
       reproduced.

SEE ALSO
       gs(1), pdfcrop(1).

       The epstopdf LaTeX package, part of the oberdiek bundle, which automates running this script on the fly under TeX: http://ctan.org/pkg/epstopdf-pkg.

AUTHOR
       Originally written by Sebastian Rahtz, for Elsevier Science, with subsequent contributions from Thomas Esser, Gerben Wierda, Heiko Oberdiek, and  many  others.   Currently  main‐
       tained by Karl Berry.

       Man page originally written by Jim Van Zandt.

       epstopdf home page: http://tug.org/epstopdf.

       You may freely use, modify and/or distribute this man page.

                                                                                    17 September 2018                                                                         EPSTOPDF(1)
