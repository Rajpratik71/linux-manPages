PWCONV(8)                                                                               System Management Commands                                                                              PWCONV(8)

NAME
       pwconv, pwunconv, grpconv, grpunconv - convert to and from shadow passwords and groups

SYNOPSIS
       pwconv [options]

       pwunconv [options]

       grpconv [options]

       grpunconv [options]

DESCRIPTION
       The pwconv command creates shadow from passwd and an optionally existing shadow.

       The pwunconv command creates passwd from passwd and shadow and then removes shadow.

       The grpconv command creates gshadow from group and an optionally existing gshadow.

       The grpunconv command creates group from group and gshadow and then removes gshadow.

       These four programs all operate on the normal and shadow password and group files: /etc/passwd, /etc/group, /etc/shadow, and /etc/gshadow.

       Each program acquires the necessary locks before conversion.  pwconv and grpconv are similar. First, entries in the shadowed file which don't exist in the main file are removed. Then, shadowed
       entries which don't have `x' as the password in the main file are updated. Any missing shadowed entries are added. Finally, passwords in the main file are replaced with `x'. These programs can
       be used for initial conversion as well to update the shadowed file if the main file is edited by hand.

       pwconv will use the values of PASS_MIN_DAYS, PASS_MAX_DAYS, and PASS_WARN_AGE from /etc/login.defs when adding new entries to /etc/shadow.

       Likewise pwunconv and grpunconv are similar. Passwords in the main file are updated from the shadowed file. Entries which exist in the main file but not in the shadowed file are left alone.
       Finally, the shadowed file is removed. Some password aging information is lost by pwunconv. It will convert what it can.

OPTIONS
       The options which apply to the pwconv, pwunconv, grpconv, and grpunconv commands are:

       -h, --help
           Display help message and exit.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the CHROOT_DIR directory.

BUGS
       Errors in the password or group files (such as invalid or duplicate entries) may cause these programs to loop forever or fail in other strange ways. Please run pwck and grpck to correct any such
       errors before converting to or from shadow passwords or groups.

CONFIGURATION
       The following configuration variable in /etc/login.defs changes the behavior of grpconv and grpunconv:

       MAX_MEMBERS_PER_GROUP (number)
           Maximum members per group entry. When the maximum is reached, a new group entry (line) is started in /etc/group (with the same name, same password, and same GID).

           The default value is 0, meaning that there are no limits in the number of members in a group.

           This feature (split group) permits to limit the length of lines in the group file. This is useful to make sure that lines for NIS groups are not larger than 1024 characters.

           If you need to enforce such limit, you can use 25.

           Note: split groups may not be supported by all tools (even in the Shadow toolsuite). You should not use this variable unless you really need it.

       The following configuration variables in /etc/login.defs change the behavior of pwconv:

       PASS_MAX_DAYS (number)
           The maximum number of days a password may be used. If the password is older than this, a password change will be forced. If not specified, -1 will be assumed (which disables the
           restriction).

       PASS_MIN_DAYS (number)
           The minimum number of days allowed between password changes. Any password changes attempted sooner than this will be rejected. If not specified, -1 will be assumed (which disables the
           restriction).

       PASS_WARN_AGE (number)
           The number of days warning given before a password expires. A zero means warning is given only upon the day of expiration, a negative value means no warning is given. If not specified, no
           warning will be provided.

FILES
       /etc/login.defs
           Shadow password suite configuration.

SEE ALSO
       grpck(8), login.defs(5), pwck(8).

shadow-utils 4.2                                                                                03/26/2019                                                                                      PWCONV(8)
