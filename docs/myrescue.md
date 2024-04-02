MYRESCUE(8)                                                        User Commands                                                       MYRESCUE(8)

NAME
       myrescue - Harddisc Rescue

SYNOPSIS
       myrescue  [-b block-size] [-B bitmap-file] [-A] [-S] [-r retry-count] [-f skip-failed] [-s start-block] [-e end-block] [-R] [-G good-range]
       [-F failed-range] [-J jump-after-blocks] input-file output-file

DESCRIPTION
       myrescue is a program to rescue the still-readable data from a damaged harddisk. It is similar in purpose to dd_rescue,  but  it  tries  to
       quickly get out of damaged areas to first handle the not yet damaged part of the disk and return later.

       The  program  tries  to copy the device blockwise to a file and keeps a table ("block bitmap") noting whether a block has been successfully
       copied, not yet handled or has had errors. This block bitmap can be used in successive runs to concentrate on the not yet rescued blocks.

       The program has a special skip mode to handle read errors. Usually harddisk surface defects cover more than just one block  and  continuous
       reading  in  defect  areas  can  damage  the  surface, the heads and (by permanent recalibration) the drive mechanics. If this happens, the
       chances of rescuing the remaining undamaged data drop dramatically. So in skip mode, myrescue tries to get out of damaged areas quickly  by
       exponentially increasing the stepsize. The skipped blocks are marked as unhandled in the block bitmap and can be retried later.

       Finally, the program has an option to multiply try to read a block before considering it damaged.

NOTE
       This  tools is no replacement for a professional data recovery service!  If you do have the latter option, don't even think of using myres‐
       cue, as it may further damage your disk. This tool is provided only for the case that you are absolutely desperate  and  definitely  cannot
       afford  a  professional  data  recovery. Or in case you know what you are doing, e.g. if you know that it is the aging of the magnetisation
       layer that is causing your problem.

       In any case do not expect too much. While complete restores have been witnessed, you should not take them for granted. A better attitude is
       to consider your data lost and be glad for any survivors that turn up.

       The  usual  GPL disclaimer applies. Especially the NON-WARRANTY OF FITNESS FOR A PARTICULAR PURPOSE. Don't blame (or sue) me if it fails to
       recover or further damages your data.

       And a final word you probably don't want to hear in this situation: For the future consider a routinely backup to avoid a "next time".

OPTIONS
       -b block-size
              The size of the blocks (in bytes). Set this to your harddisks error detection/correction unit size. Usually this is 4096, which hap‐
              pens to be the default.

       -B bitmap-file
              The  file  containing  the  status table of all blocks. Nice (or frightening...) to view with hexdump. 01 means OK; 00 means not yet
              done; negative values mean the number of failed read attempts. If not given, defaults to output-file.bitmap

       -A     Abort when encountering errors.

       -S     Activate skip mode: When encountering errors increase the stepsize exponentially until a readable block is found.

       -f skip-failed
              Skip blocks that have already had skip-failed failures. Useful to avoid scratching the same block over and over again.

       -r retry-count
              The number of times to read a block before it is declared bad for this run. (You can still retry it on the next run.) Default: 1

       -s start-block
              The number of the block to start with. Default: 0

       -e end-block
              The number of the block, where reading stops (not included!).  Default: size of input-file divided by block-size.

       -R     Reverse reading direction, i.e. from end-block (excluded) to start-block

       -G good-range
              Only try to read blocks within good-range blocks from an already successfully read block.

       -F failed-range
              Extends -f to also skip any block within failed-range blocks of a block to be skipped as specified by -f.

       -J jump-after-blocks
              Randomly jump across the disc after reading jump-after-blocks blocks. This might be useful to scan discs with scattered defects.  In
              jump mode -S causes myrescue to jump to a new block upon the first failed sector or upon hitting a sector to be skipped as specified
              by -f, -G or -F.

       -h, -? Display usage information.

RECOMMENDED PROCEDURE
       ·      Make sure you have sufficient disk space to copy the whole partition (not just the used amount of data) to plus some space  for  the
              block bitmap (1 byte per block).

       ·      Determine  the hardware block size (CRC/ECC unit) of your harddisk. This may be found out from hdparm, some entries in /proc/ide/hd?
              or on the web. I have not yet checked whether this is possible with an ioctl. If you have, please let me know.

       ·      Start a skip mode run with one retry per block to first copy the undamaged area.

       ·      Start a normal run with one retry per block to copy the remaining skipped blocks. You may try to use -f 1 to skip the damaged blocks
              from the first run.

       ·      Repeat until the number of errors seems to have converged.  Try waiting a couple of hours between the retries.

       ·      Repeat this with higher retry counts and wait for convergence.

       ·      Make a copy of the rescued data and run fsck on it.

       ·      Mount  the  filesystem  (if  copied  to a file: via loopback) and check your data. If directory information has been destroyed, fsck
              moves unidentifiable file fragments to lost+found, so you should also check this location.

       It may help to try reading non-defect areas in between to allow the drive to recalibrate.

       The developers are glad to hear about your experiences. Please post them to the Experiences forum on the Sourceforge  Project  page.  Thank
       you!

KNOWN BUGS
       The  handling of the bitmap-file currently relies on the filesystem semantics, that when lseek(2) ing beyond the end of file and then writ‐
       ing, the space in between is filled with zero-bytes.

       The block bitmap overflows after 128 failed read attempts.

AUTHORS
       Kristof Koehler <kristofk@users.sourceforge.net>, Peter Schlaile <schlaile@users.sourceforge.net>

SEE ALSO
       dd(1), dd_rescue(no manpage?)

       http://www.google.de/search?q=data+recovery

       http://myrescue.sourceforge.net/

myrescue 0.9.4                                                      August 2007                                                        MYRESCUE(8)
