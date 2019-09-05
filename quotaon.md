QUOTAON(8)                                                                                 System Manager's Manual                                                                                 QUOTAON(8)



NAME
       quotaon, quotaoff - turn filesystem quotas on and off

SYNOPSIS
       /usr/sbin/quotaon [ -vugfp ] [ -F format-name ] filesystem...
       /usr/sbin/quotaon [ -avugfp ] [ -F format-name ]

       /usr/sbin/quotaoff [ -vugp ] [ -x state ] filesystem...
       /usr/sbin/quotaoff [ -avugp ]

DESCRIPTION
   quotaon
       quotaon  announces  to  the  system that disk quotas should be enabled on one or more filesystems. The filesystem quota files must be present in the root directory of the specified filesystem and be
       named either aquota.user (for version 2 user quota), quota.user (for version 1 user quota), aquota.group (for version 2 group quota), or quota.group (for version 1 group quota).

       XFS filesystems are a special case - XFS considers quota information as filesystem metadata and uses journaling to provide a higher level guarantee of consistency.  There are two components  to  the
       XFS  disk quota system: accounting and limit enforcement.  XFS filesystems require that quota accounting be turned on at mount time.  It is possible to enable and disable limit enforcement on an XFS
       filesystem after quota accounting is already turned on.  The default is to turn on both accounting and enforcement.

       The XFS quota implementation does not maintain quota information in user-visible files, but rather stores this information internally.

   quotaoff
       quotaoff announces to the system that the specified filesystems should have any disk quotas turned off.

OPTIONS
   quotaon
       -F, --format=format-name
              Report quota for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota  format  with  32-bit
              UIDs / GIDs, 64-bit space usage, 32-bit inode usage and limits, vfsv1 Quota format with 64-bit quota limits and usage, xfs (quota on XFS filesystem)

       -a, --all
              All automatically mounted (no noauto option) non-NFS filesystems in /etc/fstab with quotas will have their quotas turned on.  This is normally used at boot time to enable quotas.

       -v, --verbose
              Display a message for each filesystem where quotas are turned on.

       -u, --user
              Manipulate user quotas. This is the default.

       -g, --group
              Manipulate group quotas.

       -p, --print-state
              Instead of turning quotas on just print state of quotas (ie. whether. quota is on or off)

       -x, --xfs-command enforce
              Switch on limit enforcement for XFS filesystems. This is the default action for any XFS filesystem. This option is only applicable to XFS, and is silently ignored for other filesystem types.

       -f, --off
              Make quotaon behave like being called as quotaoff.

   quotaoff
       -F, --format=format-name
              Report quota for specified format (ie. don't perform format autodetection).  Possible format names are: vfsold (version 1 quota), vfsv0 (version 2 quota), xfs (quota on XFS filesystem)

       -a, --all
              Force all filesystems in /etc/fstab to have their quotas disabled.

       -v, --verbose
              Display a message for each filesystem affected.

       -u, --user
              Manipulate user quotas. This is the default.

       -g, --group
              Manipulate group quotas.

       -p, --print-state
              Instead of turning quotas off just print state of quotas (ie. whether. quota is on or off)

       -x, --xfs-command delete
              Free  up  the space used to hold quota information (maintained internally) within XFS.  This option is only applicable to XFS, and is silently ignored for other filesystem types.  It can only
              be used on a filesystem with quota previously turned off.

       -x, --xfs-command enforce
              Switch off limit enforcement for XFS filesystems (perform quota accounting only). This is the default action for any XFS filesystem.  This option is only applicable to XFS,  and  is  silently
              ignored for other filesystem types.

       -x, --xfs-command account
              This  option  can  be used to disable quota accounting. It is not possible to enable quota accounting by quota tools. Use mount(8) for that. This option is only applicable to XFS filesystems,
              and is silently ignored for other filesystem types.

NOTES ON XFS FILESYSTEMS
       To enable quotas on an XFS filesystem, use mount(8) or /etc/fstab quota option to enable both accounting and limit enforcement.  quotaon utility cannot be used for this purpose.

       Turning on quotas on an XFS root filesystem requires the quota mount options be passed into the kernel at boot time through the Linux rootflags boot option.

       To turn off quota limit enforcement on any XFS filesystem, first make sure that quota accounting and enforcement are both turned on using repquota -v filesystem.  Then, use quotaoff -v filesystem to
       disable limit enforcement.  This may be done while the filesystem is mounted.

       Turning on quota limit enforcement on an XFS filesystem is achieved using quotaon -v filesystem.  This may be done while the filesystem is mounted.

FILES
       aquota.user or aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user or quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/fstab          default filesystems

SEE ALSO
       quotactl(2), fstab(5), quota_nld(8), repquota(8), warnquota(8)



4th Berkeley Distribution                                                                                                                                                                          QUOTAON(8)
