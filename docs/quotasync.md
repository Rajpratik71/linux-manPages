QUOTASYNC(1)                                                                               General Commands Manual                                                                               QUOTASYNC(1)



NAME
       quotasync - synchronize in-kernel file system usage and limits to disk format

SYNOPSIS
       quotasync [ -ug ] mount-point...
       quotasync [ -ug ] -a
       quotasync -h | -V

DESCRIPTION
       quotasync flushes file system usage and limits from kernel memory to quota files stored in the file system. By default only the user quotas are synchronized.

       This tool can be useful if you want to display accurate quotas by tools that parse quota files, like repquota(8).

OPTIONS
       -u, --user
              Synchronize user usage and limits.

       -g, --group
              Synchronize group usage and limits.

       -a, --all
              Synchronize usage and limits on all file systems. You have to specify this option or to specify desired file systems.

       -V, --version
              Show program version information and exit.

       -h, --help
              Show program usage and exit.

DIAGNOSTICS
       If requested synchronization fails, or invalid option is given, quotasync will terminate with non-zero exit code. Otherwise it will return zero.

FILES
       aquota.user  or  aquota.group
                       Quota file at the file system root (version 2 quota, non-XFS/GFS2 file systems).
       quota.user  or  quota.group
                       Quota file at the file system root (version 1 quota, non-XFS/GFS2 file systems).
       /etc/mtab       List of mounted file systems maintained by user space.
       /proc/mounts    List of mounted file systems maintained by kernel.

SEE ALSO
       quota(1), quotactl(2), mount(8), quotacheck(8), quotaon(8), repquota(8), warnquota(8).



                                                                                                                                                                                                 QUOTASYNC(1)
