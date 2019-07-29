NTPTIME(8)                                                    System Manager's Manual                                                   NTPTIME(8)

NAME
       ntptime - read kernel time variables

SYNOPSIS
       ntptime [ -chr ] [ -e est_error ] [ -f frequency ] [ -m max_error ] [ -o offset ] [ -s status ] [ -t time_constant ]

DESCRIPTION
       This  program  is  useful  only  with special kernels described in the A Kernel Model for Precision Timekeeping page. It reads and displays
       time-related kernel variables using the ntp_gettime() system call. A similar display can be obtained using the ntpdc program  and  kerninfo
       command.

OPTIONS
       -c     Display the execution time of ntptime itself.

       -e est_error
              Specify estimated error, in microseconds.

       -f frequency
              Specify frequency offset, in parts per million.

       -h     Display help information.

       -m max_error
              Specify max possible errors, in microseconds.

       -o offset
              Specify clock offset, in microseconds.

       -r     Display Unix and NTP times in raw format.

       -s status
              Specify clock status. Better know what you are doing.

       -t time_constant
              Specify time constant, an integer in the range 0-10.

Network Time Protocol                                             October 7, 2006                                                       NTPTIME(8)
