FINDFS(8)                   System Administration                   FINDFS(8)

NAME
       findfs - find a filesystem by label or UUID

SYNOPSIS
       findfs NAME=value

DESCRIPTION
       findfs  will  search  the  block  devices  in the system looking for a
       filesystem or partition with specified tag.  The  currently  supported
       tags are:

       LABEL=<label>
              Specifies filesystem label.

       UUID=<uuid>
              Specifies filesystem UUID.

       PARTUUID=<uuid>
              Specifies  partition  UUID.  This  partition identifier is sup‐
              ported for example for GUID  Partition  Table  (GPT)  partition
              tables.

       PARTLABEL=<label>
              Specifies partition label (name). The partition labels are sup‐
              ported for example for GUID Partition Table (GPT) or MAC parti‐
              tion tables.

       If  the  filesystem  or  partition  is  found, the device name will be
       printed on stdout.

       The complete overview about filesystems and partitions you can get for
       example by

              lsblk --fs

              partx --show <disk>

              blkid

EXIT STATUS
              0      success
              1      label or uuid cannot be found
              2      usage error, wrong number of arguments or unknown option

AUTHOR
       findfs was originally written by Theodore Ts'o ⟨tytso@mit.edu⟩ and re-
       written for the util-linux package by Karel Zak ⟨kzak@redhat.com⟩.

ENVIRONMENT
       LIBBLKID_DEBUG=all
              enables libblkid debug output.

SEE ALSO
       blkid(8), lsblk(8), partx(8)

AVAILABILITY
       The findfs command is part of the util-linux package and is  available
       from   Linux  Kernel  Archive  ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                        March 2014                        FINDFS(8)
