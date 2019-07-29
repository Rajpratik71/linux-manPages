PFBTOPS(1)                                                                                 General Commands Manual                                                                                 PFBTOPS(1)



NAME
       pfbtops - translate a PostScript font in .pfb format to ASCII

SYNOPSIS
       pfbtops [ -v ] [ pfb_file ]

DESCRIPTION
       pfbtops translates a PostScript font in .pfb format to ASCII, splitting overlong lines in text packets into smaller chunks.  If pfb_file is omitted the pfb file will be read from the standard input.
       The ASCII format PostScript font will be written on the standard output.  PostScript fonts for MS-DOS are normally supplied in .pfb format.

       The resulting ASCII format PostScript font can be used with groff.  It must first be listed in /usr/share/groff/1.22.2/font/devps/download and /usr/share/groff/1.22.2/font/devpdf/download.

OPTIONS
       -v     Print the version number.

SEE ALSO
       grops(1), gropdf(1)



Groff Version 1.22.2                                                                           07 February 2013                                                                                    PFBTOPS(1)
