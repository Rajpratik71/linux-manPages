HFORMAT(1)                                                    General Commands Manual                                                   HFORMAT(1)

NAME
       hformat - create a new HFS filesystem and make it current

SYNOPSIS
       hformat [-f] [-l label] destination-path [partition-no]

DESCRIPTION
       hformat  is  used to write a new HFS filesystem to a volume. A UNIX pathname to the volume's destination must be specified. The destination
       may be either a block device or a regular file, but it must already exist and be writable.

       An optional label can be specified to name the volume. The name must be between 1-27 characters and cannot contain a colon (:). By default,
       the volume will be named Untitled.

       If  the  destination medium is partitioned, one partition must be selected to receive the filesystem. If there is only one HFS partition on
       the medium, it will be selected by default. Otherwise, the desired partition number must be specified (as the ordinal nth HFS partition) on
       the command-line. The size of the partition determines the size of the resulting volume.

       Partition number 0 can be specified to format the entire medium as a single filesystem without a partition map, erasing any existing parti‐
       tion information. Since this will destroy all the partitions, the -f option must be specified to force this operation if  the  medium  cur‐
       rently contains a partition map.

       If  the medium is not partitioned (or if partition 0 is specified), the size or capacity of the medium determines the size of the resulting
       volume.

       The new volume will be empty and will become "current" so subsequent commands will refer to it. The current working directory for the  vol‐
       ume is set to the root of the volume.

EXAMPLES
       % hformat /dev/fd0
              If  a  floppy  disk  is available as /dev/fd0, this formats the disk as an HFS volume named Untitled.  (N.B. The floppy must already
              have received a low-level format by other means.)

       % dd if=/dev/zero of=disk.hfs bs=1k count=800
       % hformat -l "Test Disk" disk.hfs
              This sequence creates an 800K HFS volume image in the file disk.hfs in the current directory, and names it Test Disk.

       % hformat -l "Loma Prieta" /dev/sd2 1
              If a SCSI disk is available as /dev/sd2, this initializes the first HFS partition on the disk (which must already exist) with a  new
              filesystem, naming the resulting volume Loma Prieta.

       % hformat -f /dev/sd2 0
              This  causes the medium accessible as /dev/sd2 to be reformatted as a single HFS volume, ignoring and erasing any existing partition
              information on the medium. The -f option must be specified if the medium is currently partitioned; otherwise the command will fail.

NOTES
       This command does not create or alter partition maps, although it can erase them (as described above). Any partition  number  specified  on
       the command line must already exist.

       The smallest volume size which can be formatted with hformat is 800K.

SEE ALSO
       hfsutils(1), hmount(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            08-Nov-1997                                                         HFORMAT(1)
