cdda2ogg(1)                                                                                General Commands Manual                                                                                cdda2ogg(1)



NAME
       cdda2ogg — extract audio CD audio tracks and encode them

SYNOPSIS
       cdda2ogg

DESCRIPTION
       cdda2ogg  is  a simple script that uses the icedax <fileprefix> command to extract all audio tracks with the icedax <fileprefix> command and encode them using the ogg123 encoder. The scripts are not
       intended to be full-featured music archiving programs, but only for quick storing of few audio data.  It does not use databases like CDDB or have any extra features. You may look at  icedax  if  you
       need them.

       ogg123 is provided by the vorbis-tools which needs to be installed separately.  See www.ogg.org for more information.


CONFIGURATION
       cdda2ogg have predefined values for reading and labeling of the target files.  You can overwrite them with following environment variables:


       CDDA_DEVICE
                 Source device specification to get the data from.


       LIST      List of track numbers to be read, separated by spaces.


       CDDA2WAV  Defines the command to run the cdda2wav program


       CDDA2WAV_OPTS
                 Miscellaneous options passed to $CDDA2WAV.


       MP_CODER  The encoder program.


       MP_OPTIONS
                 Additional options passed to $MP_CODER.


       FILEPREFIX
                 The base part of the filename of resulting audio files. This can also be specified as the first argument to the script.


       See cdda2ogg script file to get the default values

       System administrator can also set default values by creating of a shell include file, defining the variables for the POSIX shell, and storing them as /etc/default/cdda2ogg.

EXAMPLES
       CDDA_DEVICE=/dev/cdrom1 cdda2ogg
       just stores every track in this device in audiotrackNUMBER.ogg

       LIST="1 5 7" cdda2ogg PartsOfBestOfFoo
       stores the selected tracks from the default cdrom device as 01-PartsOfBestOfFoo.ogg, 05-PartsOfBestOfFoo.ogg, 07-PartsOfBestOfFoo.ogg.


SEE ALSO
       icedax(1)

AUTHOR
       This  manpage  describes  the  program implementation of cdda2ogg as shipped by the cdrkit distribution. See http://alioth.debian.org/projects/debburn/ for details. It is a spinoff from the original
       program distributed by the cdrtools project. However, the cdrtools developers are not involved in the development of this spinoff and therefore shall not be made responsible for any  problem  caused
       by it. Do not try to get support for this program by contacting the original authors.

       If you have support questions, send them to

       debburn-devel@lists.alioth.debian.org

       If you have definitely found a bug, send a mail to this list or to

       submit@bugs.debian.org

       writing at least a short description into the Subject and "Package: cdrkit" into the first line of the mail body.

       This  manual  page  was  written by Eduard Bloch (blade@debian.org) for the Debian GNU/Linux system (but may be used by others). Permission is granted to copy, distribute and/or modify this document
       under the terms of the GNU General Public License, Version 2 as published by the Free Software Foundation.



                                                                                                                                                                                                  cdda2ogg(1)
