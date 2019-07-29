UNHIDE(8)                                                     System Manager's Manual                                                    UNHIDE(8)

NAME
       unhide — forensic tool to find hidden processes

SYNOPSIS
       unhide [OPTIONS] TEST_LIST
       unhide-posix proc | sys

DESCRIPTION
       unhide  is  a forensic tool to find processes hidden by rootkits, Linux kernel modules or by other techniques.  It detects hidden processes
       using six techniques.

OPTIONS
       Options are only available for unhide-linux not for unhide-posix.

       -d     Do a double check in brute test to avoid false positive.

       -f     Write a log file (unhide-linux.log) in the current directory.

       -h     Display help

       -m     Do more checks. As of 2012-03-17 version, this option has only effect for the procfs, procall, checkopendir and checkchdir tests.
              Implies -v

       -r     Use alternate version of sysinfo check in standard tests

       -V     Show version and exit

       -v     Be verbose, display warning message (default : don't display).  This option may be repeated more than once.

TEST_LIST
       The checks to do consist of one or more of the following tests.
       The standard tests are the aggregation of one or more elementary test(s).

       Standard tests :

       The brute technique consists of bruteforcing the all process IDs.
       This technique is only available with version unhide-linux.

       The proc technique consists of comparing /proc with the output of /bin/ps.

       The procall technique combinates proc and procfs tests.
       This technique is only available with version unhide-linux.

       The procfs technique consists of comparing information gathered from /bin/ps with information gathered by walking in the procfs.
       With -m option, this test makes more checks, see checkchdir test.
       This technique is only available with version unhide-linux.

       The quick technique combines the proc, procfs and sys techniques in a quick way. It's about 20 times faster but may give more  false  posi‐
       tives.
       This technique is only available with version unhide-linux.

       The reverse technique consists of verifying that all threads seen by ps are also seen in procfs and by system calls. It is intended to ver‐
       ify that a rootkit has not killed a security tool (IDS or other) and make ps showing a fake process instead.
       This technique is only available with version unhide-linux.

       The sys technique consists of comparing information gathered from /bin/ps with information gathered from system calls.

       Elementary tests :

       The checkbrute technique consists of bruteforcing the all process IDs.
       This technique is only available with version unhide-linux.

       The checkchdir technique consists of comparing information gathered from /bin/ps with information gathered by making chdir() in the procfs.
       With the -m option, it also verify that the thread appears in its "leader process" threads list.
       This technique is only available with version unhide-linux.

       The checkgetaffinity technique consists of comparing information gathered from /bin/ps with the result of call to  the  sched_getaffinity()
       system function.
       This technique is only available with version unhide-linux.

       The  checkgetparam technique consists of comparing information gathered from /bin/ps with the result of call to the sched_getparam() system
       function.
       This technique is only available with version unhide-linux.

       The checkgetpgid technique consists of comparing information gathered from /bin/ps with the result of call to the  getpgid()  system  func‐
       tion.
       This technique is only available with version unhide-linux.

       The  checkgetprio  technique  consists  of  comparing information gathered from /bin/ps with the result of call to the getpriority() system
       function.
       This technique is only available with version unhide-linux.

       The checkRRgetinterval technique consists of comparing information gathered from /bin/ps with the result of call to the sched_rr_get_inter‐
       val() system function.
       This technique is only available with version unhide-linux.

       The  checkgetsched  technique  consists  of comparing information gathered from /bin/ps with the result of call to the sched_getscheduler()
       system function.
       This technique is only available with version unhide-linux.

       The checkgetsid technique consists of comparing information gathered from /bin/ps with the result of call to the getsid() system function.
       This technique is only available with version unhide-linux.

       The checkkill technique consists of comparing information gathered from /bin/ps with the result of call to the kill() system function.
       Note : no process is really killed by this test.
       This technique is only available with version unhide-linux.

       The checknoprocps technique consists of comparing the result of the call to each of the system functions. No  comparison  is  done  against
       /proc or the output of ps.
       This technique is only available with version unhide-linux.

       The  checkopendir  technique  consists  of comparing information gathered from /bin/ps with information gathered by making opendir() in the
       procfs.
       This technique is only available with version unhide-linux.

       The checkproc technique consists of comparing /proc with the output of /bin/ps.
       This technique is only available with version unhide-linux.

       The checkquick technique combines the proc, procfs and sys techniques in a quick way. It's about 20 times faster but may  give  more  false
       positives.
       This technique is only available with version unhide-linux.

       The  checkreaddir  technique consists of comparing information gathered from /bin/ps with information gathered by making readdir() in /proc
       and /proc/pid/task.
       This technique is only available with version unhide-linux.

       The checkreverse technique consists of verifying that all threads seen by ps are also seen in procfs and by system calls. It is intended to
       verify that a rootkit has not killed a security tool (IDS or other) and make ps showing a fake process instead.
       This technique is only available with version unhide-linux.

       The  checksysinfo  technique  consists  of  comparing the number of process seen by /bin/ps with information obtained from sysinfo() system
       call.
       This technique is only available with version unhide-linux.

       The checksysinfo2 technique is an alternate version of checksysinfo test.  It might (or not) work better on kernel patched for RT,  preempt
       or latency and with kernel that don't use the standard scheduler.
       It's also invoked by standard tests when using the -r option
       This technique is only available with version unhide-linux.

   Exit status:
       0      if OK,

       1      if a hidden or fake thread is found.

EXAMPLES
       Quicker test:
              unhide quick

       Quick test:
              unhide quick reverse

       Standard test:
              unhide sys proc

       Deeper test:
              unhide -m -d sys procall brute reverse

BUGS
       Report unhide bugs on the bug tracker on sourceforge (http://sourceforge.net/projects/unhide/)
       With  recent versions of Linux kernel (> 2.6.33), the sysinfo test may report false positives.  It may be due to optimization in the sched‐
       uler, the use of cgroup or even the use of systemd.  The use of the PREEMPT-RT patch amplifies the occurence of the problem.  This is  cur‐
       rently under investigation.

SEE ALSO
       unhide-tcp (8).

AUTHOR
       This  manual  page  was written by Francois Marier francois@debian.org and Patrick Gouin.  Permission is granted to copy, distribute and/or
       modify this document under the terms of the GNU General Public License, Version 3 or any later version published by the Free Software Foun‐
       dation.

LICENSE
       License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

Administration commands                                             March 2012                                                           UNHIDE(8)
