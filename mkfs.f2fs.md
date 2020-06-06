MKFS.F2FS(8)                           System Manager's Manual                           MKFS.F2FS(8)

NAME
       mkfs.f2fs - create an F2FS file system

SYNOPSIS
       mkfs.f2fs  [  -a  heap-based-allocation ] [ -c device ] [ -d debugging-level ] [ -e extension-
       list ] [ -f ] [ -l volume-label ] [ -m ] [ -o overprovision-ratio-percentage ] [  -O  feature-
       list  ]  [  -q  ] [ -s #-of-segments-per-section ] [ -t nodiscard/discard ] [ -w specific sec‐
       tor_size for target sectors ] [ -z #-of-sections-per-zone ] device [sectors]

DESCRIPTION
       mkfs.f2fs is used to create a f2fs file system (usually in a disk partition).  device  is  the
       special  file  corresponding to the device (e.g.  /dev/sdXX).  sectors is optionally given for
       specifing the filesystem size.

       The exit code returned by mkfs.f2fs is 0 on success and 1 on failure.

OPTIONS
       -a heap-based-allocation
              Specify 1 or 0 to enable/disable heap based block allocation policy.  If the  value  is
              equal to 1, each of active log areas are initially assigned separately according to the
              whole volume size.  The default value is 1.

       -c device
              Build f2fs with this device additionally, so that user can see all the devices  as  one
              big volume.

       -d debug-level
              Specify  the  level  of  debugging options.  The default number is 0, which shows basic
              debugging messages.

       -e extension-list
              Specify a file extension list in order f2fs to treat them as cold files.  The  data  of
              files  having  those  extensions  will  be  stored  to  the cold log.  The default list
              includes most of multimedia file extensions such as jpg, gif, mpeg, mkv, and so on.

       -f     Force overwrite when an existing filesystem is detected on  the  device.   By  default,
              mkfs.f2fs  will  not  write  to the device if it suspects that there is a filesystem or
              partition table on the device already.

       -l volume-label
              Specify the volume label to the partition mounted as F2FS.

       -m     Specify f2fs filesystem to supports the block zoned feature.  Without it, the  filesys‐
              tem isn't supports the feature.

       -o overprovision-ratio-percentage
              Specify the percentage over the volume size for overprovision area. This area is hidden
              to users, and utilized by F2FS cleaner. If not  specified,  the  best  number  will  be
              assigned automatically accoring to the partition size.

       -O feature-list
              Specify  a  feature  list in order f2fs filesystem will supports.  e.g "encrypt" and so
              on.

       -q     Quiet mode.  With it, mkfs.f2fs does not show any messages include the basic messages.

       -s #-of-segments-per-section
              Specify the number of segments per section. A section consists of multiple  consecutive
              segments,  and is the unit of garbage collection.  The default number is 1, which means
              one segment is assigned to a section.

       -t nodiscard/discard
              Specify 1 or 0 to enable/disable discard policy.  If the value is equal to  1,  discard
              policy is enabled, otherwise is disable.  The default value is 1.

       -wsector-size
              Specify the sector size in bytes along with given target sectors.  Without it, the sec‐
              tors will be calculated by device sector size.

       -z #-of-sections-per-zone
              Specify the number of sections per zone. A zone consists of  multiple  sections.   F2FS
              allocates  segments  for  active  logs  with  separated zones as much as possible.  The
              default number is 1, which means a zone consists of one section.

       AUTHOR
              This version of mkfs.f2fs has been written by Jaegeuk Kim <jaegeuk.kim@samsung.com>.

AVAILABILITY
       mkfs.f2fs  is   available   from   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs(8), fsck.f2fs(8), dump.f2fs(8), defrag.f2fs(8), resize.f2fs(8), sload.f2fs(8).

                                                                                         MKFS.F2FS(8)
