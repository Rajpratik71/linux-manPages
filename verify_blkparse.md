VERIFY_BLKPARSE(1)                                                                                                                                                                         VERIFY_BLKPARSE(1)



NAME
       verify_blkparse - verifies an output file produced by blkparse



SYNOPSIS
       verify_blkparse <filename>



DESCRIPTION
       Verifies an output file from blkparse. All it does is check if the events in the file are correctly time ordered. If an entry is found that isn't ordered, it's dumped to stdout.



AUTHORS
       blkparse was written by Jens Axboe, Alan D. Brunelle and Nathan Scott.  This man page was created from the blktrace documentation by Bas Zoetekouw.



REPORTING BUGS
       Report bugs to <linux-btrace@vger.kernel.org>


COPYRIGHT
       Copyright © 2006 Jens Axboe, Alan D. Brunelle and Nathan Scott.
       This  is free software.  You may redistribute copies of it under the terms of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent permitted by
       law.
       This manual page was created for Debian by Bas Zoetekouw.  It was derived from the documentation provided by the authors and it may be used, distributed and modified under the terms of the GNU  Gen‐
       eral Public License, version 2.
       On Debian systems, the text of the GNU General Public License can be found in /usr/share/common-licenses/GPL-2.


SEE ALSO
       btrace (8), blktrace (8), blkparse (1), blkrawverify (1), btt (1)




blktrace git-20070306202522                                                                     March  6, 2007                                                                             VERIFY_BLKPARSE(1)
