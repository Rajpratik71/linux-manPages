ARCHDETECT(1)                         BSD General Commands Manual                        ARCHDETECT(1)

NAME
     archdetect — detect hardware architecture

SYNOPSIS
     archdetect [-g]

DESCRIPTION
     archdetect displays the current machine architecture and subarchitecture.  The architecture cor‐
     responds to that built into dpkg, and describes the CPU (and possibly kernel) types; the subar‐
     chitecture distinguishes machines with different boot arrangements that require special handling.

     The following option is available:

     -g    When bringing up new subarchitectures, archdetect may not yet have been taught about this
           specific machine.  This option asks that archdetect try to guess a generic subarchitecture
           that may be compatible with this machine.  This is only necessary on certain architectures,
           and simply has no effect elsewhere.

AUTHORS
     archdetect was written by the Debian Installer team.

Debian                                     January 10, 2011                                     Debian
