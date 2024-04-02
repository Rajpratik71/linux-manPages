OPCONTROL(1)                                                                               General Commands Manual                                                                               OPCONTROL(1)



NAME
       opcontrol - control OProfile profiling

SYNOPSIS
       opcontrol [ options ]

DESCRIPTION
       opcontrol can be used to start profiling, end a profiling session, dump profile data, and set up the profiling parameters.


OPTIONS
       --help / -?
              Show help message.

       --version / -v
              Show version.

       --list-events / -l
              Shows the monitorable events.

       --init Load the OProfile module if required and make the OProfile driver interface available.

       --setup
              Followed by list options for profiling setup. Store setup in ~root/.oprofile/daemonrc. Optional.

       --status
              Show configuration information.

       --start-daemon
              Start the oprofile daemon without starting profiling.

       --start / -s
              Start data collection with either arguments provided by --setup or with information saved in ~root/.oprofile/daemonrc.

       --dump / -d
              Force a flush of the collected profiling data to the daemon.

       --stop / -t
              Stop data collection.

       --shutdown / -h
              Stop data collection and kill the daemon.

       --reset
              Clear out data from current session, but leaves saved sessions.

       --save=sessionname
              Save data from current session to sessionname.

       --deinit
              Shut down daemon. Unload the oprofile module and oprofilefs.

       --session-dir=dir_path
              Use sample database out of directory dir_path instead of the default location (/var/lib/oprofile).

       --buffer-size=num
              Set  kernel  buffer to num samples. The buffer watershed needs to be tweaked when changing this value.  Rules:  A non-zero value goes into effect after a '--shutdown/start' sequence.  A value
              of zero sets this parameter back to default value, but does not go into effect until after '--deinit/init' sequence.

       --buffer-watershed=num
              Set kernel buffer watershed to num samples. When buffer-size - buffer-watershed free entries remain in the kernel buffer, data will be flushed to the daemon.  Most useful values  are  in  the
              range [0.25 - 0.5] * buffer-size.  Same rules as defined for buffer-size.

       --cpu-buffer-size=num
              Set  kernel  per-cpu  buffer  to  num  samples. If you profile at high rate it can help to increase this if the log file show excessive count of sample lost cpu buffer overflow. Same rules as
              defined for buffer-size.

       --event / -e [event|"default"]
              Specify an event to measure for the hardware performance counters, or "default" for the default event. The event is of the form "CPU_CLK_UNHALTED:30000:0:1:1" where  the  numeric  values  are
              count,  unit mask, kernel-space counting, user-space counting, respectively.  Note that this over-rides all previous events selected; if you want to profile with two or more events simultane‐
              ously, you must specify them on the same opcontrol invocation. You can specify unit mask values using either a numerical value (hex values must begin with "0x") or a  symbolic  name  (if  the
              name=<um_name> field is shown in the ophelp output). For some named unit masks, the hex value is not unique; thus, OProfile tools enforce specifying such unit masks value by name.

       --separate / -p [none,lib,kernel,thread,cpu,all]
              Separate  samples  based on the given separator. 'lib' separates dynamically linked library samples per application. 'kernel' separates kernel and kernel module samples per application; 'ker‐
              nel' implies 'library'. 'thread' gives separation for each thread and task.  'cpu' separates for each CPU. 'all' implies all of the above options and 'none' turns off separation.

       --callgraph / -c [#depth]
              Enable callgraph sample collection with a maximum depth. Use 0 to disable callgraph profiling. This option is available on x86 using a 2.6+ kernel with callgraph support enabled.  It is  also
              available on PowerPC using a 2.6.17+ kernel.

       --image / -i [name,name...|"all"]
              Only profile the given absolute paths to binaries, or "all" to profile everything (the default).

       --vmlinux=file
              vmlinux kernel image.

       --no-vmlinux
              Use this when you don't have a kernel vmlinux file, and you don't want to profile the kernel.

       --verbose / -V [options]
              Be verbose in the daemon log. This has a high overhead.

       --kernel-range=start,end
              Set kernel range vma address in hexadecimal.


OPTIONS (specific to Xen)
       --xen=file
              Xen image

       --active-domains=<list>
              List  of  domain ids participating in a multi-domain profiling session.  Each of the specified domains must run an instance of oprofile. The sequence of opcontrol commands in each domain must
              follow a given order which is specified in the oprofile user manual. If more than one domain is specified in <list> they should be separated using commas. This option  can  only  be  used  in
              domain  0  which  is  the  only  domain  that  can  coordinate a multi-domain profiling session. Including domain 0 in the list of active domains is optional. (e.g. --active-domains=2,5,6 and
              --active-domains=0,2,5,6 are equivalent).  This option can only be specified if --start-daemon is also specified and it is only valid for the current run of the oprofile daemon; e.g. the list
              of active domains is not persistent.

       --passive-domains=<list>or--domains=<list>
              List  of  domain  ids to be profiled, separated by commas.  As opposed to the --active-domains option, the domains specified with this option do not need to run oprofile. This makes profiling
              multiple domains easier. However, with the passive-domains option, samples in user level processes and kernel modules cannot be mapped to specific symbols and are aggregated under  a  generic
              class.  Both --active-domains and --passive-domains options can be specified in the same command, but the same domain cannot be specified in both options. This option can only be specified if
              either --start or --start-daemon is specified on the same command and it is only valid for the current run of the oprofile daemon; e.g. the list of passive domains is not persistent.

       --passive-images=<list>or--domains-images=<list>
              List of kernel images associated with the domains specified in the --passive-domains option, also separated by commas. The association between the images and domains is  based  on  the  order
              they are specified in both options.

OPTIONS (specific to System z)
       --s390hwsampbufsize=num
              Number  of  2MB  areas used per CPU for storing sample data.  The best size for the sample memory depends on the particular system and the workload to be measured.  Providing the sampler with
              too little memory results in lost samples. Reserving too much system memory for the sampler impacts the overall performance and, hence, also the workload to be measured.


ENVIRONMENT
       No special environment variables are recognised by opcontrol.


FILES
       /root/.oprofile/daemonrc
              Configuration file for opcontrol

       /var/lib/oprofile/samples/
              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                OPCONTROL(1)
