prepmx(1)                                                                           prepmx Manual Page                                                                          prepmx(1)

NAME
       prepmx - preprocessor for PMX, easy music typesetting program

SYNOPSIS
       prepmx [options] jobname [outdir/] [stylefile]

DESCRIPTION
       M-Tx  is an easy to use preprocessor language for the PMX music typesetting program, aimed at people who are not experts.  For an easy example, have a look at the following exam‐
       ple:

         c2+       e4    g   | b4d-  c1 d c2        |
         c8 g+ e g c- g+ e g | d g f g    c- g+ e g |

       For syntax reference, please look at the M-Tx manual written by Dirk Laurie, the creator of the M-Tx language and the author of prepmx(1), its command-line utility.

       prepmx processes the file jobname.mtx to generate jobname.pmx.  You can then process this file using the pmxab(1) command, which is a preprocessor for MusiXTeX.

       outdir/ is the directory where `pmx' will put the final .tex file. Note that the trailing slash is mandatory. You  can  provide  a  stylefile  for  M-Tx.  If  omitted,  the  file
       `mtxstyle.txt' in the current directory is used, if there is one.

OPTIONS
       Options can also be specified in a `Options:' line in the preamble, which takes precedence over the command line.

       -b     disable unbeamVocal

       -c     disable doChords

       -D     enable debugMode

       -f     enable solfaNoteNames

       -i     enable ignoreErrors

       -m     disable doLyrics

       -n     enable instrumentNames

       -t     disable doUptext

       -u     disable uptextOnRests

       -v     enable beVerbose

       -w     enable pedanticWarnings

       -n     select Special Case n

       -H     print enabled status of all options

EXIT STATUS
       If  no  error  was found, prepmx exits with return code 0.  In case of an error, the line number of the processed line is returned. This may not always be the line containing the
       actual error. A return status of 10000 means that the input file was empty or could not be opened.

SEE ALSO
       M-Tx User's Guide (mtxdoc.pdf)
       pmxab(1), musixtex(1)

AUTHORS
       prepmx was written by Dirk Laurie <dirk.laurie@gmail.com>. This manual page was written by Roland Stigge <stigge@antcom.de> for the Debian project. It was revised and extended by
       Nis Martensen <nis.martensen@web.de> and Bob Tennent <rdt@cs.queensu.ca>.

M-Tx Version 0.63                                                                    08 January 2018                                                                            prepmx(1)
