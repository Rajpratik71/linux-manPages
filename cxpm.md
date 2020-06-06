CXPM(1)                                                                                    General Commands Manual                                                                                    CXPM(1)



NAME
       cxpm - Check an XPM (X PixMap) file, versions XPM 1, 2, or 3.

SYNOPSIS
       cxpm [filename]

DESCRIPTION
       The  cxpm  program  can be used to check the format of any XPM (version 1, 2, or 3) file. On error, unlike sxpm, cxpm prints out an error message indicating where the parser choked. This should help
       finding out what's wrong with an XPM file but do not expect too much from it though. This is not even close from being some kind of lint program for XPM. First,  it  stops  at  the  first  error  it
       encounters - so several fix and retry cycles may be necessary to get your file to parse successfully. Second, cxpm only cares about the format. If, for instance, your pixmap uses too many colors for
       your system you still may experience difficulties displaying it. Be warned.

       When no filename is given cxpm reads from the standard input.

AUTHOR
       Arnaud Le Hors    (lehors@sophia.inria.fr)
       Copyright (C) 1998 by Arnaud LE HORS.



X Version 11                                                                                    libXpm 3.5.12                                                                                         CXPM(1)
