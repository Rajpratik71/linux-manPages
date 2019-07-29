PFBTOPS(1)                                                    General Commands Manual                                                   PFBTOPS(1)

NAME
       pfbtops - translate a PostScript font in .pfb format to ASCII

SYNOPSIS
       pfbtops [ -v ] [ pfb_file ]

DESCRIPTION
       pfbtops translates a PostScript font in .pfb format to ASCII, splitting overlong lines in text packets into smaller chunks.  If pfb_file is
       omitted the pfb file will be read from the standard input.  The ASCII format PostScript font will be written on the standard output.  Post‐
       Script fonts for MS-DOS are normally supplied in .pfb format.

       The  resulting ASCII format PostScript font can be used with groff.  It must first be listed in /usr/share/groff/1.22.3/font/devps/download
       and /usr/share/groff/1.22.3/font/devpdf/download.

OPTIONS
       -v     Print the version number.

SEE ALSO
       grops(1), gropdf(1)

COPYING
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this manual provided the copyright notice and this  permission  notice  are
       preserved on all copies.

       Permission  is granted to copy and distribute modified versions of this manual under the conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this manual into another language, under the  above  conditions  for  modified
       versions,  except  that  this  permission notice may be included in translations approved by the Free Software Foundation instead of in the
       original English.

Groff Version 1.22.3                                              28 January 2016                                                       PFBTOPS(1)
