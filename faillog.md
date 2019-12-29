FAILLOG(8)                            System Management Commands                            FAILLOG(8)

NAME
       faillog - display faillog records or set login failure limits

SYNOPSIS
       faillog [options]

DESCRIPTION
       faillog displays the contents of the failure log database (/var/log/faillog). It can also set
       the failure counters and limits. When faillog is run without arguments, it only displays the
       faillog records of the users who had a login failure.

OPTIONS
       The options which apply to the faillog command are:

       -a, --all
           Display (or act on) faillog records for all users having an entry in the faillog database.

           The range of users can be restricted with the -u option.

           In display mode, this is still restricted to existing users but forces the display of the
           faillog entries even if they are empty.

           With the -l, -m, -r, -t options, the users' records are changed, even if the user does not
           exist on the system. This is useful to reset records of users that have been deleted or to
           set a policy in advance for a range of users.

       -h, --help
           Display help message and exit.

       -l, --lock-secs SEC
           Lock account for SEC seconds after failed login.

           Write access to /var/log/faillog is required for this option.

       -m, --maximum MAX
           Set the maximum number of login failures after the account is disabled to MAX.

           Selecting a MAX value of 0 has the effect of not placing a limit on the number of failed
           logins.

           The maximum failure count should always be 0 for root to prevent a denial of services
           attack against the system.

           Write access to /var/log/faillog is required for this option.

       -r, --reset
           Reset the counters of login failures.

           Write access to /var/log/faillog is required for this option.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the
           CHROOT_DIR directory.

       -t, --time DAYS
           Display faillog records more recent than DAYS.

       -u, --user LOGIN|RANGE
           Display faillog record or maintains failure counters and limits (if used with -l, -m or -r
           options) only for the specified user(s).

           The users can be specified by a login name, a numerical user ID, or a RANGE of users. This
           RANGE of users can be specified with a min and max values (UID_MIN-UID_MAX), a max value
           (-UID_MAX), or a min value (UID_MIN-).

       When none of the -l, -m, or -r options are used, faillog displays the faillog record of the
       specified user(s).

CAVEATS
       faillog only prints out users with no successful login since the last failure. To print out a
       user who has had a successful login since their last failure, you must explicitly request the
       user with the -u flag, or print out all users with the -a flag.

FILES
       /var/log/faillog
           Failure logging file.

SEE ALSO
       login(1), faillog(5).

shadow-utils 4.5                              08/29/2019                                    FAILLOG(8)
