fstab-decode(8)                                               System Manager's Manual                                              fstab-decode(8)

NAME
       fstab-decode - run a command with fstab-encoded arguments

SYNOPSIS
        fstab-decode COMMAND [ARGUMENT]...

DESCRIPTION
       fstab-decode  decodes  escapes  in the specified ARGUMENTs and uses them to run COMMAND.  The argument escaping uses the same rules as path
       escaping in /etc/fstab, /etc/mtab and /proc/mtab.

EXIT STATUS
       fstab-decode exits with status 127 if COMMAND can't be run.  Otherwise it exits with the status returned by COMMAND.

EXAMPLES
       fstab-decode umount $(awk '$3 == vfat { print $2 }' /etc/fstab)

                                                                     May 2006                                                      fstab-decode(8)
