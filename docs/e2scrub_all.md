E2SCRUB(8)                              System Manager's Manual                             E2SCRUB(8)

NAME
       e2scrub_all - check all mounted ext[234] filesystems for errors.

SYNOPSYS
       e2scrub_all [OPTION]

DESCRIPTION
       Searches  the system for all LVM logical volumes containing an ext2, ext3, or ext4 file system,
       and checks them for problems.  The checking is performed by invoking the  e2scrub  tool,  which
       will  look  for  corruptions.  Corrupt filesystems will be tagged as having errors so that fsck
       will be invoked before the next mount.  If no errors are encountered, fstrim will be called  on
       the  filesystem  if  it is mounted.  See the e2scrub manual page for more information about how
       the checking is performed.

OPTIONS
       -n     Print what commands e2scrub_all  would  execute  to  initiate  the  e2scrub  operations.
              (Note: these commands will not actually be executed; however, since e2scrub_all needs to
              run some additional, privileged commands to query the system to determine which  e2scrub
              commands would be executed, it still needs to be run as root.)

       -r     Remove e2scrub snapshots but do not check anything.

       -A     Scrub all ext[234] filesystems even if they are not mounted.

       -V     Print version information and exit.

SEE ALSO
       e2scrub(8)

AUTHOR
       Darrick J. Wong <darrick.wong@oracle.com>

COPYRIGHT
       Copyright ©2018 Oracle.  License is GPLv2+. <http://www.gnu.org/licenses/gpl-2.0.html>

E2fsprogs version 1.45.3                       July 2019                                    E2SCRUB(8)
