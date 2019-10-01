REPQUOTA(8)                                                                                System Manager's Manual                                                                                REPQUOTA(8)



NAME
       repquota - summarize quotas for a filesystem

SYNOPSIS
       /usr/sbin/repquota [ -vspiug ] [ -c | -C ] [ -t | -n ] [ -F format-name ] filesystem...

       /usr/sbin/repquota [ -avtpsiug ] [ -c | -C ] [ -t | -n ] [ -F format-name ]

DESCRIPTION
       repquota  prints a summary of the disc usage and quotas for the specified file systems.  For each user the current number of files and amount of space (in kilobytes) is printed, along with any quota
       limits set with edquota(8) or setquota(8).  In the second column repquota prints two characters marking which limits are exceeded. If user is over his space softlimit or reaches his space  hardlimit
       in case softlimit is unset, the first character is '+'. Otherwise the character printed is '-'. The second character denotes the state of inode usage analogously.

       repquota  has  to  translate  ids  of all users/groups to names (unless option -n was specified) so it may take a while to print all the information. To make translating as fast as possible repquota
       tries to detect (by reading /etc/nsswitch.conf) whether entries are stored in standard plain text file or in a database and either translates chunks of 1024 names or each name individually. You  can
       override this autodetection by -c or -C options.

OPTIONS
       -a, --all
              Report on all filesystems indicated in /etc/mtab to be read-write with quotas.

       -v, --verbose
              Report all quotas, even if there is no usage. Be also more verbose about quotafile information.

       -c, --cache
              Cache entries to report and translate uids/gids to names in big chunks by scanning all users (default). This is good (fast) behaviour when using /etc/passwd file.

       -C, --no-cache
              Translate individual entries. This is faster when you have users stored in database.

       -t, --truncate-names
              Truncate user/group names longer than 9 characters. This results in nicer output when there are such names.

       -n, --no-names
              Don't resolve UIDs/GIDs to names. This can speedup printing a lot.

       -s, --human-readable
              Try to report used space, number of used inodes and limits in more appropriate units than the default ones.

       -p, --raw-grace
              When  user  is in grace period, report time in seconds since epoch when his grace time runs out (or has run out). Field is '0' when no grace time is in effect.  This is especially useful when
              parsing output by a script.

       -i, --no-autofs
              Ignore mountpoints mounted by automounter.

       -F, --format=format-name
              Report quota for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota  format  with  32-bit
              UIDs / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, xfs (quota on XFS filesystem)

       -g, --group
              Report quotas for groups.

       -u, --user
              Report quotas for users. This is the default.

       Only the super-user may view quotas which are not their own.

FILES
       aquota.user or aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user or quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/mtab           default filesystems
       /etc/passwd         default set of users
       /etc/group          default set of groups

SEE ALSO
       quota(1), quotactl(2), edquota(8), quotacheck(8), quotaon(8), quota_nld(8), setquota(8), warnquota(8)



4th Berkeley Distribution                                                                                                                                                                         REPQUOTA(8)
