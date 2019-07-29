SETSID(1)                       User Commands                       SETSID(1)

NAME
       setsid - run a program in a new session

SYNOPSIS
       setsid [options] program [arguments]

DESCRIPTION
       setsid  runs  a program in a new session. The command calls fork(2) if
       already a process group leader. Otherwise, it executes  a  program  in
       the current process.

OPTIONS
       -c, --ctty
              Set the controlling terminal to the current one.

       -w, --wait
              Wait  for  the  execution of the program to end, and return the
              exit value of this program as the return value of setsid.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

SEE ALSO
       setsid(2)

AUTHOR
       Rick Sladkey <jrs@world.std.com>

AVAILABILITY
       The setsid command is part of the util-linux package and is  available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                        July 2014                         SETSID(1)
