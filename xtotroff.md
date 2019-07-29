XTOTROFF(1)                                                   General Commands Manual                                                  XTOTROFF(1)

NAME
       xtotroff - convert X font metrics into GNU troff font metrics

SYNOPSIS
       xtotroff [ -rresolution ] [ -spoint-size ] [ -v ] FontMap

DESCRIPTION
       xtotroff  takes  a FontMap, which maps groff fonts to X11 fonts, creates GNU troff metric files for all fonts listed.  Each line in FontMap
       consists of GNU troff font name and an X font name (XLFD) pattern, separated by whitespace.  Example:

         TB   -adobe-times-bold-r-normal--*-*-*-*-p-*-iso8859-1

       The wildcards in the patterns are filled with the arguments to the -r and -s switches.  If a font name is still ambiguous, xtotroff aborts.

OPTIONS
       It is possible to have whitespace between a command line option and its parameter.

       -rresolution
              Set the resolution for all font patterns in FontMap.  The value is used for both the horizontal and  vertical  resolution.   If  not
              specified, a resolution of 75dpi is assumed.

       -spoint-size
              Set the point size for all font patterns in FontMap.  If not specified, a size of 10pt is assumed.

       -v     Print the version number.

BUGS
       The only supported font encodings are ‘iso8859-1’ and ’adobe-fontspecific’.

SEE ALSO
       gxditview(1)

COPYING
       Copyright © 2004-2014 Free Software Foundation, Inc.

       Permission  is  granted  to make and distribute verbatim copies of this manual provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that  the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission  is  granted  to  copy and distribute translations of this manual into another language, under the above conditions for modified
       versions, except that this permission notice may be included in translations approved by the Free Software Foundation  instead  of  in  the
       original English.

Groff Version 1.22.3                                              28 January 2016                                                      XTOTROFF(1)
