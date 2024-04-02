ocount(1)                                                                                  General Commands Manual                                                                                  ocount(1)



NAME
       ocount - Event counting tool for Linux


SYNOPSIS
       ocount [ options ] [ --system-wide | --process-list <pids> | --thread-list <tids> | --cpu-list <cpus> [ command [ args ] ] ]


DESCRIPTION
       ocount  is  an  OProfile  tool  that  can be used to count native hardware events occurring in either a given application, a set of processes or threads, a subset of active system processors, or the
       entire system. The data collected during a counting session is displayed to stdout by default or, optionally, to a file.

       When counting multiple events, the kernel may not be able to count all events simultaneously and, thus, may need to multiplex the counting of the events.  If this happens, the "Percent time enabled"
       column in the ocount output will be less than 100, but counts are scaled up to a 100% estimated value.


RUN MODES
       One  (and  only  one) of the following run modes must be specified.  If you run ocount using a run mode other than command [args] , press Ctrl-c to stop ocount when finished counting (e.g., when the
       monitored process ends).  If you background ocount (i.e., with '&') while using one these run modes, you must stop it in a controlled manner so that the data collection  process  can  be  shut  down
       cleanly and final results can be displayed. Use kill -SIGINT <ocount-PID> for this purpose.

       command [args]
              The  command  is the application for which to count events.  args are the input arguments required by the application.  The command and its arguments must be positioned at the end of the com‐
              mand line, after all ocount options.

       --process-list / -p pids
              Use this option to count events for one or more already-running applications, specified via a comma-separated list ( pids ). Event counts will be collected for  all  children  of  the  passed
              process(es) as well.


       --thread-list / -r tids
              Use  this  option  to  count  events  for one or more already-running threads, specified via a comma-separated list ( tids ). Event counts will not be collected for any children of the passed
              thread(s).


       --system-wide / -s
              This option is for counting events for all processes running on your system.  You must have root authority to run ocount in this mode.


       --cpu-list / -C cpus
              This option is for counting events on a subset of processors on your system. You must have root authority to run ocount in this mode. This is a comma-separated list, where each element in the
              list may be either a single processor number or a range of processor numbers; for example: '-C 2,3,4-11,15'.


OTHER OPTIONS
       --events / -e event1[,event2[,...]]
              This option is for passing a comma-separated list of event specifications for counting. Each event spec is of the form:
                 name[:unitmask[:kernel[:user]]]
              Note: Do not include a count value in the event spec, as that parameter is only need when profiling.

              You  can  specify  unit  mask  values using either a numerical value (hex values must begin with "0x") or a symbolic name (if the name=<um_name> field is shown in the ophelp output). For some
              named unit masks, the hex value is not unique; thus, OProfile tools enforce specifying such unit masks value by name.  If no unit mask is specified, the default unit mask value for the  event
              is used.

              Event names for certain processor types include a _GRP<n> suffix.  For such cases, the --events option may be specified with or without the _GRP<n> suffix.

              When no event specification is given, the default event for the running processor type will be used for counting.  Use ophelp to list the available events for your processor type.


       --separate-thread / -t
              This option can be used in conjunction with either the --process-list or --thread-list option to display event counts on a per-thread (per-process) basis.  Without this option, all counts are
              aggregated.

              NOTE: If new threads are started by the process(es) being monitored after counting begins, the counts for those threads are aggregated with their parent's counts.


       --separate-cpu / -c
              This option can be used in conjunction with either the --system-wide or --cpu-list option to display event counts on a per-cpu basis.  Without this option, all counts are aggregated.


       --time-interval / -i num_seconds[:num_intervals]
              Results collected for each time interval are printed every num_seconds instead of the default of one dump of cumulative event counts at the end of the run.   If  num_intervals  is  specified,
              ocount exits after the specified number of intervals occur.


       --brief-format / -b
              Use this option to print results in the following brief format:
                  [optional cpu or thread,]<event_name>,<count>,<percent_time_enabled>
                  [        <int>         ,]<  string  >,< u64 >,<     double         >

              If --timer-interval is specified, a separate line formatted as
                  timestamp,<num_seconds_since_epoch>
              is printed ahead of each dump of event counts.


       --output-file / -f outfile_name
              Results are written to outfile_name instead of interactively to the terminal.

       --verbose / -V
              Use this option to increase the verbosity of the output.

       --version / -v
              Show ocount version.

       --help / -h
              Display brief usage message.

       --usage / -u
              Display brief usage message.


EXAMPLE
       $ ocount make


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       operf(1).



oprofile 0.9.9                                                                               Fri 02 November 2018                                                                                   ocount(1)
