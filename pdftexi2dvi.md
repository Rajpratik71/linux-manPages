TEXI2DVI(1)                                                        User Commands                                                       TEXI2DVI(1)

NAME
       texi2dvi - convert Texinfo documents to DVI or PDF

SYNOPSIS
       texi2dvi [OPTION]... FILE...
       texi2pdf [OPTION]... FILE...
       pdftexi2dvi [OPTION]... FILE...

DESCRIPTION
       Run each Texinfo or (La)TeX FILE through TeX in turn until all cross-references are resolved, building all indices.  The directory contain‐
       ing each FILE is searched for included files.  The suffix of FILE is used to determine its  language  ((La)TeX  or  Texinfo).   To  process
       (e)plain TeX files, set the environment variable LATEX=tex.

       In  order  to  make  texi2dvi a drop-in replacement of TeX/LaTeX in AUC-TeX, the FILE may also be composed of the following simple TeX com‐
       mands.

       `\input{FILE}'
              the actual file to compile

       `\nonstopmode'
              same as --batch

       When invoked as `texi2pdf' or `pdftexi2dvi', or given the option --pdf or --dvipdf, generate PDF output.  Otherwise, generate DVI.

   General options:
       -b, --batch
              no interaction

       -D, --debug
              turn on shell debugging (set -x)

       -h, --help
              display this help and exit successfully

       -o, --output=OFILE
              leave output in OFILE; only one input FILE is allowed

       -q, --quiet
              no output unless errors (implies --batch)

       -s, --silent
              same as --quiet

       -v, --version
              display version information and exit successfully

       -V, --verbose
              report on what is done

       --max-iterations=N
              don't process files more than N times [7]

       --mostly-clean
              remove the auxiliary files and directories, but not the output

   Output format:
       --dvi  output a DVI file [default]

       --dvipdf
              output a PDF file via DVI (using a dvi-to-pdf program)

       --html output an HTML file from LaTeX, using HeVeA

       --info output an Info file from LaTeX, using HeVeA

       -p, --pdf
              use pdftex or pdflatex for processing

       --ps   output a PostScript file via DVI (using dvips)

       --text output a plain text file from LaTeX, using HeVeA

   TeX tuning:
       -@     use @input instead of \input for preloaded Texinfo

       -e, -E, --expand
              force macro expansion using makeinfo

       -I DIR search DIR for Texinfo files

       -l, --language=LANG
              specify LANG for FILE, either latex or texinfo

       --no-line-error
              do not pass --file-line-error to TeX

       --shell-escape
              pass --shell-escape to TeX

       --src-specials
              pass --src-specials to TeX

       -t, --command=CMD
              insert CMD in copy of input file

       or --texinfo=CMD
              multiple values accumulate

       --translate-file=FILE
              use given charset translation file for TeX

   Build modes:
       --build=MODE
              specify the treatment of auxiliary files [local]

       --tidy same as --build=tidy

       -c, --clean
              same as --build=clean

       --build-dir=DIR
              specify where the tidy compilation is performed; implies --tidy; defaults to TEXI2DVI_BUILD_DIRECTORY [.]

       The MODE specifies where the TeX compilation takes place, and, as a consequence, how auxiliary files are treated.  The build mode can  also
       be set using the environment variable TEXI2DVI_BUILD_MODE.

   Valid values of MODE are:
       `local'
              compile in the current directory, leaving all the auxiliary files around.  This is the traditional TeX use.

       `tidy' compile in a local *.t2d directory, where the auxiliary files are left.  Output files are copied back to the original file.

       `clean'
              same as `tidy', but remove the auxiliary directory afterwards.  Every compilation therefore requires the full cycle.

       The values of these environment variables are used to run the corresponding commands, if they are set:

              BIBER BIBTEX DVIPDF DVIPS EGREP HEVEA LATEX MAKEINDEX MAKEINFO PDFLATEX PDFTEX SED T4HT TEX TEX4HT TEXINDEX TEXINDY THUMBPDF_CMD

       Regarding --dvipdf, if DVIPDF is not set in the environment, the following programs are looked for (in this order): dvipdfmx dvipdfm dvipdf
       dvi2pdf dvitopdf.

       Any CMD strings are added after @setfilename for Texinfo input, or in the first line for LaTeX input.

       If Texinfo is installed on your site, then the command

              info texi2dvi

       should give you access to more documentation.

REPORTING BUGS
       Report bugs to bug-texinfo@gnu.org, general questions and discussion to help-texinfo@gnu.org.
       GNU Texinfo home page: <http://www.gnu.org/software/texinfo/>
       General help using GNU software: <http://www.gnu.org/gethelp/>

COPYRIGHT
       Copyright © 2016 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for texi2dvi is maintained as a Texinfo manual.  If the info and texi2dvi programs are properly  installed  at  your
       site, the command

              info texi2dvi

       should give you access to the complete manual.

texi2dvi 6991                                                      February 2016                                                       TEXI2DVI(1)
