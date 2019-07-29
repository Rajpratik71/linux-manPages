MESG(1)                         User Commands                         MESG(1)

NAME
       mesg - display (or do not display) messages from other users

SYNOPSIS
       mesg [option] [n|y]

DESCRIPTION
       The  mesg  utility is invoked by a user to control write access others
       have to the terminal device associated with standard error output.  If
       write  access  is  allowed, then programs such as talk(1) and write(1)
       may display messages on the terminal.

       Traditionally, write access is allowed by default.  However, as  users
       become  more  conscious of various security risks, there is a trend to
       remove write access by default, at least for the primary login  shell.
       To  make  sure your ttys are set the way you want them to be set, mesg
       should be executed in your login scripts.

ARGUMENTS
       n      Disallow messages.

       y      Allow messages to be displayed.

       If no arguments are given, mesg shows the current  message  status  on
       standard error output.

OPTIONS
       -v, --verbose
              Explain what is being done.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXIT STATUS
       The mesg utility exits with one of the following values:

            0     Messages are allowed.

            1     Messages are not allowed.

           >1     An error has occurred.

FILES
       /dev/[pt]ty[pq]?

SEE ALSO
       login(1), talk(1), write(1), wall(1), xterm(1)

HISTORY
       A mesg command appeared in Version 6 AT&T UNIX.

AVAILABILITY
       The  mesg  command  is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                        July 2014                           MESG(1)
