ISODEBUG(1)                                                                                 Schily´s USER COMMANDS                                                                                ISODEBUG(1)



NAME
       isodebug - print genisoimage debug info from ISO-9660 image

SYNOPSIS
       isodebug [ options ] [ file ]

DESCRIPTION
       Isodebug reads the debug info written by genisoimage(8) from within a ISO-9660 file system image and prints them.

OPTIONS
       -help  Prints a short summary of the isodebug options and exists.

       -version
              Prints the isodebug version number string and exists.

       -i filename
              Filename to read ISO-9660 image from.

       dev=target
              SCSI target to use as CD/DVD-Recorder.  See wodim(1) for more information on now to use this option.

FILES
SEE ALSO
       wodim(1), genisoimage(1).

AUTHOR
       Joerg Schilling
       Seestr. 110
       D-13353 Berlin
       Germany

AUTHOR
       Joerg Schilling
       Seestr. 110
       D-13353 Berlin
       Germany


       This  manpage  describes  the  program implementation of isodebug as shipped by the cdrkit distribution. See http://alioth.debian.org/projects/debburn/ for details. It is a spinoff from the original
       program distributed in the cdrtools package [1]. However, the cdrtools developers are not involved in the development of this spinoff and therefore shall not be  made  responsible  for  any  problem
       caused by it. Do not try to get support for this program by contacting the original author(s).

       If you have support questions, send them to

       debburn-devel@lists.alioth.debian.org

       If you have definitely found a bug, send a mail to this list or to

       submit@bugs.debian.org

       writing at least a short description into the Subject and "Package: cdrkit" into the first line of the mail body.

       [1] Cdrtools 2.01.01a08 from May 2006, http://cdrecord.berlios.de





Joerg Schilling                                                                                    06/02/08                                                                                       ISODEBUG(1)
