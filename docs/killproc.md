KILLPROC(8)                                                                                 The SuSE boot concept                                                                                 KILLPROC(8)



NAME
       Killproc - Send signals to processes by full path name

SYNOPSIS
       killproc [-vqLN] [-g|-G] [-x] [-p pid_file] [-i ingnore_file] [-c root] [-t <sec>] [-<SIG>] /full/path/to/executable

       killproc -n [-vq] [-g|-G] [-t <sec>] [-<SIG>] name_of_kernel_thread

       killproc    [-vq] [-g|-G] [-t <sec>] [-<SIG>] basename_of_executable

       killproc -l

SYNOPSIS LSB 3.1
       killproc [-p pid_file] /full/path/to/executable [-<SIG>]

DESCRIPTION
       killproc  sends  signals  to  all  processes that use the specified executable.  If no signal name is specified, the signal SIGTERM is sent. If this program is not called with the name killproc then
       SIGHUP is used. Note that if no signal is specified on the command line and the program killproc can not terminate a process with the default SIGTERM the signal SIGKILL is send after a  few  seconds
       (default is 5 seconds, see option -t).  If a program has been terminated successfully and a verified pid file was found, this pid file will be removed if the terminated process didn't already do so.

       killproc  does  not  use  the  pid  to  send  a  signal  to  a  process  but  the full path of the corresponding program which is used to identify the executable (see proc(5)).  Only if inode number
       (/proc/<pid>/exe) and full path name of the executable (/proc/<pid>/cmdline) are unavailable or if the executable has changed its zeroth argument, killproc uses the base name  (/proc/<pid>/stat)  to
       identify  the  running  program. Note that if the option -n for kernel thread is given, only (/proc/<pid>/stat) is used.  For this case an existing symbolic link (/proc/<pid>/exe) indicates that the
       <pid> is not a kernel thread.

       The last variant of the killproc call is only with the basename of the executable.  This is required by the Linux Standard Base Specification (LSB).  Note that this disables the comparision  of  the
       inodes of the executable and the information found within the proc table (see proc(5)).  This implies that if no pid file is found it may happens that programs or script with the same base name will
       killed instead.  killproc tries to determine the pid of its parent and pid of the parent of its parent to not to kill those two processes.

       Extended functionality is provided by the -p pid_file option (former option -f changed due to the LSB specification).  If this option is specified, killproc tries to send the signal to the pid  read
       from  this  file  instead  of  from the default pid file (/var/run/<basename>.pid).  If the pid_file does not exist, killproc assumes that the daemon is not running.  It is possible to use a process
       identity number instead of a pid file.

       For the possibility of having two different sessions of one binary program, the option -i ignore_file allows to specify a pid file which pid number is used to ignore all processes  of  corresponding
       process session.

       The  option  -v  turns on verbosity about which signal is being sent.  The option -q is ignored for compatibility with older versions.  If the option -G is used, the signal will not only sent to the
       running executable, but also to all members of the session that the specified executable leads. Whereas the option -g the signal sends to the group including the executable.  If unsure use -G.

REQUIRED
       /full/path/to/executable or name_of_kernel_thread
              Specifies the executable to which the signal should be sent, or alternatively, if the option -n is used, the name of the kernel thread. This argument is always required.

OPTIONS
       -G     Sends the signal to all session followers (children) of the identified process.

       -g     Sends the signal to all members of the session including the identified process.  Note that usually the option -G should be used.

       -L     This option causes symlinks to be followed, as the like-named option in ls(1).  Note: for the file name the original name of the program is used instead of the name of the symbolic link.

       -p pid_file
              (Former option -f changed due to the LSB specification.)  Use an alternate pid file instead of the default (/var/run/<basename>.pid).  If the pid_file does not exist,  killproc  assumes  that
              the daemon is not running.  It is possible to use a process identity number instead of a pid file.

       -i ignore_file
              The pid found in this file is used as session id of the same binary program which should be ignored by killproc.

       -c root
              Change root directory to root for services which have been started with this option by startproc(8).

       -n     This option indicates that a kernel thread should be signaled.  In this case not the executable with its full path name is required but the name of the kernel thread.

       -N     With  this  option the location of the executable is checked about NFS file system and if true the stat(2) system call is not applied on the exe symbolic link under /proc(5).  Otherwise kill-
              proc could be locked if the corresponding NFS server is currently not online or available.  This implies that the inode number check between the exectuable on the command line and the exectu-
              able of the exec symbolic link will be skipped.

       -<SIG> Signals  can be specified either by name (e.g. -HUP, -SIGHUP) or by number (e.g. -1).

       -t<sec>
              The  number  <sec>  specifies  the seconds to wait between the default signal SIGTERM and the subsequentially signal SIGKILL if the first SIGTERM does not show any result within the first few
              milli seconds.  This timeout defaults to 5 seconds.  On the other hand if the signal SIGTERM was  explicitly used on the command line, the signal SIGKILL will be omitted, even if the  process
              was not terminated after the timeout has expired.

       -q     This option is ignored.

       -v     Be more verbose.

       -l     This option list all available signals and some of their synonyms by their number and signal names to standard out.  and exits.

       -x     Tells killproc to use the upto 15 byte long filename name found in /proc/<pid>/stat to be able to identify scripts overwriting their command line.

EXAMPLES
       killproc -TERM /usr/sbin/sendmail

              sends the signal SIGTERM to the running sendmail process. If a pid file sendmail.pid exists in /var/run/ then the pid from this file is being used after verification to terminate the sendmail
              process.  Other running processes are ignored.

       killproc -p /var/myrun/lpd.pid /usr/sbin/lpd

              sends the signal SIGTERM to the pid found in /var/myrun/lpd.pid if and only if this pid belongs to /usr/sbin/lpd.  If the named /var/myrun/lpd.pid does not exist, killproc  assumes  that  the
              daemon  of /usr/sbin/lpd is not running.  The exit status is set to 0 for successfully delivering the default signals SIGTERM and SIGKILL otherwise to 7 if the program was not running.  It is
              also successful if no signal was specified and no program was there for Termination because it is already terminated.

EXIT CODES
       The exit codes have the following LSB conform conditions:

              0    Success or program was not running (no signal specified)

              1    Generic or unspecified error

              2    Invalid or excess argument(s)

              4    Insufficient privilege(s)

              5    Program is not installed

              7    Program was not running to receive the specified signal

       In some error cases, diagnostic output is sent to standard error, or, if standard error is not available, syslogd(8) is being used.

NOTE
       killproc is a replacment for the Bourne shell function killproc found in the widely used SysVinit package of Miquel van Smoorenburg, <miquels@cistron.nl>.

BUGS
       Identifying a process based on the executable file and the corresponding inode number only works if the process stays alive during killproc's execution. Impure executables like  shell  scripts  (the
       inode number of the shell is not identical to that of the script) and programs rewriting their zeroth argument may not be identified by a file name.

       Killproc isn't able to signal processes being in the zombie state. Zombies are processes which  arn't alive but listed in the process table to have the exit status ready for the corresponding parent
       processes.

FILES
       /proc/ path to the proc file system (see proc(5)).

       /etc/init.d/
              path to the SuSE boot concept script base directory as required by the Linux Standard  Base  Specification (LSB) (see init.d(7)).

SEE ALSO
       startproc(8), checkproc(8), insserv(8), init.d(7), kill(1), skill(1), killall(8), killall5(8), signal(7), proc(5).

COPYRIGHT
       1994-2005 Werner Fink, 1996-2005 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Nov 10, 2000                                                                                     KILLPROC(8)
