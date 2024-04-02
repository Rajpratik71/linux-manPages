UNIQUE(8)                                                     System Manager's Manual                                                    UNIQUE(8)

NAME
       unique - removes duplicates from a wordlist

SYNOPSIS
       unique output-file

DESCRIPTION
       This  manual  page  documents  briefly  the unique command, which is part of the john package.  This manual page was written for the Debian
       GNU/Linux distribution because the original program does not have a manual page.  john, better known as John the Ripper, is a tool to  find
       weak passwords of users in a server.
       The  unique  tool  finds  and removes duplicate entries from a wordlist (read from stdin), without changing the order. This is important to
       increase the performance of john when using the wordlist method.

SEE ALSO
       john(8), mailer(8), unafs(8), unshadow(8).

       The programs are documented fully by John's documentation, which should be available in /usr/share/doc/john or other location, depending on
       your system.

AUTHOR
       This manual page was written by Jordi Mallach <jordi@debian.org>, for the Debian GNU/Linux system (but may be used by others).
       John the Ripper and mailer were written by Solar Designer <solar@openwall.com>. The complete list of contributors can be found in the CRED‐
       ITS file in the documentation directory.

john                                                               June 03, 2004                                                         UNIQUE(8)
