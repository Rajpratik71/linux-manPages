
TRANSFIG(1)                                                   General Commands Manual                                                  TRANSFIG(1)

NAME
       transfig - creates a makefile for portable LaTeX figures

SYNOPSIS
       transfig [ -L language ] [ -M makefile ] [ -T texfile ] [ -I macrofile ] [ -V ] [ control_specs figfile ... ]

DESCRIPTION
       Transfig  creates  a  makefile  to  translate figures described in Fig code or PIC into a specified LaTeX graphics language.  PIC files are
       identified by the suffix ".pic"; Fig files can be specified either with or without the suffix ".fig" .  Transfig also creates a  TeX  macro
       file appropriate to the target language.

OPTIONS
       The  language  specifier must be one of box, cgm, eepic, eepicemu, emf, epic, eps, ge, gif, ibmgl, jpeg, latex, map, mf, mmp, mp, pcx, pdf,
       pdftex, pdftex_t, pic, pictex, png, ppm, ps, psfig, pstex, pstex_t, ptk, sld, textyl, tiff, tk, tpic, xbm,  xpm  or  null.   The  specifier
       psfig is like the ps specifier, except that it make use of the psfig macro package.  The specifier pstex is like psfig, except that it uses
       LaTeX to process formatted (special) text.  The specifier null results in the figures being replaced by  empty  boxes  of  the  appropriate
       size.  If no language is specified, epic is the default.

       The  names  of the makefile and TeX macro file can be set with the -M and -T options.  The default names are "Makefile" and "transfig.tex",
       respectively.  If there is already an existing makefile in the directory, transfig first renames it to makefile~.  The same holds  for  any
       existing  TeX macro file.  If the -I option is specified, then a command to read in macrofile is      inserted into the TeX macro file.  If
       the -V option is specified, the program version number is printed only.

       Control specifiers are

       -m mag set the magnification at which the figure is rendered (default 1.0).

       -f font
              set the default font family used for text objects (default "rm").

       -s fontsize
              set the default font size (in points) for text objects (default 11*mag).

       -o option
              pass the specified option string through to fig2dev.

       If there is no scaling, the default font is an eleven point roman font.  Language and control specifiers may occur  more  than  once;  they
       affect the translation of files which appear to their right in the argument list.  If no files are specified, then "*.fig" is assumed.

SEE ALSO
       fig(l), fig2dev(l), pic(l), pic2fig(l), xfig(l)

COPYRIGHT
       Copyright (C) 1985 Supoj Sutantavibul
       Copyright (C) 1991 Micah Beck
       Parts Copyright (C) 1991-2002 Brian Smith

       THE  AUTHORS  DISCLAIM  ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
       EVENT SHALL THE AUTHORS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF  USE,
       DATA  OR  PROFITS,  WHETHER  IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
       PERFORMANCE OF THIS SOFTWARE.

       Any party obtaining a copy of these files is granted, free of charge, a full and unrestricted irrevocable, world-wide,  paid  up,  royalty-
       free,  nonexclusive  right  and license to deal in this software and documentation files (the "Software"), including without limitation the
       rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons who  receive
       copies from any such party to do so, with the only requirement being that this copyright notice remain intact.

AUTHOR
       Micah Beck

                                                            Version 3.2.4 November 2002                                                TRANSFIG(1)
