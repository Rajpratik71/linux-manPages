FILEFRAG(8)                                                   System Manager's Manual                                                  FILEFRAG(8)

NAME
       filefrag - report on file fragmentation

SYNOPSIS
       filefrag [ -bblocksize ] [ -BeksvxX ] [ files...  ]

DESCRIPTION
       filefrag  reports  on  how badly fragmented a particular file might be.  It makes allowances for indirect blocks for ext2 and ext3 filesys‐
       tems, but can be used on files for any filesystem.

       The filefrag program initially attempts to get the extent information using FIEMAP ioctl which is more efficient and faster.  If FIEMAP  is
       not supported then filefrag will fall back to using FIBMAP.

OPTIONS
       -B     Force the use of the older FIBMAP ioctl instead of the FIEMAP ioctl for testing purposes.

       -bblocksize
              Use  blocksize  in  bytes  for  output instead of the filesystem blocksize.  For compatibility with earlier versions of filefrag, if
              blocksize is unspecified it defaults to 1024 bytes.

       -e     Print output in extent format, even for block-mapped files.

       -k     Use 1024-byte blocksize for output (identical to '-b 1024').

       -s     Sync the file before requesting the mapping.

       -v     Be verbose when checking for file fragmentation.

       -x     Display mapping of extended attributes.

       -X     Display extent block numbers in hexadecimal format.

AUTHOR
       filefrag was written by Theodore Ts'o <tytso@mit.edu>.

E2fsprogs version 1.44.1                                            March 2018                                                         FILEFRAG(8)
