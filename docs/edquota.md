EDQUOTA(8)                                                                                 System Manager's Manual                                                                                 EDQUOTA(8)



NAME
       edquota - edit user quotas

SYNOPSIS
       edquota [ -p protoname ] [ -u | -g ] [ -rm ] [ -F format-name ] [ -f filesystem ] username...

       edquota [ -u | -g ] [ -F format-name ] [ -f filesystem ] -t

       edquota [ -u | -g ] [ -F format-name ] [ -f filesystem ] -T username | groupname...

DESCRIPTION
       edquota is a quota editor.  One or more users or groups may be specified on the command line. If a number is given in the place of user/group name it is treated as an UID/GID. For each user or group
       a temporary file is created with an ASCII representation of the current disk quotas for that user or group and an editor is then invoked on the file.  The quotas may then  be  modified,  new  quotas
       added, etc.  Setting a quota to zero indicates that no quota should be imposed.

       Users are permitted to exceed their soft limits for a grace period that may be specified per filesystem.  Once the grace period has expired, the soft limit is enforced as a hard limit.

       The current usage information in the file is for informational purposes; only the hard and soft limits can be changed.

       Upon leaving the editor, edquota reads the temporary file and modifies the binary quota files to reflect the changes made.

       The editor invoked is vi(1) unless either the EDITOR or the VISUAL environment variable specifies otherwise.

       Only the super-user may edit quotas.

OPTIONS
       -r, --remote
              Edit  also non-local quota use rpc.rquotad on remote server to set quota.  This option is available only if quota tools were compiled with enabled support for setting quotas over RPC.  The -n
              option is equivalent, and is maintained for backward compatibility.

       -m, --no-mixed-pathnames
              Currently, pathnames of NFSv4 mountpoints are sent without leading slash in the path.  rpc.rquotad uses this to recognize NFSv4 mounts and properly prepend pseudoroot of NFS filesystem to the
              path.  If  you  specify  this  option, edquota will always send paths with a leading slash. This can be useful for legacy reasons but be aware that quota over RPC will stop working if you are
              using new rpc.rquotad.

       -u, --user
              Edit the user quota. This is the default.

       -g, --group
              Edit the group quota.

       -p, --prototype=protoname
              Duplicate the quotas of the prototypical user specified for each user specified.  This is the normal mechanism used to initialize quotas for groups of users.

       --always-resolve
              Always try to translate user / group name to uid / gid even if the name is composed of digits only.

       -F, --format=format-name
              Edit quota for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota format with 32-bit UIDs
              / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, rpc (quota over NFS), xfs (quota on XFS filesystem)

       -f, --filesystem filesystem
              Perform specified operations only for given filesystem (default is to perform operations for all filesystems with quota).

       -t, --edit-period
              Edit  the  soft time limits for each filesystem.  In old quota format if the time limits are zero, the default time limits in <linux/quota.h> are used. In new quota format time limits must be
              specified (there is no default value set in kernel). Time units of 'seconds', 'minutes', 'hours', and 'days' are understood. Time limits are printed in the greatest possible  time  unit  such
              that the value is greater than or equal to one.

       -T, --edit-times
              Edit time for the user/group when softlimit is enforced. Possible values are 'unset' or number and unit. Units are the same as in -t option.

FILES
       aquota.user or aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user or quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/mtab           mounted filesystems table

SEE ALSO
       quota(1), vi(1), quotactl(2), quotacheck(8), quotaon(8), repquota(8), setquota(8)



                                                                                                                                                                                                   EDQUOTA(8)
