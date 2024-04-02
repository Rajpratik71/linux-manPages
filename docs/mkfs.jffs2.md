MKFS.JFFS2(1)                                                 General Commands Manual                                                MKFS.JFFS2(1)

NAME
       mkfs.jffs2 - Create a JFFS2 file system image from directory

SYNOPSIS
       mkfs.jffs2  [  -p,--pad[=SIZE]  ]  [  -r,-d,--root  directory ] [ -s,--pagesize=SIZE ] [ -e,--eraseblock=SIZE ] [ -c,--cleanmarker=SIZE ] [
       -n,--no-cleanmarkers ] [ -o,--output image.jffs2 ] [ -l,--little-endian ] [ -b,--big-endian ] [ -D,--devtable=FILE ] [  -f,--faketime  ]  [
       -q,--squash  ]  [  -U,--squash-uids  ]  [  -P,--squash-perms ] [ --with-xattr ] [ --with-selinux ] [ --with-posix-acl ] [ -m,--compression-
       mode=MODE ] [ -x,--disable-compressor=NAME ] [ -X,--enable-compressor=NAME ] [ -y,--compressor-priority=PRIORITY:NAME  ]  [  -L,--list-com‐
       pressors ] [ -t,--test-compression ] [ -h,--help ] [ -v,--verbose ] [ -V,--version ] [ -i,--incremental image.jffs2 ]

DESCRIPTION
       The  program mkfs.jffs2 creates a JFFS2 (Second Journalling Flash File System) file system image and writes the resulting image to the file
       specified by the -o option or by default to the standard output, unless the standard output is a terminal device in which  case  mkfs.jffs2
       will abort.

       The  file  system  image  is  created  using the files and directories contained in the directory specified by the option -r or the present
       directory, if the -r option is not specified.

       Each block of the files to be placed into the file system image are compressed using one of the  available  compressors  depending  on  the
       selected compression mode.

       File  systems  are  created with the same endianness as the host, unless the -b or -l options are specified.  JFFS2 driver in the 2.4 Linux
       kernel only supported images having the same endianness as the CPU. As of 2.5.48, the kernel can be changed with a #define to accept images
       of the non-native endianness. Full bi-endian support in the kernel is not planned.

       It is unlikely that JFFS2 images are useful except in conjuction with the MTD (Memory Technology Device) drivers in the Linux kernel, since
       the JFFS2 file system driver in the kernel requires MTD devices.

OPTIONS
       Options that take SIZE arguments can be specified as either decimal (e.g., 65536), octal (0200000), or hexidecimal (0x1000).

       -p, --pad[=SIZE]
              Pad output to SIZE bytes with 0xFF.  If SIZE is not specified, the output is padded to the end of the final erase block.

       -r, -d, --root=DIR
              Build file system from directory DIR.  The default is the current directory.

       -s, --pagesize=SIZE
              Use page size SIZE.  The default is 4 KiB.  This size is the maximum size of a data node.  Set according to target  system's  memory
              management page size (NOTE: this is NOT related to NAND page size).

       -e, --eraseblock=SIZE
              Use  erase block size SIZE.  The default is 64 KiB.  If you use a erase block size different than the erase block size of the target
              MTD device, JFFS2 may not perform optimally. If the SIZE specified is below 4096, the units are assumed to be KiB.

       -c, --cleanmarker=SIZE
              Write ´CLEANMARKER´ nodes with the size specified. It is not normally appropriate to specify a size other than the default 12 bytes.

       -n, --no-cleanmarkers
              Do not write ´CLEANMARKER´ nodes to the beginning of each erase block. This option can be useful for creating JFFS2 images  for  use
              on NAND flash, and for creating images which are to be used on a variety of hardware with differing eraseblock sizes.

       -o, --output=FILE
              Write JFFS2 image to file FILE.  Default is the standard output.

       -l, --little-endian
              Create a little-endian JFFS2 image.  Default is to make an image with the same endianness as the host.

       -b, --big-endian
              Create a big-endian JFFS2 image.  Default is to make an image with the same endianness as the host.

       -D, --devtable=FILE
              Use  the  named  FILE as a device table file, for including devices and changing permissions in the created image when the user does
              not have appropriate permissions to create them on the file system used as source.

       -f, --faketime
              Change all file timestamps to ´0´ for regression testing.

       -q, --squash
              Squash permissions and owners, making all files be owned by root and removing write permission for ´group´ and ´other´.

       -U, --squash-uids
              Squash owners making all files be owned by root.

       -P, --squash-perms
              Squash permissions, removing write permission for ´group´ and ´other´.

       --with-xattr
              Enables xattr, stuff all xattr entries into jffs2 image file.

       --with-selinux
              Enables xattr, stuff only SELinux Labels into jffs2 image file.

       --with-posix-acl
              Enable xattr, stuff only POSIX ACL entries into jffs2 image file.

       -m, --compression-mode=MODE
              Set the default compression mode. The default mode is priority which tries the compressors in a predefinied order  and  chooses  the
              first successful one. The alternatives are: none (mkfs will not compress) and size (mkfs will try all compressor and chooses the one
              which have the smallest result).

       -x, --disable-compressor=NAME
              Disable a compressor. Use -L to see the list of the available compressors and their default states.

       -X, --enable-compressor=NAME
              Enable a compressor. Use -L to see the list of the available compressors and their default states.

       -y, --compressor-priority=PRIORITY:NAME
              Set the priority of a compressor. Use -L to see the list of the available compressors and their default  priority.   Priorities  are
              used by priority compression mode.

       -L, --list-compressors
              Show the list of the available compressors and their states.

       -t, --test-compression
              Call decompress after every compress - and compare the result with the original data -, and some other check.

       -h, --help
              Display help text.

       -v, --verbose
              Verbose operation.

       -V, --version
              Display version information.

       -i, --incremental=FILE
              Generate  an appendage image for FILE. If FILE is written to flash and flash is appended with the output, then it seems as if it was
              one thing.

LIMITATIONS
       The format and grammar of the device table file does not allow it to create symbolic links when the symbolic links are not already  present
       in the root working directory.

       However, symbolic links may be specified in the device table file using the l type for the purposes of setting their permissions and owner‐
       ship.

BUGS
       JFFS2 limits device major and minor numbers to 8 bits each.  Some consider this a bug.

       mkfs.jffs2 does not properly handle hard links in the input directory structure.  Currently, hard linked files will be expanded to multiple
       identical files in the output image.

AUTHORS
       David Woodhouse
       Manual page written by David Schleef <ds@schleef.org>

SEE ALSO
       mkfs(8), mkfs.jffs(1), fakeroot(1)

                                                                                                                                     MKFS.JFFS2(1)
