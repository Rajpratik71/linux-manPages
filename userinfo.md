USERINFO(1)                                                   General Commands Manual                                                  USERINFO(1)

NAME
       userinfo - A graphical equivilient to chfn.

SYNOPSIS
       userinfo [ options ]

DESCRIPTION
       userinfo is a graphical tool to allow users to conveniently change their finger information.

OPTIONS
       This  program has no command line options of its own, but it does take the standard X program options like -display and such.  See the X(1)
       man page for some of the common options.

SEE ALSO
       chfn(1), finger(1), passwd(5)

BUGS
       Currently doesn't give feedback to the user when the helper fails. (things like incorrect passwords and such) The next iteration should fix
       this bug.

AUTHOR
       Otto Hammersmith <otto@redhat.com>

Red Hat Software                                                  6 October 1997                                                       USERINFO(1)
