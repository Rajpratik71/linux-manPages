SG_SYNC(8)                                                                                        SG3_UTILS                                                                                        SG_SYNC(8)



NAME
       sg_sync - send SCSI SYNCHRONIZE CACHE command

SYNOPSIS
       sg_sync [--16] [--count=COUNT] [--group=GN] [--help] [--immed] [--lba=LBA] [--sync-nv] [--timeout=SECS] [--verbose] [--version] DEVICE

DESCRIPTION
       Send  SYNCHRONIZE  CACHE(10)  or SYNCHRONIZE CACHE(16) command to DEVICE.  These commands are defined for SCSI block devices (see SBC-3). If successful these commands make sure that any blocks whose
       latest versions are held in cache are written to (also termed as "synchronized with") the medium.

       If the LBA and COUNT arguments are both zero (their defaults) then all blocks in the cache are synchronized. If LBA is greater than zero while COUNT is zero then blocks in the cache whose  addresses
       are  from  and including LBA to the highest lba on the device are synchronized. If both LBA and COUNT are non zero then blocks in the cache whose addresses lie in the range LBA to LBA+COUNT-1 inclu‐
       sive are synchronized with the medium.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -S, --16
              performs a SYNCHRONIZE CACHE(16) command. Default is to perform a SYNCHRONIZE CACHE(10) command.

       -c, --count=COUNT
              where COUNT is the number of blocks to synchronize from and including LBA. Default value is 0. When 0 then all blocks in the cache from and including LBA argument to the highest block address
              are synchronized.

       -g, --group=GN
              where  GN is the group number which can be between 0 and 31 inclusive.  The default value is 0 . Group numbers are used to segregate data collected within the device. This is a new feature in
              SBC-2 and can probably be ignored for the time being.

       -h, --help
              output the usage message then exit.

       -i, --immed
              sets the IMMED bit in the SYNCHRONIZE CACHE command. This instructs the device, if the format of the command is acceptable, to return a GOOD status immediately rather than wait for the blocks
              in the cache to be synchronized with (i.e. written to) the medium.

       -l, --lba=LBA
              where LBA is the lowest logical block address in the cache to synchronize to the medium. Default value is 0 .

       -s, --sync-nv
              synchronize  the (volatile) cache with the non-volatile cache. Without this option (or if there is no non-volatile cache in the device) the synchronization is with the medium. The SYNC_NV bit
              was made obsolete in SBC-3 revision 35d.

       -t, --timeout=SECS
              where SECS is the number of seconds the OS allows the SYNCHRONIZE CACHE(16) to complete before it tries to cancel the command. Cancelling commands (typically with the task management function
              "abort  task") is best avoided. Note this option is only active together with the --16 option. The default timeout is 60 seconds for both SYNCHRONIZE CACHE(10) and SYNCHRONIZE CACHE(16). Note
              that timeout issues can be avoided with the --immed option.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       With the SYNCHRONIZE CACHE(16) command LBA can be up to 64 bits in size and COUNT up to 32 bits in size. With the SYNCHRONIZ CACHE(10) command LBA can be up to 32 bits in size and  COUNT  up  to  16
       bits in size.

       Various numeric arguments (e.g. LBA) may include multiplicative suffixes or be given in hexadecimal. See the "NUMERIC ARGUMENTS" section in the sg3_utils(8) man page.

EXIT STATUS
       The exit status of sg_sync is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_start(sg3_utils)



sg3_utils-1.37                                                                                    July 2013                                                                                        SG_SYNC(8)
