BLKRAWVERIFY(1)                                                                                                                                                                               BLKRAWVERIFY(1)



NAME
       blkrawverify - verifies an output file produced by blkparse



SYNOPSIS
       blkrawverify <dev> [<dev>...]



DESCRIPTION
       The  blkrawverify  utility can be used to verify data retrieved via blktrace. It will check for valid event formats, forward progressing sequence numbers and time stamps, also does reasonable checks
       for other potential issues within individual events.

       Errors found will be tracked in <dev>.verify.out.



AUTHORS
       blkparse was written by Jens Axboe, Alan D. Brunelle and Nathan Scott.  This man page was created from the blktrace documentation by Bas Zoetekouw.



REPORTING BUGS
       Report bugs to <linux-btrace@vger.kernel.org>


COPYRIGHT
       Copyright © 2006 Jens Axboe, Alan D. Brunelle and Nathan Scott.
       This is free software.  You may redistribute copies of it under the terms of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent permitted  by
       law.
       This  manual page was created for Debian by Bas Zoetekouw.  It was derived from the documentation provided by the authors and it may be used, distributed and modified under the terms of the GNU Gen‐
       eral Public License, version 2.
       On Debian systems, the text of the GNU General Public License can be found in /usr/share/common-licenses/GPL-2.


SEE ALSO
       btrace (8), blktrace (8), blkparse (1), verify_blkparse (1), btt (1)




blktrace git-20070306202522                                                                     March  6, 2007                                                                                BLKRAWVERIFY(1)
