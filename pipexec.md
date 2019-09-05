pipexec(1)                                                         User Commands                                                        pipexec(1)

NAME
       pipexec - create a directed graph of processes and pipes

SYNOPSIS
       pipexec [OPTION]... [PROCESS DESCRIPTION]... [PIPE DESCRIPTION]...

DESCRIPTION
       pipexec  creates  an  arbitrary  network  (directed  graph) of processes and pipes in between - even cycles are possible.  It overcomes the
       shortcomings of shells that are typically only able to create non cyclic trees.

       pipexec also monitors all it's child processes and is able to restart the whole network of processes and pipes if one  crashes.   Therefore
       pipexec can be used in SYSV-init or systemd configuration to run a network of processes.

OPTIONS
       -h     print help and version information

       -l logfd
              use the given file descriptor for logging.  If a 's' is specified, syslog is used.  Example: Specifying '2' means log to stderr.

       -p pidfile
              with pipexec it is possible to handle pipes within SYSV-init scripts.  In some environments (e.g. RHEL6, Debian7) the start and stop
              routines need a pid file.  If this option is given, pipexec writes its own pid into the file shortly after start of pipexec.

       -k     if one sub-process (child) gets killed and this options is given, all other sub-processes are also killed.  Afterwards all processes
              are restarted.

       -s sleep_time
              the time interval in seconds before a restart.  This option makes only sense when also the '-k' option is specified.

BACKGROUND
       Inside a shell it is possible to start processes and redirect the output to other processes.

       Example:
           cat Chap1.txt Chap2.txt | grep bird | wc -l

       Three processes are created: the standard output (file descriptor (fd) 1) of the 'cat' process is connected to the standard input (fd 0) of
       the 'grep' command, and the standard output of the 'grep' command is connected to the standard input (fd 0) of the 'wc' process.

       Please note that the assignment between names and file descriptor number is pure historical and has no technical background.

       Example:
           find / 1> >(grep .txt) 2> >(wc >/tmp/w.log)

       In this more complex example, the fd 1 of the 'find' process is connected to fd 0 of 'grep' and fd 2 is connected to fd 0 of 'wc'.

       The limitation using this way of specifying processes and pipes is, that it is not possible to have any cycles.  It is impossible  to  e.g.
       pass a fd of 'wc' either to 'grep' or to 'find'.

       pipexec overcomes these limitations.  It makes it possible to link any two arbitrary file descriptors in a set of processes.

USAGE
       When building up a network of processes and pipes, there is the need to specify each element separately.

       The  processes  will  be  the  nodes  in the network (directed graph), the connections of the file descriptors between to processes are the
       edges.  Each node (process) has a unique name assigned to it.  This makes it possible to differentiate between using the same command  more
       than once.

       The format of specifying a process is
           [ NAME /path/to/command arg1 arg2 ... argN ]

       The  first parameter 'NAME' must be a unique name.  The second parameter must be the full path of the command to execute.  Please note that
       always the full path must be specified, there is no PATH environment variable handling (execv(2) is used internally to span new processes).
       The following parameters are the parameters passed to the command.

       The  whole  definition must be enclosed in square brackets.  The square brackets must be given separately - before and after them must be a
       space.

       The format of specifying a pipe between processes is
           {NAME_1:FD1>NAME_2:FD2}

       Example
           {LS:1>GREP:0}

       The names are the names of the processes, the numbers are the number of the file descriptor that should  be  used  to  build  the  pipe  in
       between.  When using pipexec from a shell (like bash) there is the need to escape the brackets or use quotation marks.

EXAMPLES
       The shell command
           cat Chap1.txt Chap2.txt | grep bird | wc -l

       is equivalent to
           pipexec [ CAT /bin/cat Chap1.txt Chap2.txt ] \
             [ GREP /usr/bin/grep bird ] [ WC /usr/bin/wc -l ] \
             "{CAT:1>GREP:0}" "{GREP:1>WC:0}"

       The pipexec equivalent is longer and more complex in this example.  But pipexec can build cycles that are impossible within a shell:
           pipexec [ A /bin/cmd1 ] [ B /bin/cmd2 ] "{A:1>B:0}" "{B:1>A:0}"

       For more examples see the ptee(1) and peet(1) man pages.

SEE ALSO
       bash(1), ptee(1), peet(1), execv(2)

AUTHOR
       Written by Andreas Florath (andreas@florath.net)

COPYRIGHT
       Copyright © 2015 by Andreas Florath (andreas@florath.net).  License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>.

User Commands                                                       2015-03-14                                                          pipexec(1)
