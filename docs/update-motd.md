update-motd(8)                                                System Manager's Manual                                               update-motd(8)

NAME
       update-motd - immediately update the dynamic MOTD and print it to stdout

SYNOPSIS
       update-motd

DESCRIPTION
       The PAM MOTD module updates the Message-of-the-Day automatically on user logins.

       But sometimes, the system administrator may want to update the MOTD immediately or on demand.

       This simple program performs the same actions handled by PAM on login, and prints the new MOTD to stdout.

       Note that only the system administrator can typically write to the MOTD, and thus this utility should be executed as the root user.

       For best practices and additional information, please see update-motd(5).

FILES
       /etc/motd, /var/run/motd, /etc/update-motd.d

SEE ALSO
       motd(5), pam_motd(8), run-parts(8), update-motd(5)

AUTHOR
       This  manpage  and the update-motd framework was written by Dustin Kirkland <dustin.kirkland@gmail.com> for Ubuntu systems (but may be used
       by others).  Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License,  Ver‐
       sion 3 published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

update-motd                                                      14 February 2013                                                   update-motd(8)
