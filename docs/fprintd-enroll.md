fprintd(1)                                                                                  fprintd(1)

NAME
       fprintd - Fingerprint management daemon, and test applications

SYNOPSYS
       fprintd-enroll [-f finger] [usename]

       fprintd-list username [usernames...]

       fprintd-verify [-f finger] [usename]

       fprintd-delete username [usernames...]

DESCRIPTION
       This manual page documents briefly the fprintd command-line utilities.

       The fprintd daemon is accessed through D-Bus by those command-line utilities.

ARGUMENTS
       username
               The username for the user for which you want to query or modify the fingerprint
               database.

               Not that fprintd-list and fprintd-delete require at least one username to be passed,
               and support multiple usernames.

               fprintd-enroll and fprintd-verify will use the current username if none are passed on
               the command-line.

       -f finger
               For fprintd-enroll, the finger to enroll. Possible values are:

               left-thumb, left-index-finger, left-middle-finger, left-ring-finger, left-little-
               finger, right-thumb, right-index-finger, right-middle-finger, right-ring-finger, right-
               little-finger.

               The default is automatic, selecting the first available finger for swipe devices, or
               all the enrolled fingers, for press devices.

TEST APPLICATIONS
   fprintd-enroll
               Will enroll the user's right index finger into the database.

   fprintd-list
               Will list the user's enrolled fingerprints.

   fprintd-verify
               Will enroll the user's right index finger into the database.

   fprintd-enroll
               Will enroll the user's right index finger into the database.

AUTHOR
       fprintd was written by Bastien Nocera and Daniel Drake.

DIRECTORIES
       By default, fprintd stores the fingerprints in /var/lib/fprint/

SEE ALSO
       dbus-daemon, gnome-about-me

freedesktop                                   2019-08-21                                    fprintd(1)
