SETQUOTA(8)                                                                                System Manager's Manual                                                                                SETQUOTA(8)



NAME
       setquota - set disk quotas

SYNOPSIS
       setquota [ -rm ] [ -u | -g ] [ -F quotaformat ] name block-softlimit block-hardlimit inode-softlimit inode-hardlimit -a | filesystem...

       setquota [ -rm ] [ -u | -g ] [ -F quotaformat ] [ -p protoname ] name -a | filesystem...

       setquota -b [ -rm ] [ -u | -g ] [ -F quotaformat ] -a | filesystem...

       setquota -t [ -u | -g ] [ -F quotaformat ] block-grace inode-grace -a | filesystem...

       setquota -T [ -u | -g ] [ -F quotaformat ] name block-grace inode-grace -a | filesystem...

DESCRIPTION
       setquota  is  a  command line quota editor.  The filesystem, user/group name and new quotas for this filesystem can be specified on the command line. Note that if a number is given in the place of a
       user/group name it is treated as an UID/GID.

       -r, --remote
              Edit also remote quota use rpc.rquotad on remote server to set quota. This option is available only if quota tools were compiled with enabled support for setting quotas over RPC.

       -m, --no-mixed-pathnames
              Currently, pathnames of NFSv4 mountpoints are sent without leading slash in the path.  rpc.rquotad uses this to recognize NFSv4 mounts and properly prepend pseudoroot of NFS filesystem to the
              path.  If  you  specify  this option, setquota will always send paths with a leading slash. This can be useful for legacy reasons but be aware that quota over RPC will stop working if you are
              using new rpc.rquotad.

       -F, --format=quotaformat
              Perform setting for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota format with 32-bit
              UIDs / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, rpc (quota over NFS), xfs (quota on XFS filesystem)

       -u, --user
              Set user quotas for named user. This is the default.

       -g, --group
              Set group quotas for named group.

       -p, --prototype=protoname
              Use quota settings of user or group protoname to set the quota for the named user or group.

       --always-resolve
              Always try to translate user / group name to uid / gid even if the name is composed of digits only.

       -b, --batch
              Read information to set from stdin (input format is name block-softlimit block-hardlimit inode-softlimit inode-hardlimit ). Empty lines and lines starting with # are ignored.

       -c, --continue-batch
              If parsing of an input line in batch mode fails, continue with processing the next line.

       -t, --edit-period
              Set grace times for users/groups. Times block-grace and inode-grace are specified in seconds.

       -T, --edit-times
              Alter times for individual user/group when softlimit is enforced. Times block-grace and inode-grace are specified in seconds or can be string 'unset'.

       -a, --all
              Go through all filesystems with quota in /etc/mtab and perform setting.

       block-softlimit and block-hardlimit are interpreted as multiples of kibibyte (1024 bytes) blocks by default.  Symbols K, M, G, and T can be appended to numeric value to express kibibytes, mebibytes,
       gibibytes, and tebibytes.

       inode-softlimit and inode-hardlimit are interpreted literally. Symbols k, m, g, and t can be appended to numeric value to express multiples of 10^3, 10^6, 10^9, and 10^12 inodes.

       To disable a quota, set the corresponding parameter to 0. To change quotas for several filesystems, invoke once for each filesystem.

       Only the super-user may edit quotas.

FILES
       aquota.user or aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user or quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/mtab           mounted filesystem table

SEE ALSO
       edquota(8), quota(1), quotactl(2), quotacheck(8), quotaon(8), repquota(8)



                                                                                                                                                                                                  SETQUOTA(8)
