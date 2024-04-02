WARNQUOTA(8)                                                                               System Manager's Manual                                                                               WARNQUOTA(8)



NAME
       warnquota - send mail to users over quota

SYNOPSIS
       warnquota [ -ugsid ] [ -F quotaformat ] [ -q quotatab ] [ -c configfile ] [ -a adminsfile ] [ filesystem...  ]

DESCRIPTION
       warnquota  checks  the disk quota for specified local filesystems (or for each local filesystem if none specified) and mails a warning message to those users who have reached their softlimit.  It is
       typically run via cron(8).

       -F, --format=quotaformat
              Perform setting for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota format with 32-bit
              UIDs / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, xfs Quota on XFS filesystem.

       -q, --quota-tab=quotatab
              Use quotatab instead of /etc/quotatab as file with device description strings (see example file for syntax).

       -c, --config=configfile
              Use configfile instead of /etc/warnquota.conf as configuration file (see example file for syntax).

       -a, --admins-file=adminsfile
              Use adminsfile instead of /etc/quotagrpadmins as a file with administrators of the groups.

       -u, --user
              check whether users are not exceeding quotas (default).

       -g, --group
              check whether groups are not exceeding quotas. If group is exceeding quota a mail is sent to the user specified in /etc/quotagrpadmins.

       -s, --human-readable
              Try to report used space, number of used inodes and limits in more appropriate units than the default ones.

       -i, --no-autofs
              ignore mountpoints mounted by automounter.

       -d, --no-details
              do not attach quota report in email.

FILES
       aquota.user         quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user          quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/warnquota.conf configuration file
       /etc/quotatab       device description
       /etc/quotagrpadmins administrators of the groups
       /etc/mtab           default filesystems
       /etc/passwd         default set of users

SEE ALSO
       quota(1), cron(8), edquota(8).

AUTHORS
       warnquota(8)  was  written by Marco van Wieringen <mvw@planets.elm.net>, modifications by Jan Kara <jack@suse.cz>.  This reference page written by Heiko Schlittermann <heiko@lotte.sax.de>, modifica-
       tions by Jan Kara



                                                                                                                                                                                                 WARNQUOTA(8)
