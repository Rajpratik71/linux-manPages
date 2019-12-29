fstab-decode(8)                         System Manager's Manual                        fstab-decode(8)

NAME
       fstab-decode - run a command with fstab-encoded arguments

SYNOPSIS
       fstab-decode COMMAND [ARGUMENT]...

DESCRIPTION
       fstab-decode decodes escapes (such as newline characters and other whitespace) in the specified
       ARGUMENTs and uses them to run COMMAND.  The argument escaping uses the same rules as path  es‐
       caping in /etc/fstab, /etc/mtab and /proc/mtab.

       In essence fstab-decode can be used anytime we want to pass multiple parameters to a command as
       a list of command line argments. It turns output like this:

       /root
       /mnt/remote-disk
       /home

       Into one long list of parameters, "/root /mnt/remote-disk /home". This
       can be useful when trying to work with multiple filesystems at once. For
       instance, we can use it to unmount multiple NFS shares. This program also
       removes whitespace and other characters which might cause programs such
       as mount or umount to fail.

EXIT STATUS
       fstab-decode exits with status 127 if COMMAND can't be run.  Otherwise it exits with the status
       returned by COMMAND.

EXAMPLES
       The following example reads fstab, finds all instances of VFAT filesystems and
       prints their mount points (argument 2 in the fstab file). fstab-decode then runs
       the specified program, umount, and passes it the list of VFAT mountpoints.
       This unmounts all VFAT partitions.

       fstab-decode umount $(awk '$3 == "vfat" { print $2 }' /etc/fstab)

SEE ALSO
       fstab(5)

                                               May 2006                                fstab-decode(8)
