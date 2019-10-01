CIFSDD(8)                                                                                System Administration tools                                                                                CIFSDD(8)



NAME
       cifsdd - convert and copy a file over SMB

SYNOPSIS
       cifsdd [OPERAND]...

       cifsdd OPTION

DESCRIPTION
       This tool is part of the samba(7) suite.

       Copy a file, converting and formatting according to the operands.

       bs=BYTES
           read and write up to BYTES bytes at a time (default: 4096)

       ibs=BYTES
           read up to BYTES bytes at a time (default: 4096)

       obs=BYTES
           write BYTES bytes at a time (default: 4096)

       if=FILE
           read from FILE instead of stdin

       of=FILE
           write to FILE instead of stdout

       count=N
           copy only N input blocks

       seek=N
           skip N obs-sized blocks at start of output

       skip=N
           skip N ibs-sized blocks at start of input

       direct
           use direct I/O for data

       sync
           use synchronous writes

       oplock
           take oplocks on the input and output files

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The cifsdd manpage was written by Andreas Schneider.



Samba 4.9.1                                                                                       08/09/2019                                                                                        CIFSDD(8)
