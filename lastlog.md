LASTLOG(8)                            System Management Commands                            LASTLOG(8)

NAME
       lastlog - reports the most recent login of all users or of a given user

SYNOPSIS
       lastlog [options]

DESCRIPTION
       lastlog formats and prints the contents of the last login log /var/log/lastlog file. The
       login-name, port, and last login time will be printed. The default (no flags) causes lastlog
       entries to be printed, sorted by their order in /etc/passwd.

OPTIONS
       The options which apply to the lastlog command are:

       -b, --before DAYS
           Print only lastlog records older than DAYS.

       -C, --clear
           Clear lastlog record of a user. This option can be used only together with -u (--user)).

       -h, --help
           Display help message and exit.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the
           CHROOT_DIR directory.

       -S, --set
           Set lastlog record of a user to the current time. This option can be used only together
           with -u (--user)).

       -t, --time DAYS
           Print the lastlog records more recent than DAYS.

       -u, --user LOGIN|RANGE
           Print the lastlog record of the specified user(s).

           The users can be specified by a login name, a numerical user ID, or a RANGE of users. This
           RANGE of users can be specified with a min and max values (UID_MIN-UID_MAX), a max value
           (-UID_MAX), or a min value (UID_MIN-).

       If the user has never logged in the message ** Never logged in** will be displayed instead of
       the port and time.

       Only the entries for the current users of the system will be displayed. Other entries may exist
       for users that were deleted previously.

NOTE
       The lastlog file is a database which contains info on the last login of each user. You should
       not rotate it. It is a sparse file, so its size on the disk is usually much smaller than the
       one shown by "ls -l" (which can indicate a really big file if you have in passwd users with a
       high UID). You can display its real size with "ls -s".

FILES
       /var/log/lastlog
           Database times of previous user logins.

CAVEATS
       Large gaps in UID numbers will cause the lastlog program to run longer with no output to the
       screen (i.e. if in lastlog database there is no entries for users with UID between 170 and 800
       lastlog will appear to hang as it processes entries with UIDs 171-799).

shadow-utils 4.5                              08/29/2019                                    LASTLOG(8)
