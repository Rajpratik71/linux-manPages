VLOCK(1)                                                                                     Linux User's Manual                                                                                     VLOCK(1)



NAME
       vlock - Virtual Console lock program

SYNOPSIS
       vlock [ -hv ]

       vlock [ -acns ] [ -t <timeout> ] [ plugins... ]

DESCRIPTION
       vlock  is  a  program to lock one or more sessions on the Linux console.  This is especially useful for Linux machines which have multiple users with access to the console.  One user may lock his or
       her session(s) while still allowing other users to use the system on other virtual consoles.  If desired, the entire console may be locked and virtual console switching disabled.

       By default, only the current VC (virtual console) is locked.  With the -a,--all option all VCs are locked.  The locked VCs cannot be unlocked without the invoker's password  or  the  root  password.
       The root password will always be able to unlock any or all sessions, unless disabled at compile time.

       Please  note  that it is entirely possible to completely lock yourself out of the console with the -a,--all option if you cannot remember your password!  Unless you are able to kill vlock by logging
       in remotely via a serial terminal or network, a hard reset is the only method of ``unlocking'' the display.

       When locking the entire console display it is sometimes still possible to kill vlock using the Secure Access Key (SAK) or other commands that are available through the  SysRq  mechanism.   When  the
       -s,--disable-sysrq and -a,--all options are given the SysRq mechanism is disabled while vlock is running.  See /usr/src/linux/Documentation/sysrq.txt for more details.

       vlock  works  for console sessions primarily.  To lock the entire console display from an X session use the -n,--new option.  This will make vlock switch to an empty virtual console to lock the dis-
       play.

       The options -n,--new, -s,--disable-sysrq, and -t,--timeout only work if vlock is compiled with plugin support.  See the PLUGINS section for more information.

OPTIONS
       -a,--all

              Lock all console sessions and disable VC switching.

       -c,--current

              Lock the current session (this is the default).

       -n,--new

              Switch to a new virtual console before locking all console sessions.

       -s,--disable-sysrq

              Disable the SysRq mechanism while consoles are locked.  This option only works if the -a,--all option given.

       -t,--timeout <seconds>

              Specify the timeout for the screensaver plugins.  See vlock-plugins(5) for more information.

       -h,--help

              Print a brief help message.

       -v,--version

              Print the version number.

ENVIRONMENT VARIABLES
       The following environment variables can be used to change vlock's behavior:

       USER

              If this variable is when vlock is run as root (uid 0) vlock locks the screen as this user instead of root.  The root password will still be able to unlock the session, unless disabled at com-
              pile time.

       VLOCK_ALL_MESSAGE

              If this variable is set and all consoles are locked its contents will be used as the locking message instead of the default message.

       VLOCK_CURRENT_MESSAGE

              If this variable is set and only the current consoles is locked its contents will be used as the locking message instead of the default message.

       VLOCK_MESSAGE

              If this variable is set its contents will be used as the locking message instead of the default.  This overrides the former two variables.

       VLOCK_PLUGINS

              If this variable is set it is interpreted as a space separated list of plugins that will be loaded when vlock starts additionally to the ones listed on the command line.

       VLOCK_TIMEOUT

              Set  this  variable to specify the timeout (in seconds) after which the screen saver plugins (if any) will be invoked.  If this variable is unset or set to an invalid value or 0 no timeout is
              used.  See vlock-plugins(5) for more information about plugins.

       VLOCK_PROMPT_TIMEOUT

              Set this variable to specify the amount of time (in seconds) you will have to enter your password at the password prompt.  If this variable is unset or set to an invalid value or 0 no timeout
              is used.  Warning: If this value is too low, you may not be able to unlock your session.

FILES
       ~/.vlockrc

              This file is read by vlock on startup if it exists.  All the variables mentioned above can be set here.

SECURITY
       See the SECURITY file in the vlock distribution for more information.

SEE ALSO
       vlock-main(8), vlock-plugins(5)

AUTHORS
       Michael K. Johnson <http://danlj.org/mkj/>

       Frank Benkstein <frank-vlock@benkstein.net>



Linux                                                                                            28 July 2007                                                                                        VLOCK(1)
