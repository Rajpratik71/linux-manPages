MPSTAT(1)                                                       Linux User's Manual                                                      MPSTAT(1)

NAME
       mpstat - Report processors related statistics.

SYNOPSIS
       mpstat [ -A ] [ -u ] [ -V ] [ -I { keyword [,...] | ALL } ] [ -P { cpu [,...] | ON | ALL } ] [ interval [ count ] ]

DESCRIPTION
       The  mpstat  command  writes  to  standard output activities for each available processor, processor 0 being the first one.  Global average
       activities among all processors are also reported.  The mpstat command can be used both on SMP and UP machines, but  in  the  latter,  only
       global average activities will be printed. If no activity has been selected, then the default report is the CPU utilization report.

       The  interval parameter specifies the amount of time in seconds between each report.  A value of 0 (or no parameters at all) indicates that
       processors statistics are to be reported for the time since system startup (boot).  The count parameter can  be  specified  in  conjunction
       with  the interval parameter if this one is not set to zero. The value of count determines the number of reports generated at interval sec‐
       onds apart. If the interval parameter is specified without the count parameter, the mpstat command generates reports continuously.

OPTIONS
       -A     This option is equivalent to specifying -u -I ALL -P ALL

       -I { keyword [,...] | ALL }
              Report interrupts statistics.

              Possible keywords are SUM, CPU and SCPU.

              With the SUM keyword, the mpstat command reports the total number of interrupts per processor.  The following values are displayed:

              CPU
                     Processor number. The keyword all indicates that statistics are calculated as averages among all processors.

              intr/s
                     Show the total number of interrupts received per second by the CPU or CPUs.

              With the CPU keyword, the number of each individual interrupt received per second by the CPU or CPUs is  displayed.  Interrupts  are
              those listed in /proc/interrupts file.

              With  the  SCPU  keyword, the number of each individual software interrupt received per second by the CPU or CPUs is displayed. This
              option works only with kernels 2.6.31 and later. Software interrupts are those listed in /proc/softirqs file.

              The ALL keyword is equivalent to specifying all the keywords above and therefore all the interrupts statistics are displayed.

       -P { cpu [,...] | ON | ALL }
              Indicate the processor number for which statistics are to be reported.  cpu is the processor number. Note that processor  0  is  the
              first  processor.   The  ON keyword indicates that statistics are to be reported for every online processor, whereas the ALL keyword
              indicates that statistics are to be reported for all processors.

       -u     Report CPU utilization. The following values are displayed:

              CPU
                     Processor number. The keyword all indicates that statistics are calculated as averages among all processors.

              %usr
                     Show the percentage of CPU utilization that occurred while executing at the user level (application).

              %nice
                     Show the percentage of CPU utilization that occurred while executing at the user level with nice priority.

              %sys
                     Show the percentage of CPU utilization that occurred while executing at the system level (kernel). Note that  this  does  not
                     include time spent servicing hardware and software interrupts.

              %iowait
                     Show the percentage of time that the CPU or CPUs were idle during which the system had an outstanding disk I/O request.

              %irq
                     Show the percentage of time spent by the CPU or CPUs to service hardware interrupts.

              %soft
                     Show the percentage of time spent by the CPU or CPUs to service software interrupts.

              %steal
                     Show  the  percentage of time spent in involuntary wait by the virtual CPU or CPUs while the hypervisor was servicing another
                     virtual processor.

              %guest
                     Show the percentage of time spent by the CPU or CPUs to run a virtual processor.

              %gnice
                     Show the percentage of time spent by the CPU or CPUs to run a niced guest.

              %idle
                     Show the percentage of time that the CPU or CPUs were idle and the system did not have an outstanding disk I/O request.

              Note: On SMP machines a processor that does not have any activity at all is a disabled (offline) processor.

       -V     Print version number then exit.

ENVIRONMENT
       The mpstat command takes into account the following environment variable:

       S_COLORS
              When this variable is set, display statistics in color on the terminal.  Possible values for this variable are never, always or auto
              (the latter is the default).

              Please  note  that the color (being red, yellow, or some other color) used to display a value is not indicative of any kind of issue
              simply because of the color. It only indicates different ranges of values.

       S_COLORS_SGR
              Specify the colors and other attributes used to display statistics on the terminal.  Its value is a colon-separated list of capabil‐
              ities that defaults to H=31;1:I=32;22:M=34;1:N=33;1:Z=33;22.  Supported capabilities are:

              H=     SGR (Select Graphic Rendition) substring for percentage values greater than or equal to 75%.

              I=     SGR substring for CPU number.

              M=     SGR substring for percentage values in the range from 50% to 75%.

              N=     SGR substring for non-zero statistics values.

              Z=     SGR substring for zero values.

       S_TIME_FORMAT
              If  this  variable  exists and its value is ISO then the current locale will be ignored when printing the date in the report header.
              The mpstat command will use the ISO 8601 format (YYYY-MM-DD) instead.

EXAMPLES
       mpstat 2 5
              Display five reports of global statistics among all processors at two second intervals.

       mpstat -P ALL 2 5
              Display five reports of statistics for all processors at two second intervals.

BUGS
       /proc filesystem must be mounted for the mpstat command to work.

       Only a few activities are given by the Linux kernel for each processor.

FILES
       /proc contains various files with system statistics.

AUTHOR
       Sebastien Godard (sysstat <at> orange.fr)

SEE ALSO
       sar(1), pidstat(1), iostat(1), vmstat(8)

       http://pagesperso-orange.fr/sebastien.godard/

Linux                                                              NOVEMBER 2015                                                         MPSTAT(1)
