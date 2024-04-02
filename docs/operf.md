OPERF(1)                                                                                   General Commands Manual                                                                                   OPERF(1)



NAME
       operf - Performance profiler tool for Linux


SYNOPSIS
       operf [ options ] [ --system-wide | --pid <pid> | [ command [ args ] ] ]


DESCRIPTION
       Operf  is  an OProfile tool that can be used in place of opcontrol for profiling. Operf uses the Linux Performance Events Subsystem, and hence, does not require the use of the opcontrol daemon -- in
       fact, operf and opcontrol usage are mutually exclusive.

       By default, operf uses <current_dir>/oprofile_data as the session-dir and stores profiling data there.  You can change this by way of the --session-dir option.

       The usual post-profiling analysis tools such as opreport(1) and opannotate(1) can be used to generate profile  reports.   The  post-processing  analysis  tools  will  search  for  samples  in  <cur‐
       rent_dir>/oprofile_data first. If that directory does not exist, the post-processing tools use the standard session-dir of /var/lib/oprofile.

       Statistics, such as total samples received and lost samples, are written to the operf.log file that can be found in the <session_dir>/samples directory.


OPTIONS
       command[args]
              The command or application to be profiled.  args are the input arguments that the command or application requires.  One (and only one) of either command , --pid or --system-wide is required.

       --pid / -p PID
              This  option enables operf to profile a running application.  PID should be the process ID of the process you wish to profile.  When finished profiling (e.g., when the profiled process ends),
              press Ctrl-c to stop operf. If you run operf --pid as a background job (i.e., with the &), you must stop it in a controlled manner in order for it to process the  profile  data  it  has  col‐
              lected.  Use kill -SIGINT <operf-PID> for this purpose.

       --system-wide / -s
              This option is for performing a system-wide profile.  You must have root authority to run operf in this mode.  When finished profiling, Ctrl-c to stop operf. If you run operf --system-wide as
              a background job (i.e., with the &), you must stop it in a controlled manner in order for it to process the profile data it has collected.  Use kill -SIGINT <operf-PID> for this purpose.   It
              is recommended that when running operf with this option, the user's current working directory should be /root or a subdirectory of /root to avoid storing sample data files in locations acces‐
              sible by regular users.

       --vmlinux / k vmlinux_path
              A vmlinux file that matches the running kernel that has symbol and/or debuginfo.  Kernel samples will be attributed to this binary, allowing post-processing tools (like opreport) to attribute
              samples to the appropriate kernel symbols.

       --events / -e event1[,event2[,...]]
              This option is for passing a comma-separated list of event specifications for profiling. Each event spec is of the form:
                 name:count[:unitmask[:kernel[:user]]]
              You  can  specify  unit  mask  values using either a numerical value (hex values must begin with "0x") or a symbolic name (if the name=<um_name> field is shown in the ophelp output). For some
              named unit masks, the hex value is not unique; thus, OProfile tools enforce specifying such unit masks value by name.

              Event names for some IBM PowerPC systems include a _GRP<n> (group number) suffix. You can pass either the full event name or the base event name (i.e., without the suffix) to operf.   If  the
              base  event  name  is  passed,  operf  will  automatically choose an appropriate group number suffix for the event; thus, OProfile post-processing tools will always show real event names that
              include the group number suffix.

              When no event specification is given, the default event for the running processor type will be used for profiling.  Use ophelp to list the available events for your processor type.

       --callgraph / -g
              This option enables the callgraph to be saved during profiling. NOTE: The full callchain is recorded, so there is no depth limit.

       --separate-thread / -t
              This option categorizes samples by thread group ID (tgid) and thread ID (tid).  The '--separate-thread' option is useful for seeing per-thread samples in  multi-threaded  applications.   When
              used  in  conjunction  with  the '--system-wide' option, the '--separate-thread' option is also useful for seeing per-process (i.e., per-thread group) samples for the case where multiple pro‐
              cesses are executing the same program during a profiling run.

       --separate-cpu / -c
              This option categorizes samples by cpu.

       --session-dir / -d path
              This option specifies the session path to hold the sample data. If not specified, the data is saved in the oprofile_data directory on the current path.

       --lazy-conversion / -l
              Use this option to reduce the overhead of operf during profiling. Normally, profile data received from the kernel is converted to OProfile format during profiling time. This is typically  not
              an  issue  when profiling a single application. But when using the --system-wide option, this on-the-fly conversion process can cause noticeable overhead, particularly on busy multi-processor
              systems. The --lazy-conversion option directs operf to wait until profiling is completed to do the conversion of profile data.

       --append / -a
              By default, operf moves old profile data from <session_dir>/samples/current to <session_dir>/samples/previous.  If a 'previous' profile already existed, it will be replaced.  If the  --append
              option is passed, old profile data is left in place and new profile data will be added to it, and the 'previous' profile (if one existed) will remain untouched.  To access the 'previous' pro‐
              file, simply add a session specification to the normal invocation of oprofile post-processing tools.  For example:
                 opreport session:previous

       --verbose / -V level
              A comma-separated list of debugging control values, used to increase the verbosity of the output.  Valid values are:  debug, record, convert, misc, sfile, arcs, or the special value, 'all'.

       --version / -v
              Show operf version.

       --help / -h
              Display brief usage message.

       --usage / -u
              Display brief usage message.


EXAMPLE
       $ operf make


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       opreport(1), opannotate(1).



oprofile 0.9.9                                                                               Fri 02 November 2018                                                                                    OPERF(1)
