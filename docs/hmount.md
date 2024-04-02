HMOUNT(1)                                                     General Commands Manual                                                    HMOUNT(1)

NAME
       hmount - introduce a new HFS volume and make it current

SYNOPSIS
       hmount source-path [partition-no]

DESCRIPTION
       hmount is used to introduce a new HFS volume. A UNIX pathname to the volume's source must be specified. The source may be a block device or
       a regular file containing an HFS volume image.

       If the source medium is partitioned, one partition must be selected to be mounted. If there is only one HFS partition  on  the  medium,  it
       will  be  selected by default. Otherwise, the desired partition number must be specified (as the ordinal nth HFS partition) on the command-
       line. Partition number 0 can be specified to refer to the entire medium, ignoring what might otherwise be perceived  as  a  partition  map,
       although in practice this is probably only useful if you want this command to fail when the medium is partitioned.

       The  mounted  volume becomes "current" so subsequent commands will refer to it.  The current working directory for the volume is set to the
       root of the volume.  This information is kept in a file named .hcwd in the user's home directory.

       If the source medium is changed (e.g. floppy or CD-ROM disc exchanged) after hmount has been called,  subsequent  HFS  commands  will  fail
       until the original medium is replaced or a different volume is made current. To use the same source path with the different medium, reissue
       the hmount command.

EXAMPLES
       % hmount /dev/fd0
              If a Macintosh floppy disk is available as /dev/fd0, this command makes the floppy current for other HFS commands  such  as  hls(1),
              hcd(1), hcopy(1), etc.

       % hmount /dev/sd2 1
              If  a  SCSI disk is available as /dev/sd2, this command finds the first HFS partition on the medium and makes it available for other
              HFS operations.

NOTES
       hmount does not actually mount an HFS partition over a UNIX directory in the traditional mount(8) sense. It is merely a "virtual" mount, as
       a point of convenience for future HFS operations. Each HFS command independently opens, operates on, and closes the named source path given
       to hmount.

SEE ALSO
       hfsutils(1), hformat(1), humount(1), hvol(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            08-Nov-1997                                                          HMOUNT(1)
