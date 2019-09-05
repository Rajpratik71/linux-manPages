PITCHPLAY(1)                                                                                      pitchplay                                                                                      PITCHPLAY(1)



NAME
       pitchplay - wrapper script to play audio tracks with cdda2wav with different pitches through a soundcard (cdda2wav must have soundcard support enabled).

SYNOPSIS
       pitchplay <track a> <pitch a> <track b> <pitch b>...

DESCRIPTION
       pitchplay allows playback of audio tracks with cdda2wav with pitches specified in percentage with 100% being the original pitch, 50% being one octave lower, 200% one octave higher.

EXAMPLES
       pitchplay 1 90  3 140  5 50
       will play track 1 with a pitch of 90%, track 3 with a pitch of 140%, and track 5 with a pitch of 50%.

SEE ALSO
       cdda2wav(1)

AUTHOR
       cdda2was was written by Joerg Schilling <js@cs.tu-berlin.de> and others.

       This  manpage  describes  the program implementation of pitchplay as shipped by the cdrkit distribution. See http://alioth.debian.org/projects/debburn/ for details. It is a spinoff from the original
       program distributed by the cdrtools project. However, the cdrtools developers are not involved in the development of this spinoff and therefore shall not be made responsible for any  problem  caused
       by it. Do not try to get support for this program by contacting the original authors.

       If you have support questions, send them to

       debburn-devel@lists.alioth.debian.org

       If you have definitely found a bug, send a mail to this list or to

       submit@bugs.debian.org

       writing at least a short description into the Subject and "Package: cdrkit" into the first line of the mail body.

       This  manual  page  was  written by Oleksandr Moskalenko <malex@tagancha.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes or
       omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).



                                                                                         Tue Feb 15 12:53:23 MST 2005                                                                            PITCHPLAY(1)
