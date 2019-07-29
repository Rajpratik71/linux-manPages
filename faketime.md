FAKETIME(1)                                                           wolfcw                                                           FAKETIME(1)

NAME
       faketime - manipulate the system time for a given command

SYNOPSIS
       faketime [options] timestamp program [arguments...]

DESCRIPTION
       The  given  command  will be tricked into believing that the current system time is the one specified in the timestamp. The wall clock will
       continue to run from this date and time unless specified otherwise (see advanced options). Actually, faketime is a simple wrapper for  lib‐
       faketime,  which  uses  the  LD_PRELOAD  mechanism  to  load a small library which intercepts system calls to functions such as time(2) and
       fstat(2). This wrapper exposes only a subset of libfaketime's functionality; please refer to the README file that came  with  faketime  for
       more details and advanced options, or have a look at http://github.com/wolfcw/libfaketime

OPTIONS
       --help show usage information and quit.

       --version
              show version information and quit.

       -m     use the multi-threading variant of libfaketime.

       -f     use the advanced timestamp specification format.

EXAMPLES
       faketime 'last Friday 5 pm' /bin/date
       faketime '2008-12-24 08:15:42' /bin/date
       faketime -f '+2,5y x10,0' /bin/bash -c 'date; while true; do echo $SECONDS ; sleep 1 ; done'
       faketime -f '+2,5y x0,50' /bin/bash -c 'date; while true; do echo $SECONDS ; sleep 1 ; done'
       faketime -f '+2,5y i2,0' /bin/bash -c 'while true; do date ; sleep 1 ; done'
       In this single case all spawned processes will use the same global clock without restaring it at the start of each process.

       (Please note that it depends on your locale settings whether . or , has to be used for fractional offsets)

ADVANCED TIMESTAMP FORMAT
       The  simple  timestamp format used by default applies the /bin/date -d command to parse user-friendly specifications such as 'last friday'.
       When using the faketime option -f, the timestamp specified on the command line is directly passed to libfaketime, which enables a couple of
       additional  features  such  as  speeding the clock up or slowing it down for the target program. It is strongly recommended that you have a
       look at the libfaketime documentation. Summary:

       Freeze clock at absolute timestamp: "YYYY-MM-DD hh:mm:ss"
              If you want to specify an absolute point in time, exactly this format must be used. Please note that freezing the clock  is  usually
              not what you want and may break the application. Only use if you know what you're doing!

       Relative time offset: "[+/-]123[m/h/d/y], e.g. "+60m", "+2y"
              This is the most often used format and specifies the faked time relatively to the current real time. The first character of the for‐
              mat string must be a + or a -. The numeric value by default represents seconds, but the modifiers m, h, d, and  y  can  be  used  to
              specify minutes, hours, days, or years, respectively. For example, "-2y" means "two years ago". Fractional time offsets can be used,
              e.g. "+2,5y", which means "two and a half years in the future". Please note that the fraction delimiter depends on your locale  set‐
              tings, so if "+2,5y" does not work, you might want to try "+2.5y".

       Start-at timestamps: "@YYYY-MM-DD hh:mm:ss"
              The wall clock will start counting at the given timestamp for the program. This can be used for specifying absolute timestamps with‐
              out freezing the clock.

ADVANCED USAGE
       When using relative time offsets or start-at timestamps (see ADVANCED TIMESTAMP FORMAT above  and  option  -f),  the  clock  speed  can  be
       adjusted,  i.e.  time  may  run  faster or slower for the executed program. For example, "+5y x10" will set the faked time 5 years into the
       future and make the time pass 10 times as fast (one real second equals 10 seconds measured by the program). Similarly, the flow of time can
       be  slowed,  e.g.  using  "-7d x0,2", which will set the faked time 7 days in the past and set the clock speed to 20 percent, i.e. it takes
       five real world seconds for one second measured by the program. Again, depending on your locale, either "x2.0" or "x2,0"  may  be  required
       regarding  the  delimiter. You can also make faketime to advance the reported time by a preset interval upon each time() call independently
       from the system's time using "-7d i2,0", where "i" is followed by the increase interval in seconds.

       Faking times for multiple programs or even system-wide can be simplified by using ~/.faketimerc files and /etc/faketimerc. Please refer  to
       the README that came with faketime for warnings and details.

AUTHOR
       Please see the README and NEWS files for contributers.

BUGS
       Due  to limitations of the LD_PRELOAD mechanism, faketime will not work with suidroot and statically linked programs.  While timestamps and
       time offsets will work for child processes, speeding the clock up or slowing it down might not work for child processes spawned by the exe‐
       cuted program as expected; a new instance of libfaketime is used for each child process, which means that the libfaketime start time, which
       is used in speed adjustments, will also be re-initialized. Some programs may dynamically load system libraries, such as librt, at  run-time
       and therefore bypass libfaketime. You may report programs that do not work with libfaketime, but only if they are available as open source.

REPORTING BUGS
       Please use https://github.com/wolfcw/libfaketime/issues

COPYRIGHT
       Copyright © 2003-2013 by the libfaketime authors.

       There  is  NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. You may redistribute copies of faketime under the
       terms of the GNU General Public License.
       For more information about these matters, see the file named COPYING.

SEE ALSO
       ld.so(1), time(2), fstat(2)

faketime 0.9.6                                                       June 2014                                                         FAKETIME(1)
