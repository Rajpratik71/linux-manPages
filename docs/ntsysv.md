NTSYSV(8)                                                                                  System Manager's Manual                                                                                  NTSYSV(8)



NAME
       ntsysv - simple interface for configuring runlevels

SYNOPSIS
       ntsysv [--back] [--level <levels>]

DESCRIPTION
       ntsysv  is a simple interface for configuring runlevel services which are also configurable through chkconfig. By default, it configures runlevels 2, 3, 4, and 5. If the user would like to configure
       other runlevels, those levels can be specified on the command line by listing the levels after --level, without any spaces. For example, the option --level 016 edits runlevels 0, 1, and 6.

       A service is considered to be started in the runlevel set if it is started in any of the runlevels which are being edited.

       The ntsysv window normally contains a Cancel button. If --back is specified, a Back button appears instead.


RETURN CODES
       ntsysv returns 0 on success, 2 on error, and 1 if the user cancelled (or backed out of) the program.


SEE ALSO
       chkconfig(8),


AUTHOR
       Erik Troan <ewt@redhat.com>



4th Berkeley Distribution                                                                      Mon Oct 13 1997                                                                                      NTSYSV(8)
