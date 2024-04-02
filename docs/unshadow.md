UNSHADOW(8)                                                   System Manager's Manual                                                  UNSHADOW(8)

NAME
       unshadow - combines passwd and shadow files

SYNOPSIS
       unshadow password-file shadow-file

DESCRIPTION
       This  manual  page  documents briefly the unshadow command, which is part of the john package.  This manual page was written for the Debian
       GNU/Linux distribution because the original program does not have a manual page.  john, better known as John the Ripper, is a tool to  find
       weak passwords of users in a server.

       The  unshadow  tool combines the passwd and shadow files so John can use them. You might need this since if you only used your shadow file,
       the GECOS information wouldn't be used by the "single crack" mode, and also you wouldn't be able to use the '-shells' option. On  a  normal
       system you'll need to run unshadow as root to be able to read the shadow file.

SEE ALSO
       john(8), mailer(8), unafs(8), unique(8).

       The programs are documented fully by John's documentation, which should be available in /usr/share/doc/john or other location, depending on
       your system.

AUTHOR
       This manual page was written by Jordi Mallach <jordi@debian.org>, for the Debian GNU/Linux system (but may be used by others).
       John the Ripper and mailer were written by Solar Designer <solar@openwall.com>. The complete list of contributors can be found in the CRED‐
       ITS file in the documentation directory.

john                                                               June 03, 2004                                                       UNSHADOW(8)
