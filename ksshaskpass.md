KSSHASKPASS(1)                                                                             General Commands Manual                                                                             KSSHASKPASS(1)



NAME
       ksshaskpass - prompts a user for a passphrase using KDE

SYNOPSIS
       kdesshaskpass

DESCRIPTION
       kshaskpass is a KDE-based passphrase dialog for use with OpenSSH.  It is intended to be called by the ssh-add(1) program and not invoked directly.  It allows ssh-add(1) to obtain a passphrase from a
       user, even if not connected to a terminal (assuming that an X display is available).  This happens automatically in the case where ssh-add is invoked from one's ~/.xsession or  as  one  of  the  KDE
       startup programs, for example.

       In order to be called automatically by ssh-add, ksshaskpass should be installed as /usr/bin/ssh-askpass.

AUTHOR
       This manual page was written by Armin Berres <trigger@space-based.de>.  It was based on that for gnome-ssh-askpass by Colin Watson <cjwatson@debian.org>.



                                                                                                                                                                                               KSSHASKPASS(1)
