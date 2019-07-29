MAILER(8)                                                     System Manager's Manual                                                    MAILER(8)

NAME
       mailer - script to warn users about their weak passwords

SYNOPSIS
       mailer password-files

DESCRIPTION
       This  manual  page  documents  briefly  the mailer command, which is part of the john package.  This manual page was written for the Debian
       GNU/Linux distribution because the original program does not have a manual page.  john, better known as John the Ripper, is a tool to  find
       weak passwords of users in a server.
       The mailer tool is useful to inform users which have been found to be using weak passwords by mail.

       You  should edit the message mailer will send to the users, but remember to copy the script to a safe place before editing it, as it's gen‐
       erally a bad idea to modify things living in /usr.

SEE ALSO
       john(8), unafs(8), unique(8), unshadow(8).

       The programs are documented fully by John's documentation, which should be available in /usr/share/doc/john or other location, depending on
       your system.

AUTHOR
       This manual page was written by Jordi Mallach <jordi@debian.org>, for the Debian GNU/Linux system (but may be used by others).
       John the Ripper and mailer were written by Solar Designer <solar@openwall.com>. The complete list of contributors can be found in the CRED‐
       ITS file in the documentation directory.

john                                                               June 03, 2004                                                         MAILER(8)
