tickadj(8)                                                                                 System Manager's Manual                                                                                 tickadj(8)



NAME
       tickadj - set time-related kernel variables


SYNOPSIS
       tickadj [ tick ]

       tickadj [ -Aqs ] [ -a tickadj ] [ -t tick ]


DESCRIPTION
       The  tickadj  program  reads, and optionally modifies, several timekeeping-related variables in older kernels that do not have support for precision ttimekeeping, including HP-UX, SunOS, Ultrix, SGI
       and probably others. Those machines provide means to patch the kernel /dev/kmem. Newer machines with kernel time support, including Solaris, Tru64, FreeBSD and Linux, should  NOT  use  the  program,
       even if it appears to work, as it will destabilize the kernel time support. Use the ntptime program instead.

       The particular variables that can be changed with tickadj include tick, which is the number of microseconds added to the system time for a clock interrupt, tickadj, which sets the slew rate and res‐
       olution used by the adjtime system call, and dosynctodr, which indicates to the kernels on some machines whether they should internally adjust the system clock to keep it in  line  with  time-of-day
       clock or not.

       On Linux, only the tick variable is supported and the only allowed argument is the tick value.

       By  default,  with  no arguments, tickadj reads the variables of interest in the kernel and displays them. At the same time, it determines an "optimal" value for the value of the tickadj variable if
       the intent is to run the ntpd Network Time Protocol (NTP) daemon, and prints this as well. Since the operation of tickadj when reading the kernel mimics the operation of similar parts  of  the  ntpd
       program fairly closely, this can be useful when debugging problems with ntpd.

       Note  that  tickadj should be run with some caution when being used for the first time on different types of machines. The operations which tickadj tries to perform are not guaranteed to work on all
       Unix machines and may in rare cases cause the kernel to crash.


COMMAND LINE OPTIONS
       -a tickadj
               Set the kernel variable tickadj to the value tickadjspecified.

       -A      Set the kernel variable tickadj to an internally computed "optimal" value.

       -t tick Set the kernel variable tick to the value tick specified.

       -s      Set the kernel variable dosynctodr to zero, which disables the hardware time-of-year clock, a prerequisite for running the ntpd daemon under SunOS 4.x.

       -q      Normally, tickadj is quite verbose about what it is doing. The -q flag tells it to shut up about everything except errors.


FILES
       /vmunix /unix /dev/kmem


BUGS
       Fiddling with kernel variables at run time as a part of ordinary operations is a hideous practice which is only necessary to make up for deficiencies in the implementation of adjtime in many kernels
       and/or brokenness of the system clock in some vendors' kernels. It would be much better if the kernels were fixed and the tickadj program went away.

SEE ALSO
       ntpd(8)

       The official HTML documentation.

       This file was automatically generated from HTML source.




                                                                                                                                                                                                   tickadj(8)
