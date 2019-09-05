USERPASSWD(1)                                                 General Commands Manual                                                USERPASSWD(1)

NAME
       userpasswd - A graphical tool to allow users to change their passwords.

SYNOPSIS
       userpasswd [ options ]

DESCRIPTION
       userpasswd  is  a  graphical tool to allow users to easily change their passwords.  Aside from being a nice GUI frontend, this program does
       the right thing when the pam configuration has changed.

OPTIONS
       This program has no command line options of its own, but it does take the standard X program options like -display and such.  See the  X(1)
       man page for some of the common options.

SEE ALSO
       userhelper(8)

BUGS
       No  known bugs, but compatibility with bizarre changes in the pam configuration have not been tested aggressively.  If you have a non-stan‐
       dard pam configuration, I'd be interested to hear whether it worked and what kind of configuration you have.

AUTHOR
       Otto Hammersmith <otto@redhat.com>

Red Hat Software                                                  17 October 1997                                                    USERPASSWD(1)
