PS2PK(1)                                                                         General Commands Manual                                                                         PS2PK(1)

NAME
       ps2pk - creates a TeX pkfont from a type1 PostScript font

SYNOPSIS
       ps2pk [ -v ] [ -eenc ] [ -Xxres ] [ -Eexpansion ] [ -Sslant  ] [ -Ppointsize ] [ -Rbaseres ] [ -raspectratio  ] [ -Yyres ] [ -aAFMfile ] [ -mmodename ] type1 [pkfont]

DESCRIPTION
       This program renders a given type1 PostScript font at a given pointsize (default 10.0 points) and resolution (default 300dpi) into a TeX pkfont.

       To  generate  the  pkfont  ps2pk  needs  a valid type1 font file (for example Utopia-Regular, Utopia-Regula.pfb or Utopia-Regula.pfa) and its corresponding AFM-file (Utopia-Regu‐
       lar.afm) with the font metrics.  The program accepts both the binary type1 format (Utopia-Regula.pfb) and its ASCII equivalent (Utopia-Regular or Utopia-Regula.pfa).   To  locate
       the  files,  ps2pk uses the kpathsea library (see the info page on kpathsea). Additionally, pfb and pfa files are searched for in the directory specified in the environment vari‐
       able T1INPUTS, and afm files are searched in AFMFONTS, if they are set (the -v flag will report which filenames are looked for).

       The program will make a pkfont in which the character codes are derived from their AFM (Adobe Font Metrics) defined values.  This can  be  overruled  by  specifying  an  explicit
       encoding  file  via the -e option.  The encoding file enc should contain a valid PostScript encoding containing PostScript names like /hyphen.  Here is an incomplete example (see
       afm2tfm for complete syntax):

              % This is the EC encoding.
              /ECEncoding [          % now 256 chars follow
              % 0x00
                /grave /acute /circumflex /tilde /dieresis /hungarumlaut
                /ring /caron /breve /macron /dotaccent /cedilla
                /ogonek /quotesinglbase /guilsinglleft /guilsinglright

                (Rest of lines omitted.)

              % 0xF0
                /eth /ntilde /ograve /oacute /ocircumflex /otilde
                /odieresis /oe /oslash /ugrave /uacute /ucircumflex
                /udieresis /yacute /thorn /germandbls ] def

       Options and arguments:

       -aAFMfile   Overrules the name that is used to locate the AFM file.

       -eenc       Name of a file containing an encoding scheme (default - the encoding named in the AFM-file is used).  The actual PostScript name of the encoding scheme is written  as
                   a "special" at the end of the pkfont.

       -Eextension The extension factor (real value, default 1.0).

       -mmodename  A modename such as would be used by METAFONT (default "Unknown mode").

       -Ppointsize The desired pointsize (real value, default 10.0 points).

       -Rbaseres   The  desired  base resolution (integer value, default 300 dpi).  If this differs from the value of xres, the appropriate magnification will be shown in the "specials"
                   at the end of the pkfont. If possible, this will be expressed as a magstep, otherwise as a real number. For example, a pkfont with an xres of 329, using  the  default
                   base resolution of 300, will include the "special" text "mag=magstep(0.5)" at the end of the font.

       -raspectratio
                   The  desired  aspect ratio (expression, integerY/integerX, default 300/300).  This will be shown in the "specials" at the end of the pkfont.  Setting the aspect ratio
                   creates a value for yres but an explicit yres value will take precedence.  Argument must be in "" if spaces are left around `/'.

       -Sslant     The slant (real value, default 0.0).

       -Xxres      The resolution in the X direction (integer value, default 300 dpi).

       -Yyres      The resolution in the Y direction (integer value, default the value of xres). If yres differs from xres, a "special" text giving the aspect ratio will be  written  at
                   the end of the pkfont.

       -v          Verbose flag. (Tells what the program is doing.)

       type1       The  name  of  the  PostScript type1 font.  The name of the AFM-file will be constructed from this name by removing the extension (if suplied) and adding ".afm".  The
                   PostScript "FontName" is extracted from the AFM-file and written into a "special" at the end of the pkfont.

       [pkfont]    The name of the resulting pkfont can be overruled with this name.  The default name of pkfont is derived from the basename of the type1 font, the pointsize and  xres.
                   For  example  `ps2pk  -P17.28  Utopia-Regular' will result in `Utopia-Regular17.300pk'.  An explicit value for the name of the pkfont is necessary when the type1 font
                   name already shows the point size, otherwise the pointsize value is catenated on to the pkfont basename which is usually not what is wanted.

       The following PK "specials" provide an internal check on the characteristics of the pkfont, in accordance with the recommendations of the TeX Working Group on the  TeX  Directory
       Standard (TWG-TDS):
       "fontid=FontName", "codingscheme=Encoding", "fontfacebyte", "mag", "mode=(ps2pk)modename", "pixels-per-inch", and "aspect-ratio" if it is other than unity.

ACKNOWLEDGEMENT
       This program uses the Type1 hinting and rendering software IBM has donated to the X Consortium.

SEE ALSO
       `METAFONT: The Program', Donald Knuth.
       `The GFtoPK processor', belonging to the METAFONTware.
       `Adobe Font Metric Files', Version 3.0, PostScript Developer
       Support Group.
       afm2tfm(1)
       pk2bm(1)
       kpsewhich(1)
       info kpathsea

VERSION
       1.4 (January 1994)

AUTHOR
       Piet Tutelaers, modified for ps2pkm by Pierre A. Mackay.  This manpage was adapted to teTeX by Frank Kuester.

       Maintained in TeX Live; please send bug reports or other correspondence to tex-k@tug.org (http://lists.tug.org/tex-k).

                                                                                        1 Feb 2016                                                                               PS2PK(1)
