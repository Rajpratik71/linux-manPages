MKDISKIMAGE(1)                             Syslinux Project                             MKDISKIMAGE(1)

NAME
       mkdiskimage - Create a blank MS-DOS formatted hard disk image

SYNOPSIS
       mkdiskimage [-doFMz4] [-i id] file cyl head sect

DESCRIPTION
       This  is a convenient tool to generate a hard disk image, pre-formatted according to the MS-DOS
       specification, and having stated properties.

       A disk image named file will be created, large enough to have cyl cylinders,  head  heads,  and
       sect sectors. Using -M, the value of cyl will instead be interpreted as size in MBytes.

       Additional settings include ZIP type disks, FAT32 formatting, and the inclusion of an emulation
       header.

OPTIONS
       -4  Use the fourth partition table entry. This is the standard for ZIP-disks.

       -F  Format the partition using a FAT32 file system.

       -M  The argument cyl is given in Megabytes. Recalculate this to get the count in cylinders.

       -d  Add a DOSEMU header.

       -i id
           Specify the MBR identity field as id.

       -o  Print to stdout the file system offset.

       -z  Use a ZIP-disk geometry. This needs heads=64 and sect=32.

SEE ALSO
       syslinux(1)

HOMEPAGE
       More information about the Syslinux project can be found on the  homepage  at  <http://www.sys‐
       linux.org/>.

AUTHOR
       mkdiskimage was written by H. Peter Anvin <hpa@zytor.com>.

       This manual page was written by Mats Erik Andersson <debian@gisladisker.se>.

5.00                                          2014-06-14                                MKDISKIMAGE(1)
