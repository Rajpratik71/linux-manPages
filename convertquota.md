CONVERTQUOTA(8)                                                                            System Manager's Manual                                                                            CONVERTQUOTA(8)



NAME
       convertquota - convert quota from old file format to new one

SYNOPSIS
       convertquota [ -ug ] -e filesystem

       convertquota [ -ug ] -f oldformat,newformat filesystem

DESCRIPTION
       convertquota  converts old quota files quota.user and quota.group to files aquota.user and aquota.group in new format currently used by 2.4.0-ac? and newer or by SuSE or Red Hat Linux 2.4 kernels on
       filesystem.

       New file format allows using quotas for 32-bit uids / gids, setting quotas for root, accounting used space in bytes (and so allowing use of quotas in ReiserFS) and it is also  architecture  indepen‐
       dent. This format introduces Radix Tree (a simple form of tree structure) to quota file.

OPTIONS
       -u, --user
              convert user quota file. This is the default.

       -g, --group
              convert group quota file.

       -f, --convert-format oldformat,newformat
              convert quota file from oldformat to newformat.

       -e, --convert-endian
              convert vfsv0 file format from big endian to little endian (old kernels had a bug and did not store quota files in little endian format).

       -V, --version
              print version information.

FILES
       aquota.user         new user quota file

       aquota.group        new group quota file

SEE ALSO
       quota(1), setquota(8), edquota(8), quotacheck(8), quotaon(8), repquota(8)

AUTHOR
       Jan Kara <jack@suse.cz>




4th Berkeley Distribution                                                                      Fri Aug 20 1999                                                                                CONVERTQUOTA(8)
