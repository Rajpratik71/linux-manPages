UNAFS(8)                                                      System Manager's Manual                                                     UNAFS(8)

NAME
       unafs - script to warn users about their weak passwords

SYNOPSIS
       unafs password-files cell-name

DESCRIPTION
       This  manual  page  documents  briefly  the  unafs command, which is part of the john package.  This manual page was written for the Debian
       GNU/Linux distribution because the original program does not have a manual page.  john, better known as John the Ripper, is a tool to  find
       weak passwords of users in a server.
       The unafs tool gets password hashes out of the binary AFS database, and produces a file usable by John.

SEE ALSO
       john(8), mailer(8), unique(8), unshadow(8).

       The programs are documented fully by John's documentation, which should be available in /usr/share/doc/john or other location, depending on
       your system.

AUTHOR
       This manual page was written by Jordi Mallach <jordi@debian.org>, for the Debian GNU/Linux system (but may be used by others).
       John the Ripper and mailer were written by Solar Designer <solar@openwall.com>. The complete list of contributors can be found in the CRED‐
       ITS file in the documentation directory.

john                                                               June 03, 2004                                                          UNAFS(8)
