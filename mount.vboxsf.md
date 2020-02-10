MOUNT.VBOXSF(8)                                                                      System Administration Utilities                                                                      MOUNT.VBOXSF(8)

NAME
       mount.vboxsf - x86 virtualization solution

SYNOPSIS
       mount.vboxsf [OPTIONS] NAME MOUNTPOINT

DESCRIPTION
       Mount the VirtualBox shared folder NAME from the host system to MOUNTPOINT.

       -w     mount the shared folder writable (the default)

       -r     mount the shared folder read-only

       -n     do not create an mtab entry

       -s     sloppy parsing, ignore unrecognized mount options

       -o OPTION[,OPTION...] use the mount options specified

   Available mount options are:
       rw     mount writable (the default)

       ro     mount read only

       uid=UID
              set the default file owner user id to UID

       gid=GID
              set the default file owner group id to GID

       ttl=TTL
              set the "time to live" to TID for the dentry

       dmode=MODE
              override the mode of all directories to (octal) MODE

       fmode=MODE
              override the mode of all regular files to (octal) MODE

       umask=UMASK
              set the umask to (octal) UMASK

       dmask=UMASK
              set the umask applied to directories only

       fmask=UMASK
              set the umask applied to regular files only

       iocharset CHARSET
              use the character set CHARSET for I/O operations (default set is utf8)

       convertcp CHARSET
              convert the folder name from CHARSET to utf8

   Less common used options:
              noexec,exec,nodev,dev,nosuid,suid

mount.vboxsf                                                                                    June 2016                                                                                 MOUNT.VBOXSF(8)
