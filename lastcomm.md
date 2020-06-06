LASTCOMM(1)                                                                                General Commands Manual                                                                                LASTCOMM(1)



NAME
       lastcomm -  print out information about previously executed commands.

SYNOPSIS
       lastcomm
              [ command-name ...  ]
              [ user-name ...  ]
              [ terminal-name ...  ]
              [ OPTION ... ]

DESCRIPTION
       lastcomm  prints out information about previously executed commands.  If no arguments are specified, lastcomm will print info about all of the commands in acct (the record file).  If called with one
       or more of command-name, user-name, or terminal-name, only records containing those items will be displayed.  For example, to find out which users used command `a.out' and which  users  were  logged
       into `tty0', type:
                                                                                                lastcomm a.out tty0

       This  will  print  any  entry for which `a.out' or `tty0' matches in any of the record's fields (command, name, or terminal).  If you want to find only items that match *all* of the arguments on the
       command line, you must use the '-strict-match' option.  For example, to list all of the executions of command a.out by user root on terminal tty0, type:
                                                                           lastcomm --strict-match --command a.out --user root --tty tty0

       The order of the arguments is not important.

       For each entry the following information is printed:
          + command name of the process
          + flags, as recorded by the system accounting routines:
               S -- command executed by super-user
               F -- command executed after a fork but without a following exec
               C -- command run in PDP-11 compatibility mode (VAX only)
               D -- command terminated with the generation of a core file
               X -- command was terminated with the signal SIGTERM
          + the name of the user who ran the process
          + time the process started

OPTIONS
       --strict-match
              Print only entries that match *all* of the arguments on the command line.
       --print-controls
              Print control characters.
       --user name
              List records for user with name.  This is useful if you're trying to match a username that happens to be the same as a command (e.g., ed ).
       --command name
              List records for command name.
       --tty name
              List records for tty name.
       --forwards
              Read file forwards instead of backwards. This avoids trying to seek on the file and can be used to read from a pipe. This must be specified prior to any -f arguments.
       -f filename, --file filename
              Read from the file filename instead of acct.  A filename of "-" will result in reading from stdin. This must either be the first -f option, or --forwards must precede all -f options.
       --ahz hz
              Use this flag to tell the program what AHZ should be (in hertz).  This option is useful if you are trying to view an acct file created on another machine which has the  same  byte  order  and
              file format as your current machine, but has a different value for AHZ.
       -p, --show-paging
              Print paging statistics.
       --pid  Show PID and PPID of the process if acct version 3 format is supported by kernel.
       --debug
              Print verbose internal information.
       -V, --version
              Print the version number of lastcomm.
       -h, --help
              Prints the usage string and default locations of system files to standard output and exits.

FILES
       acct
              The system wide process accounting file. See acct(5) (or pacct(5)) for further details.  /var/log/account
                     This directory contains pacct files which contain the binary process accounting data as written by the kernel.
AUTHOR
       The GNU accounting utilities were written by Noel Cragg <noel@gnu.ai.mit.edu>. The man page was adapted from the accounting texinfo page by Susan Kleinmann <sgk@sgk.tiac.net>.
SEE ALSO
       last(1), acct(5)




                                                                                               1995 October 31                                                                                    LASTCOMM(1)
