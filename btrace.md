BTRACE(8)                                                                                                                                                                                           BTRACE(8)



NAME
       btrace - perform live tracing for block devices



SYNOPSIS
       btrace [-s] [-t] [-w N] [-n N] [-b N] [-r <dbg mnt>] [-a <trace>...] <dev>...



DESCRIPTION
       The  btrace  script provides a quick and easy way to do live tracing of block devices.  It calls blktrace on the specified devices and pipes the output through blkparse for formatting.  See blktrace
       (8) for more in-depth information about how blktrace works.


OPTIONS
       -s Displays data sorted by program (see blkparse (1)).


       -t Displays time deltas per IO (see blkparse (1)).


       -w N Sets run time to the number of seconds specified (see blktrace (8)).


       -n N Specifies the number of buffers to use (see blktrace (8)).


       -b N Specifies buffer size for event extraction (scaled by 1024) (see blktrace (8)).


       -r <dbg mnt> Specifies the debugfs mountpoint.


       -a <trace>...  Adds mask to current filter (see blktrace (8)).


       <dev> Specifies the device to trace.



EXAMPLE
       Simply running

           % btrace /dev/sda

       will show a trace of the device /dev/sda.



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
       blktrace (8), blkparse (1), verify_blkparse (1), blkrawverify (1), btt (1)




blktrace git-20070306202522                                                                     March  6, 2007                                                                                      BTRACE(8)
