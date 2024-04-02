BLKIOMON(8)                                                                                                                                                                                       BLKIOMON(8)



NAME
       blkiomon - monitor block device I/O based o blktrace data



SYNOPSIS
       blkiomon -I interval [ -h file ] [ -b file ] [ -d file ] [ -D file ] [ -Q path_name -q msg_queue_id -m msg_id ] [ -V ]



DESCRIPTION
       blkiomon  is  a block device I/O monitor. It periodically generates per-device request size and request latency statistics from blktrace data. It provides histograms as well as data that can be used
       to calculate min, max, average and variance. For this purpose, it consumes D and C traces read from stdin.  Note, that this doesn't work for logical volumes, as high-level drivers don't see the com-
       pletion of the events (C).

       There are options for binary output and human-readable output to files and stdout. Output to a message queue is supported as well.

       There is no need to use blkparse with blkiomon. blkiomon is capable of consuming binary output written to stdout by blktrace.



OPTIONS
       -I interval
       --interval=interval
              Set sample interval

       -h file
       --human-readable=file
              Human-readable output file. Use '-' for stdout.

       -b file
       --binary=file
              Binary output file. Use '-' for stdout.

       -d file
       --dump-lldd=file
              Output file for data emitted by low level device driver.

       -D file
       --debug=file
              Output file for debugging data. Use '-' for stdout.

       -Q path_name
       --msg-queue=path_name
              Sets path_name as path name for existing message queue to be used for binary output.

       -q msg_queue_id
       --msg-queue-id=msg_queue_id
              Sets msg_queue_id as ID for an existing message queue to be used for binary output.

       -m msg_id
       --msg-id=msg_id
              Sets msg_id as message identifier to be used for binary output messages written to an existing message queue.

       -V
       --version
              Print program version.



EXAMPLES
       To get I/O statistics for /dev/sdw every 10 seconds for a period of one hour, use the following command:

           % blktrace /dev/sdw -a issue -a complete -w 3600 -o - | blkiomon -I 10 -h -



AUTHORS
       blkiomon and this man page were written by Martin Peschke.



REPORTING BUGS
       Report bugs to <linux-btrace@vger.kernel.org>



COPYRIGHT
       Copyright © 2008 IBM Corp.
       This  is free software.  You may redistribute copies of it under the terms of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent permitted by
       law.



SEE ALSO
       btrace (8), blktrace (8), blkparse (1), verify_blkparse (1), blkrawverify (1), btt (1)




                                                                                                July 17, 2008                                                                                     BLKIOMON(8)
