DEBUGREISERFS(8)                                                                         System Manager's Manual                                                                         DEBUGREISERFS(8)

NAME
       debugreiserfs - The debugging tool for the ReiserFS filesystem.

SYNOPSIS
       debugreiserfs [ -dDJmoqpuSV ] [ -j device ] [ -B file ] [ -1 N ]

       device

DESCRIPTION
       debugreiserfs sometimes helps to solve problems with reiserfs filesystems.  When run without options it prints the super block of the ReiserFS filesystem found on the device.

       device is the special file corresponding to the device (e.g /dev/hdXX for an IDE disk partition or /dev/sdXX for a SCSI disk partition).

OPTIONS
       -j device
              prints the contents of the journal. The option -p allows it to pack the journal with other metadata into the archive.

       -J     prints the journal header.

       -d     prints the formatted nodes of the internal tree of the filesystem.

       -D     prints the formatted nodes of all used blocks of the filesystem.

       -m     prints the contents of the bitmap (slightly useful).

       -o     prints the objectid map (slightly useful).

       -B file
              takes the list of bad blocks stored in the internal ReiserFS tree and translates it into an ascii list written to the specified file.

       -1 blocknumber
              prints the specified block of the filesystem.

       -p     extracts the filesystem's metadata with debugreiserfs -p /dev/xxx | gzip -c > xxx.gz. None of your data are packed unless a filesystem corruption presents when the whole block having this
              corruption is packed. You send us the output, and we use it to create a filesystem with the same strucure as yours using debugreiserfs -u.  When the data file is not too large, this  usu‐
              ally allows us to quickly reproduce and debug the problem.

       -u     builds  the  ReiserFS filesystem image with gunzip -c xxx.gz | debugreiserfs -u /dev/image of the previously packed metadata with debugreiserfs -p. The result image is not the same as the
              original filesystem, because mostly only metadata were packed with debugreiserfs -p, but the filesystem structure is completely recreated.

       -S     When -S is not specified -p deals with blocks marked used in the filesystem bitmap only. With this option set debugreiserfs will work with the entire device.

       -q     When -p is in use, suppress showing the speed of progress.

AUTHOR
       This version of debugreiserfs has been written by Vitaly Fertman <vitaly@namesys.com>.

BUGS
       Please report bugs to the ReiserFS developers <reiserfs-devel@vger.kernel.org>, providing as much information as possible--your hardware, kernel, patches, settings, all printed  messages;  check
       the syslog file for any related information.

SEE ALSO
       reiserfsck(8), mkreiserfs(8)

Reiserfsprogs 3.6.24                                                                           January 2009                                                                              DEBUGREISERFS(8)
