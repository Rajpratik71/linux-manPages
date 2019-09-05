TAPESTAT(1)                                                     Linux User's Manual                                                    TAPESTAT(1)

NAME
       tapestat - Report tape statistics.

SYNOPSIS
       tapestat [ -k | -m ] [ -t ] [ -V ] [ -y ] [ -z ] [ interval [ count ] ]

DESCRIPTION
       The tapestat command is used for monitoring the activity of tape drives connected to a system.

       The  first  report  generated  by  the  tapestat command provides statistics concerning the time since the system was booted, unless the -y
       option is used, vhen this first report is omitted.  Each subsequent report covers the time since the previous report.

       The interval parameter specifies the amount of time in seconds between each report.  The count parameter can be  specified  in  conjunction
       with the interval parameter. If the count parameter is specified, the value of count determines the number of reports generated at interval
       seconds apart. If the interval parameter is specified without the count parameter, the tapestat command generates reports continuously.

REPORT
       The tapestat report provides statistics for each tape drive connected to the system.  The following data are displayed:

       r/s
              The number of reads issued expressed as the number per second averaged over the interval.

       w/s
              The number of writes issued expressed as the number per second averaged over the interval.

       kB_read/s | MB_read/s
              The amount of data read expressed in kilobytes (by default or if option -k used) or Megabytes (if option -m used) per  second  aver‐
              aged over the interval.

       kB_wrtn/s | MB_wrtn/s
              The  amount  of  data  written  expressed in kilobytes (by default or if option -k used) or Megabytes (if option -m used) per second
              averaged over the interval.

       %Rd
              Read percentage wait - The percentage of time over the interval spent waiting for read requests to complete.  The time  is  measured
              from when the request is dispatched to the SCSI mid-layer until it signals that it completed.

       %Wr
              Write  percentage wait - The percentage of time over the interval spent waiting for write requests to complete. The time is measured
              from when the request is dispatched to the SCSI mid-layer until it signals that it completed.

       %Oa
              Overall percentage wait - The percentage of time over the interval spent waiting for any I/O request to complete (read,  write,  and
              other).

       Rs/s
              The number of I/Os, expressed as the number per second averaged over the interval, where a non-zero residual value was encountered.

       Ot/s
              The number of I/Os, expressed as the number per second averaged over the interval, that were included as "other". Other I/O includes
              ioctl calls made to the tape driver and implicit operations performed by the tape driver such as rewind on close (for  tape  devices
              that  implement  rewind  on  close).  It  does  not  include any I/O performed using methods outside of the tape driver (e.g. via sg
              ioctls).

OPTIONS
       -k     Show the amount of data written or read in kilobytes per second instead of Megabytes.  This option is mutually exclusive with -m.

       -m     Show the amount of data written or read in Megabytes per second instead of kilobytes.  This option is mutually exclusive with -k.

       -t     Display time stamps. The time stamp format may depend on the value of the S_TIME_FORMAT environment variable (see below).

       -V     Print version and exit.

       -y     Omit the initial statistic showing values since boot.

       -z     Tell tapestat to omit output for any tapes for which there was no activity during the sample period.

CONSIDERATIONS
       It is possible for a percentage value (read, write, or other) to be greater than 100 percent (the tapestat command will never show  a  per‐
       centage  value  more than 999).  If rewinding a tape takes 40 seconds where the interval time is 5 seconds the %Oa value would show as 0 in
       the intervals before the rewind completed and then show as approximately 800 percent when the rewind completes.

       Similar values will be observed for %Rd and %Wr if a tape drive stops reading or writing and then restarts (that is it stopped  streaming).
       In  such  a  case  you may see the r/s or w/s drop to zero and the %Rd/%Wr value could be higher than 100 when reading or writing continues
       (depending on how long it takes to restart writing or reading).  This is only an issue if it happens a lot as it may cause  tape  wear  and
       will impact on the backup times.

       For  fast  tape drives you may see low percentage wait times.  This does not indicate an issue with the tape drive. For a slower tape drive
       (e.g. an older generation DDS drive) the speed of the tape (and tape drive) is much slower than filesystem  I/O,  percent  wait  times  are
       likely  to  be  higher. For faster tape drives (e.g. LTO) the percentage wait times are likely to be lower as program writing to or reading
       from tape is going to be doing a lot more filesystem I/O because of the higher throughput.

       Although tape statistics are implemented in the kernel using atomic variables they cannot be read atomically as a group. All of the statis‐
       tics  values  are  read from different files under /sys, because of this there may be I/O completions while reading the different files for
       the one tape drive. This may result in a set of statistics for a device that contain some values before an I/O completed and some after.

       This command uses rounding down as the rounding method when calculating per second statistics.  If, for example, you are using dd  to  copy
       one tape to another and running tapestat with an interval of 5 seconds and over the interval there were 3210 writes and 3209 reads then w/s
       would show 642 and r/s 641 (641.8 rounded down to 641). In such a case if it was a tar archive being copied (with a  10k  block  size)  you
       would  also see a difference between the kB_read/s and kB_wrtn/s of 2 (one I/O 10k in size divided by the interval period of 5 seconds). If
       instead there were 3210 writes and 3211 reads both w/s and r/s would both show 642 but  you  would  still  see  a  difference  between  the
       kB_read/s and kB_wrtn/s values of 2 kB/s.

       This  command  is  provided  with an interval in seconds. However internally the interval is tracked per device and can potentially have an
       effect on the per second statistics reported.  The time each set of statistics is captured is kept with those  statistics.  The  difference
       between the current and previous time is converted to milliseconds for use in calculations.  We can look at how this can impact the statis‐
       tics reported if we use an example of a tar archive being copied between two tape drives using dd. If both devices reported 28900 kilobytes
       transferred  and the reading tape drive had an interval of 5001 milliseconds and the writing tape drive 5000 milliseconds that would calcu‐
       late out as 5778 kB_read/s and 5780 kB_wrtn/s.

       The impact of some retrieving statistics during an I/O completion, rounding down, and small differences in the interval period on the  sta‐
       tistics calculated should be minimal but may be non-zero.

ENVIRONMENT
       The tapestat command takes into account the following environment variables:

       S_COLORS
              When this variable is set, display statistics in color on the terminal.  Possible values for this variable are never, always or auto
              (the latter is the default).

              Please note that the color (being red, yellow, or some other color) used to display a value is not indicative of any kind  of  issue
              simply because of the color. It only indicates different ranges of values.

       S_COLORS_SGR
              Specify the colors and other attributes used to display statistics on the terminal.  Its value is a colon-separated list of capabil‐
              ities that defaults to H=31;1:I=32;22:M=34;1:N=33;1:Z=33;22.  Supported capabilities are:

              H=     SGR (Select Graphic Rendition) substring for percentage values greater than or equal to 75%.

              I=     SGR substring for tape names.

              M=     SGR substring for percentage values in the range from 50% to 75%.

              N=     SGR substring for non-zero statistics values.

              Z=     SGR substring for zero values.

       S_TIME_FORMAT
              If this variable exists and its value is ISO then the current locale will be ignored when printing the date in  the  report  header.
              The tapestat command will use the ISO 8601 format (YYYY-MM-DD) instead.  The timestamp displayed with option -t will also be compli‐
              ant with ISO 8601 format.

BUGS
       /sys filesystem must be mounted for tapestat to work. It will not work on kernels that do not have sysfs support

       This command requires kernel version 4.2 or later (or tape statistics support backported for an earlier kernel version).

FILES
       /sys/class/scsi_tape/st<num>/stats/* Statistics files for tape devices.

       /proc/uptime contains system uptime.

AUTHOR
       Initial revision by Shane M. SEYMOUR (shane.seymour <at> hpe.com)
       Modified for sysstat by Sebastien Godard (sysstat <at> orange.fr)

SEE ALSO
       iostat(1), mpstat(1)

       http://pagesperso-orange.fr/sebastien.godard/

Linux                                                              OCTOBER 2015                                                        TAPESTAT(1)
