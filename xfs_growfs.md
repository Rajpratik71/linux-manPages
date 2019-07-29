
xfs_growfs(8)                                                 System Manager's Manual                                                xfs_growfs(8)

NAME
       xfs_growfs, xfs_info - expand an XFS filesystem

SYNOPSIS
       xfs_growfs [ -dilnrx ] [ -D size ] [ -e rtextsize ] [ -L size ] [ -m maxpct ] [ -t mtab ] [ -R size ] mount-point
       xfs_growfs -V

       xfs_info [ -t mtab ] mount-point
       xfs_info -V

DESCRIPTION
       xfs_growfs expands an existing XFS filesystem (see xfs(5)).  The mount-point argument is the pathname of the directory where the filesystem
       is mounted. The filesystem must be mounted to be grown (see mount(8)).  The existing contents of the filesystem are  undisturbed,  and  the
       added space becomes available for additional file storage.

       xfs_info is equivalent to invoking xfs_growfs with the -n option (see discussion below).

OPTIONS
       -d | -D size
              Specifies that the data section of the filesystem should be grown. If the -D size option is given, the data section is grown to that
              size, otherwise the data section is grown to the largest size possible with the -d option.  The  size  is  expressed  in  filesystem
              blocks.

       -e     Allows the real-time extent size to be specified. In mkfs.xfs(8) this is specified with -r extsize=nnnn.

       -i     The new log is an internal log (inside the data section).  [NOTE: This option is not implemented]

       -l | -L size
              Specifies  that the log section of the filesystem should be grown, shrunk, or moved. If the -L size option is given, the log section
              is changed to be that size, if possible. The size is expressed in filesystem blocks.  The size of an internal log  must  be  smaller
              than the size of an allocation group (this value is printed at mkfs(8) time). If neither -i nor -x is given with -l, the log contin‐
              ues to be internal or external as it was before.  [NOTE: These options are not implemented]

       -m     Specify a new value for the maximum percentage of space in the filesystem that can be allocated as inodes. In  mkfs.xfs(8)  this  is
              specified with -i maxpct=nn.

       -n     Specifies  that  no change to the filesystem is to be made.  The filesystem geometry is printed, and argument checking is performed,
              but no growth occurs.  See output examples below.

       -r | -R size
              Specifies that the real-time section of the filesystem should be grown. If the -R size option is given,  the  real-time  section  is
              grown  to that size, otherwise the real-time section is grown to the largest size possible with the -r option. The size is expressed
              in filesystem blocks.  The filesystem does not need to have contained a real-time section before the xfs_growfs operation.

       -t     Specifies an alternate mount table file (default is /proc/mounts if it exists, else /etc/mtab).  This  is  used  when  working  with
              filesystems mounted without writing to /etc/mtab file - refer to mount(8) for further details.

       -V     Prints the version number and exits. The mount-point argument is not required with -V.

       xfs_growfs is most often used in conjunction with logical volumes (see md(4) and lvm(8) on Linux).  However, it can also be used on a regu‐
       lar disk partition, for example if a partition has been enlarged while retaining the same starting block.

PRACTICAL USE
       Filesystems normally occupy all of the space on the device where they reside. In order to grow a filesystem, it  is  necessary  to  provide
       added  space  for  it  to  occupy.  Therefore there must be at least one spare new disk partition available. Adding the space is often done
       through the use of a logical volume manager.

EXAMPLES
       Understanding xfs_info output.

       Suppose one has the following "xfs_info /dev/sda" output:

         meta-data=/dev/sda      isize=256    agcount=32, agsize=16777184 blks
                  =              sectsz=512   attr=2
         data     =              bsize=4096   blocks=536869888, imaxpct=5
                  =              sunit=32     swidth=128 blks
         naming   =version 2     bsize=4096
         log      =internal      bsize=4096   blocks=32768, version=2
                  =              sectsz=512   sunit=32 blks, lazy-count=1
         realtime =none          extsz=524288 blocks=0, rtextents=0

       Here, the data section of the output indicates "bsize=4096", meaning the data block size for this filesystem is 4096 bytes.   This  section
       also  shows "sunit=32 swidth=128 blks", which means the stripe unit is 32*4096 bytes = 128 kibibytes and the stripe width is 128*4096 bytes
       = 512 kibibytes.  A single stripe of this filesystem therefore consists of four stripe units (128 blocks / 32 blocks per unit).

SEE ALSO
       mkfs.xfs(8), md(4), lvm(8), mount(8).

                                                                                                                                     xfs_growfs(8)
