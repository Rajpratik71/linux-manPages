VLOCK(1)                                                                                   General Commands Manual                                                                                   VLOCK(1)



NAME
       vlock - Virtual Console lock program

SYNOPSIS
       vlock

       vlock [ -a,--all ] [ -c,--current ] [ -h,--help ] [ -v,--version ]

DESCRIPTION
       vlock  is  a  program to lock one or more sessions on the Linux console.  This is especially useful for Linux machines which have multiple users with access to the console.  One user may lock his or
       her session(s) while still allowing other users to use the system on other virtual consoles.  If desired, the entire console may be locked and virtual console switching disabled.

       By default, only the current VC (virtual console) is locked.  With the -a,-all option all VCs are locked.  The locked VCs cannot be unlocked without the invoker's password.  And, for  the  paranoid,
       vlock makes it a trying experience for those attempting to guess the password, so unauthorized access to session(s) is highly unlikely.

       Please  note  that it is entirely possible to completely lock yourself out of the console with the -a,--all option if you cannot remember your password!  Unless you are able to kill vlock by logging
       in remotely via a serial terminal or network, a hard reset is the only method of ``unlocking'' the display.

       vlock works for console sessions primarily.  However, there is support for trying to lock non-console sessions as well, but that support has not been well tested.

OPTIONS
       -a,--all

              Lock all console sessions and disable VC switching.

       -c,--current

              Lock the current session (this is the default).

       -h,--help

              Print a brief help message.

       -v,--version

              Print the version number of vlock.

AUTHOR
       Michael K. Johnson <johnsonm@redhat.com>



Linux User's Manual                                                                              16 May 1996                                                                                         VLOCK(1)
