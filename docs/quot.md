QUOT(8)                                                                                    System Manager's Manual                                                                                    QUOT(8)



NAME
       quot - summarize filesystem ownership

SYNOPSIS
       quot [ -acfguvi ] [ filesystem... ]

DESCRIPTION
       quot displays the number of kilobytes in the named filesystem currently owned by each user or group. Note that this utility currently works only for XFS.

OPTIONS
       -a     Generate a report for all mounted filesystems giving the number of kilobytes used by each user or group.

       -c     Display  three columns giving file size in kilobytes, number of files of that size, and cumulative total of kilobytes in that size or smaller file.  The last row is used as an overflow bucket
              and is the total of all files greater than 500 kilobytes.

       -f     Display count of kilobytes and number of files owned by each user or group.

       -g     Report on groups.

       -u     Report on users (the default).

       -v     Display three columns containing the number of kilobytes not accessed in the last 30, 60, and 90 days.

       -i     Ignore mountpoints mounted by automounter.

       -T     Avoid truncation of user names longer than 8 characters.

       -q     Do not sort the output.

FILES
       /etc/mtab           mounted filesystem table
       /etc/passwd         default set of users
       /etc/group          default set of groups

SEE ALSO
       du(1), ls(1).

BUGS
       Currently, only the XFS filesystem type is supported.



                                                                                                                                                                                                      QUOT(8)
