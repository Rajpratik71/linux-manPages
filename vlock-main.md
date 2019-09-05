VLOCK-MAIN(8)                                                                             Linux Programmer's Manual                                                                             VLOCK-MAIN(8)



NAME
       vlock-main - lock current virtual console

SYNOPSIS
       vlock-main [plugins...]

DESCRIPTION
       vlock-main  is  part of vlock(1), the Virtual Console locking program for Linux.  It locks the current session and will only exit if the current user can authenticate themselves.  The root user will
       also be able to unlock the session, unless disabled at compile time.  The command line arguments specify plugins that should be loaded by vlock-main.  See vlock-plugins(5) for more information.

       If plugin support is disabled at compile time, the only supported argument is "all".

ENVIRONMENT VARIABLES
       The following environment variables can be used to change the behavior of vlock-main:

       USER

              If this variable is when vlock-main is run as root (uid 0) vlock locks the screen as this user instead of root.  The root password will still be able to unlock the session, unless disabled at
              compile time.

       VLOCK_ALL_MESSAGE

              If this variable is set and all consoles are locked its contents will be used as the locking message instead of the default message.

       VLOCK_CURRENT_MESSAGE

              If this variable is set and only the current consoles is locked its contents will be used as the locking message instead of the default message.

       VLOCK_MESSAGE

              If this variable is set its contents will be used as the locking message instead of the default.  This overrides the former two variables.

       VLOCK_TIMEOUT

              Set  this  variable to specify the timeout (in seconds) after which the screen saver plugins (if any) will be invoked.  If this variable is unset or set to an invalid value or 0 no timeout is
              used.  See vlock-plugins(5) for more information about plugins.

       VLOCK_PROMPT_TIMEOUT

              Set this variable to specify the amount of time (in seconds) you will have to enter your password at the password prompt.  If this variable is unset or set to an invalid value or 0 no timeout
              is used.  Warning: If this value is too low, you may not be able to unlock your session.

SIGNALS
       Several signals are ignored.  vlock-main will try to exit cleanly if SIGTERM is received.

SEE ALSO
       vlock(1), vlock-plugins(5)

AUTHORS
       Frank Benkstein <frank-vlock@benkstein.net>



Linux                                                                                            28 July 2007                                                                                   VLOCK-MAIN(8)
