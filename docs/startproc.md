STARTPROC(8)                                                                                The SuSE boot concept                                                                                STARTPROC(8)



NAME
       Startproc - Start processes identified by path name
       Start_daemon - Start processes identified by path name

SYNOPSIS
       startproc [-fLves] [-x] [[-n ]-<prio>] [-o c<class>,n<data>] [-(t|T) <sec>] [-u user] [-g group] [-l log_file|-q|-d] [-p pid_file] [-i ignore_file] [-c root] [-(w|W <file list>)] /path/to/executable
              [arguments for executable]

       start_daemon [-fLve] [-x] [-n +/-<prio>] [-o c<class>,n<data>] [-u user] [-g group] [-l log_file|-q|-d] [-p pid_file] [-i ignore_file] [-c root] /path/to/executable [arguments for executable]

SYNOPSIS LSB 3.1
       start_daemon [-f] [-n +/-<prio>] /path/to/executable [arguments for executable]

DESCRIPTION
       startproc and the LSB variant start_daemon check for all processes of the specified executable and starts it if no processes are found. Note that startproc is designed to start a daemon  but  not  a
       kernel thread or a program which enables a kernel thread.

       Without  any  option  startproc does search for a process by using the full path of the corresponding program and a default pid file (/var/run/<basename>.pid) which are used together to identify the
       executable out from the /proc file system (see proc(5)).  Only if the inode number (/proc/<pid>/exe) and the full name are unavailable (/proc/<pid>/cmdline) or if the executable changes  its  zeroth
       argument, startproc uses the base name (/proc/<pid>/stat) to identify the running program.

       Extended  functionality  is  provided  by the -p option (former option -f changed due to the LSB specification).  If this option is specified, startproc tries to check against the pid read from this
       file instead of the default pid file (/var/run/<basename>.pid).  The pid read from this file is compared against the pids of possible running processes that use the specified executable. In order to
       avoid confusion with stale pid files, a not up-to-date pid will be ignored.

       For  the  possibility of having two different sessions of one binary program, the option -i ignore_file allows to specify a pid file which pid number is used to ignore all processes of corresponding
       process session.

       The option -v makes startproc print out verbose diagnostics.

       The start_daemon does not support the options -(t|T) <sec> nor -(w|W <file list>) for waiting for success and the option -s for a new session as this variant does not fork to start the executable.

REQUIRED
       /path/to/executable
              Specifies the executable by its full path name. This argument is always required. Everything that follows this path is considered options for the executable to be launched.  Further  informa-
              tion can be obtained from the respective manpage(s).

OPTIONS
       [-n ]+/-<prio>
              Set  the  nice level for the process. If used, this option should always be the first in the command line.  The nice level <prio> may be specified in the range between -20 and +20.  Only root
              is allowed to set negative nice values.

       -o c<class>,n<data>
              Set the io scheduling class and priority. If used, this option requires the class identifier c and the class number to use:  0 for none, 1 for realtime, 2 for best-effort,  3  for  idle.  The
              scheduling  class  data can be appended with the identifier n.  This only has an effect if the choosen class accepts an argument.  For the classes realtime and best-effort, 0 upto 7 are valid
              data numbers, with lower number being higher priority.

       -e     Bequeath only a minimal set of environment variables to the new process: HOME, PATH, SHELL, LISTEN_PID, LISTEN_FDS, RUNLEVEL, and PREVLEVEL.

       -p pid_file
              (Former option -f changed due to the LSB specification.)  Use an alternate pid file instead of the default (/var/run/<basename>.pid).  The pid read from this file is being matched against the
              pid  of running processes that have an executable with specified path.  In order to avoid confusion with stale pid files, a not up-to-date pid will be ignored.  Obviously this option does not
              work if option -f is specified.

       -i ignore_file
              The pid found in this file is used as session id of the same binary program which should be ignored by startproc.  Obviously this option does not work if option -f is specified.

       -f     This option is required by the Linux Standard Base Specification (LSB).  With this option the start of a process is forced.

       -g group
              Sets the group ID of the process to gid.

       -l log_file
              Redirect the process standard output and standard error to the file log_file.

       -L     This option causes symlinks to be followed, as the like-named option in ls(1).  BR Note : for the file name the original name of the program is used instead of the name of the symbolic link.

       -c root
              Change root directory to root.  Services which have been started with this option can only be checked by checkproc(8) and signaled by killproc(8) if checkproc(8) and  killproc(8)  are  called
              with the same option argument for the option -c.

       -q     Equals to -l /dev/null (supresses output).

       -d     Let startproc expect that the started service will do a dialog by prompting for, e.g. a passphrase.  This option implies a timeout of 15 seconds (-t 15).

       -s     Starts the process in a new session. The new task is a process group leader and has no controlling tty.

       -t <sec>
              The  number of seconds to wait after the successful start of a service.  This options accepts the number of seconds to wait.  You can specify some units after a given number: s for seconds, m
              for minutes, and h for hours to wait.

       -T <sec>
              The same as for option -t but wait only on the started process not on childs forked by the process.

       -w     Wait the first started process to terminate before returning.  If the parent process of the daemon does not finish also startproc(8) does not finish.

       -W <file list>
              Wait on the provided file or list of files separated with colons.  If the files will not be created startproc(8) does not finish.

       -u user
              Sets the user ID of the process to user.

       -v     Verbose output.

       -x     Tells startproc as well as start_daemon to use the upto 15 byte long filename name found in /proc/<pid>/stat to be able to identify scripts overwriting their command line.

EXAMPLE
       startproc /usr/sbin/sendmail

              starts /usr/sbin/sendmail if no sendmail process is found. If a pid file sendmail.pid exists in /var/run/, then the pid found in this file is used to search the process table  for  a  process
              with an executable that matches the specified pathname, /usr/sbin/sendmail.  If no matching process is found, /usr/sbin/sendmail is launched.

       startproc -p /var/myrun/lpd.pid /usr/sbin/lpd

              starts /usr/sbin/lpd if there is no process with the pid found in /var/myrun/lpd.pid and no process in the actual process table exists that uses the specified binary.

EXIT CODES
       The exit codes have the following LSB conform conditions:

              0    Success

              1    Generic or unspecified error

              2    Invalid or excess argument(s)

              4    Insufficient privilege(s)

              5    Program is not installed

              7    Program is not running

       In some error cases, diagnostic output is sent to standard error, or, if standard error is not available, syslogd(8) is being used.

NOTE
       startproc  is  a  replacement for the Bourne shell function daemon found in the widely used SysVinit package of Miquel van Smoorenburg, <miquels@cistron.nl>.  startproc is not useful to start kernel
       threads. This should be done by service utilities designed for the purpose to accomplish this task.

BUGS
       Identifying a process based on the executable file and the corresponding inode number only works if the process stays alive during startproc's execution. Processes rewriting their zeroth argument or
       shell scripts (the inode number of the shell executable file is not identical to that of the script file) may not be identified by a filename path.

       Startproc  does  not start a process if there already exists one being in the zombie state.  Zombies are processes which arn't alive but listed in the process table to have the exit status ready for
       the corresponding parent processes.  Therefore the parent processes should be check out.

       Start_daemon is not able to check for exit status of an executable daemon because after the final execve(3) the start_daemon as an own process does not exit anymore.

FILES
       /proc/ path to the proc file system (see proc(5)).

       /etc/init.d/
              path to the SuSE boot concept script base directory as required by the Linux Standard  Base  Specification (LSB) (see init.d(7)).

SEE ALSO
       checkproc(8), killproc(8), insserv(8), init.d(7), kill(1), skill(1), killall(8), killall5(8), signal(7), proc(5).

COPYRIGHT
       1994-2007 Werner Fink, 1996-2000 SuSE GmbH Nuernberg, Germany.  2007 SuSE LINUX Products GmbH, Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Nov 30, 2007                                                                                    STARTPROC(8)
