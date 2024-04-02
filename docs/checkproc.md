CHECKPROC(8)                                                                                The SuSE boot concept                                                                                CHECKPROC(8)



NAME
       Checkproc - Checks for a process by full path name
       Pidofproc - Checks for a process by exec base name

SYNOPSIS
       checkproc [-vLkNz] [-x] [-p pid_file] [-i ingnore_file] [-c root] /full/path/to/executable

       checkproc -n [-vk] name_of_kernel_thread

       checkproc    [-vk] [-x] basename_of_executable

       pidofproc [-LkNz] [-x] [-p pid_file] [-i ingnore_file] [-c root] /full/path/to/executable

       pidofproc -n [-k] name_of_kernel_thread

       pidofproc    [-k] [-x] basename_of_executable

SYNOPSIS LSB 3.1
       pidofproc [-p pid_file] /full/path/to/executable

DESCRIPTION
       checkproc checks for running processes that use the specified executable.

       checkproc  does not use the pid to verify a process but the full path of the corresponding program which is used to identify the executable (see proc(5)).  Only if the inode number (/proc/<pid>/exe)
       and the full name are unavailable (/proc/<pid>/cmdline) or if the executable changes its zeroth argument, checkproc uses the base name (/proc/<pid>/stat) to identify the running program.  Note  that
       if the option -n for kernel thread is given only (/proc/<pid>/stat) is used.  For this case a existing symbolic link (/proc/<pid>/exe) indicates that the <pid> is not a kernel thread.

       Extended  functionality  is  provided by the -p pid_file option (former option -f changed due to the LSB specification).  If this option is specified, checkproc tries to check the pid read from this
       file instead of the default (/var/run/<basename>.pid).  The pid read from this file is compared against the pids of the processes that uses the specified binary.  If  the  option  -k  is  specified,
       checkproc  works  like killproc that is that if the if the pid_file does not exist, checkproc assumes that the daemon is not running. It is possible to use a process identity number instead of a pid
       file.

       For the possibility of having two different sessions of one binary program, the option -i ignore_file allows to specify a pid file which pid number is used to ignore all processes  of  corresponding
       process session.

       Note  that  the behaviour above is changed by the option -k.  With this option, the pid read from the pid file is the only used pid (see killproc(8)) and with this option also exit codes like start-
       proc(8) or killproc(8) are used.  Without this option, the pid read from the pid file is used to search the process table for a process with an executable that matches  the  specified  pathname.  In
       order to avoid confusion with stale pid files, a not up-to-date pid will be ignored (see startproc(8)).

       The option -v makes checkproc print out verbose messages.  The same happens if pidofproc LSB variant is used.  This version also accepts also the base name only of a executable.  Note that this dis-
       ables the comparision of the inodes of the executable and the information found within the proc table (see proc(5)).

REQUIRED
       /full/path/to/executable or name_of_kernel_thread
              Specifies the executable which processes should be found, or alternatively, if the option Or alternated, if option -n is used, the  name  of  the  kernel  thread.   This  argument  is  always
              required.

OPTIONS
       -k     This option makes checkproc work like killproc(8) which changes the operation mode, e.g. the exit status of the program will be that of killproc(8).  Without this option, checkproc works like
              startproc (8) and finds all processes with an executable that matches the specified pathname, even if a given pid file (see option -p) isn't up-to-date. Nevertheless it uses its own exit sta-
              tus (see section EXIT CODES).

       -L     This option causes symlinks to be followed, as the like-named option in ls(1).  Note: for the file name the original name of the program is used instead of the name of the symbolic link.

       -p pid_file
              Former  option  -f  changed  due to the LSB specification.)  Use an alternate pid file instead of the default /var/run/<basename>.pid.  If the option -k is specified and the pid_file does not
              exist, checkproc assumes that the daemon is not running.  It is possible to use a process identity number instead of a pid file.

       -i ignore_file
              The pid found in this file is used as session id of the same binary program which should be ignored by checkproc.

       -c root
              Change root directory to root for services which have been started with this option by startproc(8).

       -n     This option indicates that a kernel thread should be checked.  In this case not the executable with its full path name is required but the name of the kernel thread.

       -N     With this option the location of the executable is checked about NFS file system and if true the stat(2) system call is not applied on the exe symbolic link under /proc(5).  Otherwise  check-
              proc  or  pidofproc  could be locked if the corresponding NFS server is currently not online or available.  This implies that the inode number check between the exectuable on the command line
              and the exectuable of the exec symbolic link will be skipped.

       -q     This option is ignored.

       -v     Verbose output.

       -z     This option causes checkproc to see processes even if they are in the zombie state.  Without this option zombies are handled as not existent because such a process isn't alive but  listed  in
              the process table and waits on its parent process.

       -x     Tells checkproc as well as pidofproc to use the upto 15 byte long filename name found in /proc/<pid>/stat to be able to identify scripts overwriting their command line.

EXAMPLE
       checkproc /usr/sbin/sendmail

              returns all pids of running sendmail processes.

       checkproc -p /var/myrun/lpd.pid /usr/sbin/lpd

              returns the command line or the basename of the process pid found in /var/run/lpd.pid.

EXIT CODES
       The exit codes without the option -k have the following LSB conform conditions:

              0    Program is running

              1    No process but pid file found

              3    No process and no pid file found

              4    Program is not installed

            101    Wrong syntax on command line

            102    Other errors

       If the option -k is used checkproc uses exit codes like startproc(8) or killproc(8) do:

              0    Program is running

              1    Generic or unspecified error

              2    Invalid or excess argument(s)

              4    Insufficient privilege(s)

              5    Program is not installed

              7    Program is not running

       in some cases a message is send to standard error or, if no standard error available, syslogd(8) is used.

NOTE
       checkproc  together  with  the  option  -v  just  like pidof(8).  The only difference is the usage of an available pid file.  Only if no usable pid is given with a pid file the process table will be
       scanned.

BUGS
       Identifying a process based on the executable file and the corresponding inode number only works if the process stays alive during startproc's execution. Processes rewriting their zeroth argument or
       shell scripts (the inode number of the shell executable file is not identical to that of the script file) may not be identified by a filename path.

FILES
       /proc/ path to the proc file system (see proc(5)).

       /etc/init.d/
              path to the SuSE boot concept script base directory as required by the Linux Standard  Base  Specification (LSB) (see init.d(7)).

SEE ALSO
       startproc(8), killproc(8), insserv(8), init.d(7), kill(1), skill(1), killall(8), killall5(8), signal(7), proc(5).

COPYRIGHT
       1994-2005 Werner Fink, 1996-2005 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Nov 10, 2000                                                                                    CHECKPROC(8)
