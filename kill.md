KILL(1)                                                                                         User Commands                                                                                         KILL(1)



NAME
       kill - terminate a process

SYNOPSIS
       kill [-s signal|-p] [-q sigval] [-a] [--] pid...
       kill -l [signal]

DESCRIPTION
       The  command  kill  sends the specified signal to the specified process or process group.  If no signal is specified, the TERM signal is sent.  The TERM signal will kill processes which do not catch
       this signal.  For other processes, it may be necessary to use the KILL (9) signal, since this signal cannot be caught.

       Most modern shells have a builtin kill function, with a usage rather similar to that of the command described here.  The '-a' and '-p' options, and the possibility to specify  processes  by  command
       name are a local extension.

       If sig is 0, then no signal is sent, but error checking is still performed.

OPTIONS
       pid... Specify the list of processes that kill should signal.  Each pid can be one of five things:

              n      where n is larger than 0.  The process with pid n will be signaled.

              0      All processes in the current process group are signaled.

              -1     All processes with pid larger than 1 will be signaled.

              -n     where n is larger than 1.  All processes in process group n are signaled.  When an argument of the form '-n' is given, and it is meant to denote a process group, either the signal must
                     be specified first, or the argument must be preceded by a '--' option, otherwise it will be taken as the signal to send.

              commandname
                     All processes invoked using that name will be signaled.

       -s, --signal signal
              Specify the signal to send.  The signal may be given as a signal name or number.

       -l, --list [signal]
              Print a list of signal names, or convert signal given as argument to a name.  The signals are found in /usr/include/linux/signal.h

       -L, --table
              Similar to -l, but will print signal names and their corresponding numbers.

       -a, --all
              Do not restrict the commandname-to-pid conversion to processes with the same uid as the present process.

       -p, --pid
              Specify that kill should only print the process id (pid) of the named processes, and not send any signals.

       -q, --queue sigval
              Use sigqueue(2) rather than kill(2) and the sigval argument is used to specify an integer to be sent with the signal.  If the receiving process has installed a handler for this  signal  using
              the SA_SIGINFO flag to sigaction(2), then it can obtain this data via the si_value field of the siginfo_t structure.

NOTES
       It is not possible to send a signal to explicitly selected thread in a multithreaded process by kill(2) syscall.  If kill(2) is used to send a signal to a thread group, then kernel selects arbitrary
       member of the thread group that has not blocked the signal.  For more details see clone(2) CLONE_THREAD description.

       The command kill(1) as well as syscall kill(2) accepts TID (thread ID, see gettid(2)) as argument.  In this case the kill behavior is not changed and the signal is also delivered to the thread group
       rather than to the specified thread.

SEE ALSO
       bash(1), tcsh(1), kill(2), sigvec(2), signal(7)

AUTHOR
       Taken from BSD 4.4.  The ability to translate process names to process ids was added by Salvatore Valente ⟨svalente@mit.edu⟩.

AVAILABILITY
       The kill command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        March 2013                                                                                          KILL(1)
