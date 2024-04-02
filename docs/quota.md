QUOTA(1)                                                                                   General Commands Manual                                                                                   QUOTA(1)



NAME
       quota - display disk usage and limits

SYNOPSIS
       quota [ -F format-name ] [ -guqvswi ] [ -l | [ -QAm ]]
       quota [ -F format-name ] [ -qvswi ] [ -l | [ -QAm ]] -u user...
       quota [ -F format-name ] [ -qvswi ] [ -l | [ -QAm ]] -g group...
       quota [ -F format-name ] [ -qvswugQm ] -f filesystem...

DESCRIPTION
       quota displays users' disk usage and limits.  By default only the user quotas are printed.

       quota reports the quotas of all the filesystems listed in /etc/mtab.  For filesystems that are NFS-mounted a call to the rpc.rquotad on the server machine is performed to get the information.

OPTIONS
       -F, --format=format-name
              Show quota for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota format with 32-bit UIDs
              / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, rpc (quota over NFS), xfs (quota on XFS filesystem)

       -g, --group
              Print group quotas for the group of which the user is a member.  The optional group argument(s) restricts the display to the specified group(s).

       -u, --user
              flag is equivalent to the default.

       -v, --verbose
              will display quotas on filesystems where no storage is allocated.

       -s, --human-readable
              option will make quota(1) try to choose units for showing limits, used space and used inodes.

       --always-resolve
              Always try to translate user / group name to uid / gid even if the name is composed of digits only.

       -p, --raw-grace
              When user is in grace period, report time in seconds since epoch when his grace time runs out (or has run out). Field is '0' when no grace time is in effect.  This is especially  useful  when
              parsing output by a script.

       -i, --no-autofs
              ignore mountpoints mounted by automounter

       -l, --local-only
              report quotas only on local filesystems (ie. ignore NFS mounted filesystems).

       -A, --all-nfs
              report quotas for all NFS filesystems even if they report to be on the same device.

       -f, --filesystem-list
              report quotas only for filesystems specified on command line.

       -m, --no-mixed-pathnames
              Currently, pathnames of NFSv4 mountpoints are sent without leading slash in the path.  rpc.rquotad uses this to recognize NFSv4 mounts and properly prepend pseudoroot of NFS filesystem to the
              path. If you specify this option, quota will always send paths with a leading slash. This can be useful for legacy reasons but be aware that quota over RPC will stop working if you are  using
              new rpc.rquotad.

       -q, --quiet
              Print a more terse message, containing only information on filesystems where usage is over quota.

       -Q, --quiet-refuse
              Do not print error message if connection to rpc.rquotad is refused (usually this happens when rpc.rquotad is not running on the server).

       -w, --no-wrap
              Do not wrap the line if the device name is too long. This can be useful when parsing the output of quota(1) by a script.

       --show-mntpoint
              Show also mount point as a filesystem identification.

       --hide-device
              Do not show device name in a filesystem identification.

       Specifying both -g and -u displays both the user quotas and the group quotas (for the user).

       Only the super-user may use the -u flag and the optional user argument to view the limits of other users.  Non-super-users can use the the -g flag and optional group argument to view only the limits
       of groups of which they are members.

       The -q flag takes precedence over the -v flag.

DIAGNOSTICS
       If quota exits with a non-zero status, one or more filesystems are over quota.

FILES
       aquota.user  or  aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user  or  quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/mtab           default filesystems

SEE ALSO
       quotactl(2), fstab(5), edquota(8), quotacheck(8), quotaon(8), quota_nld(8), repquota(8), warnquota(8), setquota(8)



                                                                                                                                                                                                     QUOTA(1)
