AA-NOTIFY(8)                                                                                       AppArmor                                                                                      AA-NOTIFY(8)



NAME
       aa-notify - display information about logged AppArmor messages.

SYNOPSIS
       aa-notify [option]

DESCRIPTION
       aa-notify will display a summary or provide desktop notifications for AppArmor DENIED messages.

OPTIONS
       aa-notify accepts the following arguments:

       -p, --poll
           poll AppArmor logs and display desktop notifications. Can be used with '-s' option to display a summary on startup.

       -f FILE, --file=FILE
           search FILE for AppArmor messages

       -l, --since-last
           show summary since last login.

       -s NUM, --since-days=NUM
           show summary for last NUM of days.

       -u USER, --user=USER
           user to drop privileges to when running privileged. When used with the -p option, this should be set to the user that will receive desktop notifications.  This has no effect when running under
           sudo.

       -w NUM, --wait=NUM
           wait NUM seconds before displaying notifications (for use with -p)

       -v, --verbose
           show messages with summaries.

       -h, --help
           displays a short usage statement.

CONFIGURATION
       System-wide configuration for aa-notify is done via /etc/apparmor/notify.conf:

         # set to 'yes' to enable AppArmor DENIED notifications
         show_notifications="yes"

         # only people in use_group can use aa-notify
         use_group="admin"

       Per-user configuration is done via ~/.apparmor/notify.conf:

         # set to 'yes' to enable AppArmor DENIED notifications
         show_notifications="yes"

BUGS
       aa-notify needs to be able to read the logfiles containing the AppArmor DENIED messages.

       If you find any additional bugs, please report them to Launchpad at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7)



AppArmor 2.8.2                                                                                    2011-08-17                                                                                     AA-NOTIFY(8)
