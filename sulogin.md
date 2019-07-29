SULOGIN(8)                                                                               System Administration                                                                              SULOGIN(8)

NAME
       sulogin - single-user login

SYNOPSIS
       sulogin [options] [tty]

DESCRIPTION
       sulogin is invoked by init when the system goes into single-user mode.

       The user is prompted:

            Give root password for system maintenance
            (or type Control-D for normal startup):

       If the root account is locked and --force is specified, no password is required.

       sulogin will be connected to the current terminal, or to the optional tty device that can be specified on the command line (typically /dev/console).

       When the user exits from the single-user shell, or presses control-D at the prompt, the system will continue to boot.

OPTIONS
       -e, --force
              If the default method of obtaining the root password from the system via getpwnam(3) fails, then examine /etc/passwd and /etc/shadow to get the password.  If these files are damaged or
              nonexistent, or when root account is locked by '!' or '*' at the begin of the password then sulogin will start a root shell without asking for a password.

              Only use the -e option if you are sure the console is physically protected against unauthorized access.

       -p, --login-shell
              Specifying this option causes sulogin to start the shell process as a login shell.

       -t, --timeout seconds
              Specify the maximum amount of time to wait for user input.  By default, sulogin will wait forever.

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.

ENVIRONMENT VARIABLES
       sulogin looks for the environment variable SUSHELL or sushell to determine what shell to start.  If the environment variable is not set, it will try to execute root's shell from  /etc/passwd.
       If that fails, it will fall back to /bin/sh.

AUTHOR
       sulogin was written by Miquel van Smoorenburg for sysvinit and later ported to util-linux by Dave Reisner and Karel Zak.

AVAILABILITY
       The sulogin command is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                     July 2014                                                                                    SULOGIN(8)
