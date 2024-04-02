WEAVE(1)                                                                         General Commands Manual                                                                         WEAVE(1)

NAME
       weave - translate WEB to TeX

SYNOPSIS
       weave [-x] webfile[.web] [changefile[.ch]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  weave program is used to create a TeX file for viewing a Web program.  It takes appropriate care of typographic details like page layout and the use of indentation, italics,
       boldface, etc., and it supplies extensive cross-index information that it gathers automatically.  The command line arguments are the same as for tangle except for the option:  -x
       says  to omit the index, module name list, and table of contents pages.  (A CONTENTS.tex file will still be written when the TeX file is processed, however, unless some macros in
       webmac.tex are redefined.)

       The output TeX file name is formed by adding .tex to the root of the Web file name.

       There are several macros that probably should be redefined by the programmer at the beginning of the Web file.  It is a good idea to set \title to the name of the program.   And,
       to cause output of only changed modules, one can say \let\maybe=\iffalse (usually as the first change in the change file).

ENVIRONMENT
       The environment variable WEBINPUTS is used to search for the input files, or the system default if WEBINPUTS is not set.  See tex(1) for the details of the searching.

FILES
       $TEXMFMAIN/tex/plain/base/webmac.tex
           TeX macros used by weave output.

SEE ALSO
       tangle(1) for references, authors, and other information.

Web2C 2019/dev                                                                         16 June 2015                                                                              WEAVE(1)
