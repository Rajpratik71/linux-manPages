NEWFS_HFS(8)                                                BSD System Manager's Manual                                               NEWFS_HFS(8)

NAME
     mkfs.hfs — construct a new HFS Plus file system

SYNOPSIS
     mkfs.hfs [-N [partition-size]] [-U uid] [-G gid] [-M mask] [-h | -w] [-s] [-b block-size] [-c clump-size-list] [-i first-cnid]
              [-J [journal-size]] [-n node-size-list] [-v volume-name] special

DESCRIPTION
     mkfs.hfs builds an HFS Plus file system on the specified special device.

     The file system default parameters are calculated based on the size of the disk partition. Typically the defaults are reasonable, however
     mkfs.hfs has several options to allow the defaults to be selectively overridden.  The options are as follows:

     -N [partition-size]
                 Causes the file system parameters to be printed out without really creating the file system.

     -U uid      Set the owner of the file system's root directory to uid.

     -G gid      Set the group of the file system's root directory to gid.

     -M mask     Specify the access permissions mask for the file system's root directory.

     -h          Creates a legacy HFS format filesystem. This option is not recommended for file systems that will be primarily used with Mac OS X
                 or Darwin.

     -s          Creates a case-sensitive HFS Plus filesystem. By default a case-insensitive filesystem is created.  Case-sensitive HFS Plus file
                 systems require a Mac OS X version of 10.3 (Darwin 7.0) or later.

     -w          Adds an HFS wrapper around the HFS Plus file system.  This wrapper is required if the file system will be used to boot natively
                 into Mac OS 9.

     -b block-size
                 The allocation block size of the file system.  The default value is 4096.

     -c clump-size-list
                 This specifies the clump and/or initial sizes, in allocation blocks, for the various metadata files.  Clump sizes are specified
                 with the -c option followed by a comma separated list of the form arg=blocks.

                 Example:  -c c=5000,e=500

                 a=blocks    Set the attribute file clump size.

                 b=blocks    Set the allocation bitmap file clump size.

                 c=blocks    Set the catalog file clump size.

                 e=blocks    Set the extent overflow file clump size.

     -i first-cnid
                 This specifies the initial catalog node ID for user files and directories. The default value is 16.

     -J [journal-size]
                 Creates a journaled HFS+ volume.  The default journal size is 8MB.  Appending an 'M' to the journal size implies megabytes (i.e.
                 64M is 64 megabytes).  The maximum journal size is 512 megabytes.

     -n node-size-list
                 This specifies the b-tree node sizes, in bytes, for the various b-tree files.  Node sizes are specified with the -n option fol‐
                 lowed by a comma separated list of the form arg=bytes. The node size must be a power of two and no larger than 32768 bytes.

                 Example:  -n c=8192,e=4096

                 a=bytes     Set the attribute b-tree node size.

                 c=bytes     Set the catalog b-tree node size.

                 e=bytes     Set the extent overflow b-tree node size.

     -v volume-name
                 Volume name (file system name) in ascii or UTF-8 format.

SEE ALSO
     mount(8)

HISTORY
     The mkfs.hfs command appeared in Mac OS X Server 1.0 .

Mac OS X                                                           April 1, 2003                                                          Mac OS X
