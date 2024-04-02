xl(1)                                             Xen                                            xl(1)

NAME
       xl - Xen management tool, based on LibXenlight

SYNOPSIS
       xl subcommand [args]

DESCRIPTION
       The xl program is the new tool for managing Xen guest domains. The program can be used to
       create, pause, and shutdown domains. It can also be used to list current domains, enable or pin
       VCPUs, and attach or detach virtual block devices.

       The basic structure of every xl command is almost always:

         xl subcommand [OPTIONS] domain-id

       Where subcommand is one of the subcommands listed below, domain-id is the numeric domain id, or
       the domain name (which will be internally translated to domain id), and OPTIONS are subcommand
       specific options.  There are a few exceptions to this rule in the cases where the subcommand in
       question acts on all domains, the entire machine, or directly on the Xen hypervisor.  Those
       exceptions will be clear for each of those subcommands.

NOTES
       start the script /etc/init.d/xencommons at boot time
           Most xl operations rely upon xenstored and xenconsoled: make sure you start the script
           /etc/init.d/xencommons at boot time to initialize all the daemons needed by xl.

       setup a xenbr0 bridge in dom0
           In the most common network configuration, you need to setup a bridge in dom0 named xenbr0
           in order to have a working network in the guest domains.  Please refer to the documentation
           of your Linux distribution to know how to setup the bridge.

       autoballoon
           If you specify the amount of memory dom0 has, passing dom0_mem to Xen, it is highly
           recommended to disable autoballoon. Edit /etc/xen/xl.conf and set it to 0.

       run xl as root
           Most xl commands require root privileges to run due to the communications channels used to
           talk to the hypervisor.  Running as non root will return an error.

GLOBAL OPTIONS
       Some global options are always available:

       -v  Verbose.

       -N  Dry run: do not actually execute the command.

       -f  Force execution: xl will refuse to run some commands if it detects that xend is also
           running, this option will force the execution of those commands, even though it is unsafe.

       -t  Always use carriage-return-based overwriting for displaying progress messages without
           scrolling the screen.  Without -t, this is done only if stderr is a tty.

DOMAIN SUBCOMMANDS
       The following subcommands manipulate domains directly.  As stated previously, most commands
       take domain-id as the first parameter.

       button-press domain-id button
           This command is deprecated. Please use "xl trigger" instead.

           Indicate an ACPI button press to the domain, where button can be 'power' or 'sleep'. This
           command is only available for HVM domains.

       create [configfile] [OPTIONS]
           The create subcommand takes a config file as its first argument: see xl.cfg(5) for full
           details of the file format and possible options.  If configfile is missing xl creates the
           domain assuming the default values for every option.

           configfile has to be an absolute path to a file.

           Create will return as soon as the domain is started.  This does not mean the guest OS in
           the domain has actually booted, or is available for input.

           If the -F option is specified, create will start the domain and not return until its death.

           OPTIONS

           -q, --quiet
               No console output.

           -f=FILE, --defconfig=FILE
               Use the given configuration file.

           -p  Leave the domain paused after it is created.

           -F  Run in foreground until death of the domain.

           -V, --vncviewer
               Attach to domain's VNC server, forking a vncviewer process.

           -A, --vncviewer-autopass
               Pass the VNC password to vncviewer via stdin.

           -c  Attach console to the domain as soon as it has started.  This is useful for determining
               issues with crashing domains and just as a general convenience since you often want to
               watch the domain boot.

           key=value
               It is possible to pass key=value pairs on the command line to provide options as if
               they were written in the configuration file; these override whatever is in the
               configfile.

               NB: Many config options require characters such as quotes or brackets which are
               interpreted by the shell (and often discarded) before being passed to xl, resulting in
               xl being unable to parse the value correctly.  A simple work-around is to put all extra
               options within a single set of quotes, separated by semicolons.  (See below for an
               example.)

           EXAMPLES

           with config file
                 xl create DebianLenny

               This creates a domain with the file /etc/xen/DebianLenny, and returns as soon as it is
               run.

           with extra parameters
                 xl create hvm.cfg 'cpus="0-3"; pci=["01:05.1","01:05.2"]'

               This creates a domain with the file hvm.cfg, but additionally pins it to cpus 0-3, and
               passes through two PCI devices.

       config-update domain-id [configfile] [OPTIONS]
           Update the saved configuration for a running domain. This has no immediate effect but will
           be applied when the guest is next restarted. This command is useful to ensure that runtime
           modifications made to the guest will be preserved when the guest is restarted.

           Since Xen 4.5 xl has improved capabilities to handle dynamic domain configuration changes
           and will preserve any changes made at runtime when necessary. Therefore it should not
           normally be necessary to use this command any more.

           configfile has to be an absolute path to a file.

           OPTIONS

           -f=FILE, --defconfig=FILE
               Use the given configuration file.

           key=value
               It is possible to pass key=value pairs on the command line to provide options as if
               they were written in the configuration file; these override whatever is in the
               configfile.  Please see the note under create on handling special characters when
               passing key=value pairs on the command line.

       console [OPTIONS] domain-id
           Attach to the console of a domain specified by domain-id.  If you've set up your domains to
           have a traditional login console this will look much like a normal text login screen.

           Use the key combination Ctrl+] to detach from the domain console.

           OPTIONS

           -t [pv|serial]
               Connect to a PV console or connect to an emulated serial console.  PV consoles are the
               only consoles available for PV domains while HVM domains can have both. If this option
               is not specified it defaults to emulated serial for HVM guests and PV console for PV
               guests.

           -n NUM
               Connect to console number NUM. Console numbers start from 0.

       destroy [OPTIONS] domain-id
           Immediately terminate the domain specified by domain-id.  This doesn't give the domain OS
           any chance to react, and is the equivalent of ripping the power cord out on a physical
           machine.  In most cases you will want to use the shutdown command instead.

           OPTIONS

           -f  Allow domain 0 to be destroyed.  Because a domain cannot destroy itself, this is only
               possible when using a disaggregated toolstack, and is most useful when using a hardware
               domain separated from domain 0.

       domid domain-name
           Converts a domain name to a domain id.

       domname domain-id
           Converts a domain id to a domain name.

       rename domain-id new-name
           Change the domain name of a domain specified by domain-id to new-name.

       dump-core domain-id [filename]
           Dumps the virtual machine's memory for the specified domain to the filename specified,
           without pausing the domain.  The dump file will be written to a distribution specific
           directory for dump files, for example: /var/lib/xen/dump/dump.

       help [--long]
           Displays the short help message (i.e. common commands) by default.

           If the --long option is specified, it displays the complete set of xl subcommands, grouped
           by function.

       list [OPTIONS] [domain-id ...]
           Displays information about one or more domains.  If no domains are specified it displays
           information about all domains.

           OPTIONS

           -l, --long
               The output for xl list is not the table view shown below, but instead presents the data
               as a JSON data structure.

           -Z, --context
               Also displays the security labels.

           -v, --verbose
               Also displays the domain UUIDs, the shutdown reason and security labels.

           -c, --cpupool
               Also displays the cpupool the domain belongs to.

           -n, --numa
               Also displays the domain NUMA node affinity.

           EXAMPLE

           An example format for the list is as follows:

               Name                                        ID   Mem VCPUs      State   Time(s)
               Domain-0                                     0   750     4     r-----   11794.3
               win                                          1  1019     1     r-----       0.3
               linux                                        2  2048     2     r-----    5624.2

           Name is the name of the domain.  ID the numeric domain id.  Mem is the desired amount of
           memory to allocate to the domain (although it may not be the currently allocated amount).
           VCPUs is the number of virtual CPUs allocated to the domain.  State is the run state (see
           below).  Time is the total run time of the domain as accounted for by Xen.

           STATES

           The State field lists 6 states for a Xen domain, and which ones the current domain is in.

           r - running
               The domain is currently running on a CPU.

           b - blocked
               The domain is blocked, and not running or runnable.  This can be because the domain is
               waiting on IO (a traditional wait state) or has gone to sleep because there was nothing
               else for it to do.

           p - paused
               The domain has been paused, usually occurring through the administrator running xl
               pause.  When in a paused state the domain will still consume allocated resources (like
               memory), but will not be eligible for scheduling by the Xen hypervisor.

           s - shutdown
               The guest OS has shut down (SCHEDOP_shutdown has been called) but the domain is not
               dying yet.

           c - crashed
               The domain has crashed, which is always a violent ending.  Usually this state only
               occurs if the domain has been configured not to restart on a crash.  See xl.cfg(5) for
               more info.

           d - dying
               The domain is in the process of dying, but hasn't completely shut down or crashed.

           NOTES

               The Time column is deceptive.  Virtual IO (network and block devices) used by the
               domains requires coordination by Domain0, which means that Domain0 is actually charged
               for much of the time that a DomainU is doing IO.  Use of this time value to determine
               relative utilizations by domains is thus very unreliable, as a high IO workload may
               show as less utilized than a high CPU workload.  Consider yourself warned.

       mem-max domain-id mem
           Specify the maximum amount of memory the domain is able to use, appending 't' for
           terabytes, 'g' for gigabytes, 'm' for megabytes, 'k' for kilobytes and 'b' for bytes.

           The mem-max value may not correspond to the actual memory used in the domain, as it may
           balloon down its memory to give more back to the OS.

           The value given just sets the memory amount the domain is allowed to allocate in the
           hypervisor. It can't be set lower than the current reservation, but it is allowed to be
           higher than the configured maximum memory size of the domain (maxmem parameter in the
           domain's configuration). Using xl mem-max to set the maximum memory above the initial
           maxmem value will not allow the additional memory to be used via xl mem-set. The initial
           maxmem value is still used as an upper limit for xl mem-set.

           The domain will not receive any signal regarding the changed memory limit.

       mem-set domain-id mem
           Set the domain's used memory using the balloon driver; append 't' for terabytes, 'g' for
           gigabytes, 'm' for megabytes, 'k' for kilobytes and 'b' for bytes.

           Because this operation requires cooperation from the domain operating system, there is no
           guarantee that it will succeed.  This command will definitely not work unless the domain
           has the required paravirt driver.

           Warning: There is no good way to know in advance how small of a mem-set will make a domain
           unstable and cause it to crash.  Be very careful when using this command on running
           domains.

       migrate [OPTIONS] domain-id host
           Migrate a domain to another host machine. By default xl relies on ssh as a transport
           mechanism between the two hosts.

           OPTIONS

           -s sshcommand
               Use <sshcommand> instead of ssh.  String will be passed to sh. If empty, run <host>
               instead of ssh <host> xl migrate-receive [-d -e].

           -e  On the new <host>, do not wait in the background for the death of the domain. See the
               corresponding option of the create subcommand.

           -C config
               Send the specified <config> file instead of the file used on creation of the domain.

           --debug
               Display huge (!) amount of debug information during the migration process.

           -p  Leave the domain on the receive side paused after migration.

       remus [OPTIONS] domain-id host
           Enable Remus HA or COLO HA for domain. By default xl relies on ssh as a transport mechanism
           between the two hosts.

           NOTES

               Remus support in xl is still in experimental (proof-of-concept) phase.  Disk
               replication support is limited to DRBD disks.

               COLO support in xl is still in experimental (proof-of-concept) phase. All options are
               subject to change in the future.

           COLO disk configuration looks like:

             disk = ['...,colo,colo-host=xxx,colo-port=xxx,colo-export=xxx,active-disk=xxx,hidden-disk=xxx...']

           The supported options are:

           colo-host   : Secondary host's ip address.
           colo-port   : Secondary host's port, we will run a nbd server on the secondary host, and
           the nbd server will listen on this port.
           colo-export : Nbd server's disk export name of the secondary host.
           active-disk : Secondary's guest write will be buffered to this disk, and it's used by the
           secondary.
           hidden-disk : Primary's modified contents will be buffered in this disk, and it's used by
           the secondary.

           COLO network configuration looks like:

             vif = [ '...,forwarddev=xxx,...']

           The supported options are:

           forwarddev : Forward devices for the primary and the secondary, they are directly
           connected.

           OPTIONS

           -i MS
               Checkpoint domain memory every MS milliseconds (default 200ms).

           -u  Disable memory checkpoint compression.

           -s sshcommand
               Use <sshcommand> instead of ssh.  String will be passed to sh.  If empty, run <host>
               instead of ssh <host> xl migrate-receive -r [-e].

           -e  On the new <host>, do not wait in the background for the death of the domain.  See the
               corresponding option of the create subcommand.

           -N netbufscript
               Use <netbufscript> to setup network buffering instead of the default script
               (/etc/xen/scripts/remus-netbuf-setup).

           -F  Run Remus in unsafe mode. Use this option with caution as failover may not work as
               intended.

           -b  Replicate memory checkpoints to /dev/null (blackhole).  Generally useful for debugging.
               Requires enabling unsafe mode.

           -n  Disable network output buffering. Requires enabling unsafe mode.

           -d  Disable disk replication. Requires enabling unsafe mode.

           -c  Enable COLO HA. This conflicts with -i and -b, and memory checkpoint compression must
               be disabled.

           -p  Use userspace COLO Proxy. This option must be used in conjunction with -c.

       pause domain-id
           Pause a domain.  When in a paused state the domain will still consume allocated resources
           (such as memory), but will not be eligible for scheduling by the Xen hypervisor.

       reboot [OPTIONS] domain-id
           Reboot a domain.  This acts just as if the domain had the reboot command run from the
           console.  The command returns as soon as it has executed the reboot action, which may be
           significantly earlier than when the domain actually reboots.

           For HVM domains this requires PV drivers to be installed in your guest OS. If PV drivers
           are not present but you have configured the guest OS to behave appropriately you may be
           able to use the -F option to trigger a reset button press.

           The behavior of what happens to a domain when it reboots is set by the on_reboot parameter
           of the domain configuration file when the domain was created.

           OPTIONS

           -F  If the guest does not support PV reboot control then fallback to sending an ACPI power
               event (equivalent to the reset option to trigger).

               You should ensure that the guest is configured to behave as expected in response to
               this event.

       restore [OPTIONS] [configfile] checkpointfile
           Build a domain from an xl save state file.  See save for more info.

           OPTIONS

           -p  Do not unpause the domain after restoring it.

           -e  Do not wait in the background for the death of the domain on the new host.  See the
               corresponding option of the create subcommand.

           -d  Enable debug messages.

           -V, --vncviewer
               Attach to the domain's VNC server, forking a vncviewer process.

           -A, --vncviewer-autopass
               Pass the VNC password to vncviewer via stdin.

       save [OPTIONS] domain-id checkpointfile [configfile]
           Saves a running domain to a state file so that it can be restored later.  Once saved, the
           domain will no longer be running on the system, unless the -c or -p options are used.  xl
           restore restores from this checkpoint file.  Passing a config file argument allows the user
           to manually select the VM config file used to create the domain.

           -c  Leave the domain running after creating the snapshot.

           -p  Leave the domain paused after creating the snapshot.

       sharing [domain-id]
           Display the number of shared pages for a specified domain. If no domain is specified it
           displays information about all domains.

       shutdown [OPTIONS] -a|domain-id
           Gracefully shuts down a domain.  This coordinates with the domain OS to perform graceful
           shutdown, so there is no guarantee that it will succeed, and may take a variable length of
           time depending on what services must be shut down in the domain.

           For HVM domains this requires PV drivers to be installed in your guest OS. If PV drivers
           are not present but you have configured the guest OS to behave appropriately you may be
           able to use the -F option to trigger a power button press.

           The command returns immediately after signaling the domain unless the -w flag is used.

           The behavior of what happens to a domain when it reboots is set by the on_shutdown
           parameter of the domain configuration file when the domain was created.

           OPTIONS

           -a, --all
               Shutdown all guest domains.  Often used when doing a complete shutdown of a Xen system.

           -w, --wait
               Wait for the domain to complete shutdown before returning.

           -F  If the guest does not support PV shutdown control then fallback to sending an ACPI
               power event (equivalent to the power option to trigger).

               You should ensure that the guest is configured to behave as expected in response to
               this event.

       sysrq domain-id letter
           Send a <Magic System Request> to the domain, each type of request is represented by a
           different letter.  It can be used to send SysRq requests to Linux guests, see sysrq.txt in
           your Linux Kernel sources for more information.  It requires PV drivers to be installed in
           your guest OS.

       trigger domain-id nmi|reset|init|power|sleep|s3resume [VCPU]
           Send a trigger to a domain, where the trigger can be: nmi, reset, init, power or sleep.
           Optionally a specific vcpu number can be passed as an argument.  This command is only
           available for HVM domains.

       unpause domain-id
           Moves a domain out of the paused state.  This will allow a previously paused domain to now
           be eligible for scheduling by the Xen hypervisor.

       vcpu-set domain-id vcpu-count
           Enables the vcpu-count virtual CPUs for the domain in question.  Like mem-set, this command
           can only allocate up to the maximum virtual CPU count configured at boot for the domain.

           If the vcpu-count is smaller than the current number of active VCPUs, the highest number
           VCPUs will be hotplug removed.  This may be important for pinning purposes.

           Attempting to set the VCPUs to a number larger than the initially configured VCPU count is
           an error.  Trying to set VCPUs to < 1 will be quietly ignored.

           Some guests may need to actually bring the newly added CPU online after vcpu-set, go to SEE
           ALSO section for information.

       vcpu-list [domain-id]
           Lists VCPU information for a specific domain.  If no domain is specified, VCPU information
           for all domains will be provided.

       vcpu-pin [-f|--force] domain-id vcpu cpus hard cpus soft
           Set hard and soft affinity for a vcpu of <domain-id>. Normally VCPUs can float between
           available CPUs whenever Xen deems a different run state is appropriate.

           Hard affinity can be used to restrict this, by ensuring certain VCPUs can only run on
           certain physical CPUs. Soft affinity specifies a preferred set of CPUs. Soft affinity needs
           special support in the scheduler, which is only provided in credit1.

           The keyword all can be used to apply the hard and soft affinity masks to all the VCPUs in
           the domain. The symbol '-' can be used to leave either hard or soft affinity alone.

           For example:

            xl vcpu-pin 0 3 - 6-9

           will set soft affinity for vCPU 3 of domain 0 to pCPUs 6,7,8 and 9, leaving its hard
           affinity untouched. On the other hand:

            xl vcpu-pin 0 3 3,4 6-9

           will set both hard and soft affinity, the former to pCPUs 3 and 4, the latter to pCPUs
           6,7,8, and 9.

           Specifying -f or --force will remove a temporary pinning done by the operating system
           (normally this should be done by the operating system).  In case a temporary pinning is
           active for a vcpu the affinity of this vcpu can't be changed without this option.

       vm-list
           Prints information about guests. This list excludes information about service or auxiliary
           domains such as dom0 and stubdoms.

           EXAMPLE

           An example format for the list is as follows:

               UUID                                  ID    name
               59e1cf6c-6ab9-4879-90e7-adc8d1c63bf5  2    win
               50bc8f75-81d0-4d53-b2e6-95cb44e2682e  3    linux

       vncviewer [OPTIONS] domain-id
           Attach to the domain's VNC server, forking a vncviewer process.

           OPTIONS

           --autopass
               Pass the VNC password to vncviewer via stdin.

XEN HOST SUBCOMMANDS
       debug-keys keys
           Send debug keys to Xen. It is the same as pressing the Xen "conswitch" (Ctrl-A by default)
           three times and then pressing "keys".

       dmesg [OPTIONS]
           Reads the Xen message buffer, similar to dmesg on a Linux system.  The buffer contains
           informational, warning, and error messages created during Xen's boot process.  If you are
           having problems with Xen, this is one of the first places to look as part of problem
           determination.

           OPTIONS

           -c, --clear
               Clears Xen's message buffer.

       info [OPTIONS]
           Print information about the Xen host in name : value format.  When reporting a Xen bug,
           please provide this information as part of the bug report. See
           http://wiki.xen.org/xenwiki/ReportingBugs on how to report Xen bugs.

           Sample output looks as follows:

            host                   : scarlett
            release                : 3.1.0-rc4+
            version                : #1001 SMP Wed Oct 19 11:09:54 UTC 2011
            machine                : x86_64
            nr_cpus                : 4
            nr_nodes               : 1
            cores_per_socket       : 4
            threads_per_core       : 1
            cpu_mhz                : 2266
            hw_caps                : bfebfbff:28100800:00000000:00003b40:009ce3bd:00000000:00000001:00000000
            virt_caps              : hvm hvm_directio
            total_memory           : 6141
            free_memory            : 4274
            free_cpus              : 0
            outstanding_claims     : 0
            xen_major              : 4
            xen_minor              : 2
            xen_extra              : -unstable
            xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
            xen_scheduler          : credit
            xen_pagesize           : 4096
            platform_params        : virt_start=0xffff800000000000
            xen_changeset          : Wed Nov 02 17:09:09 2011 +0000 24066:54a5e994a241
            xen_commandline        : com1=115200,8n1 guest_loglvl=all dom0_mem=750M console=com1
            cc_compiler            : gcc version 4.4.5 (Debian 4.4.5-8)
            cc_compile_by          : sstabellini
            cc_compile_domain      : uk.xensource.com
            cc_compile_date        : Tue Nov  8 12:03:05 UTC 2011
            xend_config_format     : 4

           FIELDS

           Not all fields will be explained here, but some of the less obvious ones deserve
           explanation:

           hw_caps
               A vector showing what hardware capabilities are supported by your processor.  This is
               equivalent to, though more cryptic, the flags field in /proc/cpuinfo on a normal Linux
               machine: they both derive from the feature bits returned by the cpuid command on x86
               platforms.

           free_memory
               Available memory (in MB) not allocated to Xen, or any other domains, or claimed for
               domains.

           outstanding_claims
               When a claim call is done (see xl.conf) a reservation for a specific amount of pages is
               set and also a global value is incremented. This global value (outstanding_claims) is
               then reduced as the domain's memory is populated and eventually reaches zero. Most of
               the time the value will be zero, but if you are launching multiple guests, and
               claim_mode is enabled, this value can increase/decrease. Note that the value also
               affects the free_memory - as it will reflect the free memory in the hypervisor minus
               the outstanding pages claimed for guests.  See xl info claims parameter for detailed
               listing.

           xen_caps
               The Xen version and architecture.  Architecture values can be one of: x86_32, x86_32p
               (i.e. PAE enabled), x86_64, ia64.

           xen_changeset
               The Xen mercurial changeset id.  Very useful for determining exactly what version of
               code your Xen system was built from.

           OPTIONS

           -n, --numa
               List host NUMA topology information

       top Executes the xentop(1) command, which provides real time monitoring of domains.  Xentop has
           a curses interface, and is reasonably self explanatory.

       uptime
           Prints the current uptime of the domains running.

       claims
           Prints information about outstanding claims by the guests. This provides the outstanding
           claims and currently populated memory count for the guests.  These values added up reflect
           the global outstanding claim value, which is provided via the info argument,
           outstanding_claims value.  The Mem column has the cumulative value of outstanding claims
           and the total amount of memory that has been right now allocated to the guest.

           EXAMPLE

           An example format for the list is as follows:

            Name                                        ID   Mem VCPUs      State   Time(s)  Claimed
            Domain-0                                     0  2047     4     r-----      19.7     0
            OL5                                          2  2048     1     --p---       0.0   847
            OL6                                          3  1024     4     r-----       5.9     0
            Windows_XP                                   4  2047     1     --p---       0.0  1989

           In which it can be seen that the OL5 guest still has 847MB of claimed memory (out of the
           total 2048MB where 1191MB has been allocated to the guest).

SCHEDULER SUBCOMMANDS
       Xen ships with a number of domain schedulers, which can be set at boot time with the sched=
       parameter on the Xen command line.  By default credit is used for scheduling.

       sched-credit [OPTIONS]
           Set or get credit (aka credit1) scheduler parameters.  The credit scheduler is a
           proportional fair share CPU scheduler built from the ground up to be work conserving on SMP
           hosts.

           Each domain (including Domain0) is assigned a weight and a cap.

           OPTIONS

           -d DOMAIN, --domain=DOMAIN
               Specify domain for which scheduler parameters are to be modified or retrieved.
               Mandatory for modifying scheduler parameters.

           -w WEIGHT, --weight=WEIGHT
               A domain with a weight of 512 will get twice as much CPU as a domain with a weight of
               256 on a contended host. Legal weights range from 1 to 65535 and the default is 256.

           -c CAP, --cap=CAP
               The cap optionally fixes the maximum amount of CPU a domain will be able to consume,
               even if the host system has idle CPU cycles. The cap is expressed in percentage of one
               physical CPU: 100 is 1 physical CPU, 50 is half a CPU, 400 is 4 CPUs, etc. The default,
               0, means there is no upper cap.

               NB: Many systems have features that will scale down the computing power of a cpu that
               is not 100% utilized.  This can be in the operating system, but can also sometimes be
               below the operating system in the BIOS.  If you set a cap such that individual cores
               are running at less than 100%, this may have an impact on the performance of your
               workload over and above the impact of the cap. For example, if your processor runs at
               2GHz, and you cap a vm at 50%, the power management system may also reduce the clock
               speed to 1GHz; the effect will be that your VM gets 25% of the available power (50% of
               1GHz) rather than 50% (50% of 2GHz).  If you are not getting the performance you
               expect, look at performance and cpufreq options in your operating system and your BIOS.

           -p CPUPOOL, --cpupool=CPUPOOL
               Restrict output to domains in the specified cpupool.

           -s, --schedparam
               Specify to list or set pool-wide scheduler parameters.

           -t TSLICE, --tslice_ms=TSLICE
               Timeslice tells the scheduler how long to allow VMs to run before pre-empting.  The
               default is 30ms.  Valid ranges are 1ms to 1000ms.  The length of the timeslice (in ms)
               must be higher than the length of the ratelimit (see below).

           -r RLIMIT, --ratelimit_us=RLIMIT
               Ratelimit attempts to limit the number of schedules per second.  It sets a minimum
               amount of time (in microseconds) a VM must run before we will allow a higher-priority
               VM to pre-empt it.  The default value is 1000 microseconds (1ms).  Valid range is 100
               to 500000 (500ms).  The ratelimit length must be lower than the timeslice length.

           COMBINATION

           The following is the effect of combining the above options:

           <nothing>             : List all domain params and sched params from all pools
           -d [domid]            : List domain params for domain [domid]
           -d [domid] [params]   : Set domain params for domain [domid]
           -p [pool]             : list all domains and sched params for [pool]
           -s                    : List sched params for poolid 0
           -s [params]           : Set sched params for poolid 0
           -p [pool] -s          : List sched params for [pool]
           -p [pool] -s [params] : Set sched params for [pool]
           -p [pool] -d...       : Illegal
       sched-credit2 [OPTIONS]
           Set or get credit2 scheduler parameters.  The credit2 scheduler is a proportional fair
           share CPU scheduler built from the ground up to be work conserving on SMP hosts.

           Each domain (including Domain0) is assigned a weight.

           OPTIONS

           -d DOMAIN, --domain=DOMAIN
               Specify domain for which scheduler parameters are to be modified or retrieved.
               Mandatory for modifying scheduler parameters.

           -w WEIGHT, --weight=WEIGHT
               A domain with a weight of 512 will get twice as much CPU as a domain with a weight of
               256 on a contended host. Legal weights range from 1 to 65535 and the default is 256.

           -p CPUPOOL, --cpupool=CPUPOOL
               Restrict output to domains in the specified cpupool.

           -s, --schedparam
               Specify to list or set pool-wide scheduler parameters.

           -r RLIMIT, --ratelimit_us=RLIMIT
               Attempts to limit the rate of context switching. It is basically the same as
               --ratelimit_us in sched-credit

       sched-rtds [OPTIONS]
           Set or get rtds (Real Time Deferrable Server) scheduler parameters.  This rt scheduler
           applies Preemptive Global Earliest Deadline First real-time scheduling algorithm to
           schedule VCPUs in the system.  Each VCPU has a dedicated period and budget.  VCPUs in the
           same domain have the same period and budget.  While scheduled, a VCPU burns its budget.  A
           VCPU has its budget replenished at the beginning of each period; Unused budget is discarded
           at the end of each period.

           OPTIONS

           -d DOMAIN, --domain=DOMAIN
               Specify domain for which scheduler parameters are to be modified or retrieved.
               Mandatory for modifying scheduler parameters.

           -v VCPUID/all, --vcpuid=VCPUID/all
               Specify vcpu for which scheduler parameters are to be modified or retrieved.

           -p PERIOD, --period=PERIOD
               Period of time, in microseconds, over which to replenish the budget.

           -b BUDGET, --budget=BUDGET
               Amount of time, in microseconds, that the VCPU will be allowed to run every period.

           -c CPUPOOL, --cpupool=CPUPOOL
               Restrict output to domains in the specified cpupool.

           EXAMPLE

               1) Use -v all to see the budget and period of all the VCPUs of all the domains:

                   xl sched-rtds -v all
                   Cpupool Pool-0: sched=RTDS
                   Name                        ID VCPU    Period    Budget
                   Domain-0                     0    0     10000      4000
                   vm1                          1    0       300       150
                   vm1                          1    1       400       200
                   vm1                          1    2     10000      4000
                   vm1                          1    3      1000       500
                   vm2                          2    0     10000      4000
                   vm2                          2    1     10000      4000

               Without any arguments, it will output the default scheduling parameters for each
               domain:

                   xl sched-rtds
                   Cpupool Pool-0: sched=RTDS
                   Name                        ID    Period    Budget
                   Domain-0                     0     10000      4000
                   vm1                          1     10000      4000
                   vm2                          2     10000      4000

               2) Use, for instancei, -d vm1, -v all to see the budget and period of all VCPUs of a
               specific domain (vm1):

                   xl sched-rtds -d vm1 -v all
                   Name                        ID VCPU    Period    Budget
                   vm1                          1    0       300       150
                   vm1                          1    1       400       200
                   vm1                          1    2     10000      4000
                   vm1                          1    3      1000       500

               To see the parameters of a subset of the VCPUs of a domain, use:

                   xl sched-rtds -d vm1 -v 0 -v 3
                   Name                        ID VCPU    Period    Budget
                   vm1                          1    0       300       150
                   vm1                          1    3      1000       500

               If no -v is specified, the default scheduling parameters for the domain are shown:

                   xl sched-rtds -d vm1
                   Name                        ID    Period    Budget
                   vm1                          1     10000      4000

               3) Users can set the budget and period of multiple VCPUs of a specific domain with only
               one command, e.g., "xl sched-rtds -d vm1 -v 0 -p 100 -b 50 -v 3 -p 300 -b 150".

               To change the parameters of all the VCPUs of a domain, use -v all, e.g., "xl sched-rtds
               -d vm1 -v all -p 500 -b 250".

CPUPOOLS COMMANDS
       Xen can group the physical cpus of a server in cpu-pools. Each physical CPU is assigned at most
       to one cpu-pool. Domains are each restricted to a single cpu-pool. Scheduling does not cross
       cpu-pool boundaries, so each cpu-pool has its own scheduler.  Physical cpus and domains can be
       moved from one cpu-pool to another only by an explicit command.  Cpu-pools can be specified
       either by name or by id.

       cpupool-create [OPTIONS] [configfile] [variable=value ...]
           Create a cpu pool based an config from a configfile or command-line parameters.  Variable
           settings from the configfile may be altered by specifying new or additional assignments on
           the command line.

           See the xlcpupool.cfg(5) manpage for more information.

           OPTIONS

           -f=FILE, --defconfig=FILE
               Use the given configuration file.

       cpupool-list [OPTIONS] [cpu-pool]
           List CPU pools on the host.

           OPTIONS

           -c, --cpus
               If this option is specified, xl prints a list of CPUs used by cpu-pool.

       cpupool-destroy cpu-pool
           Deactivates a cpu pool.  This is possible only if no domain is active in the cpu-pool.

       cpupool-rename cpu-pool <newname>
           Renames a cpu-pool to newname.

       cpupool-cpu-add cpu-pool cpus|node:nodes
           Adds one or more CPUs or NUMA nodes to cpu-pool. CPUs and NUMA nodes can be specified as
           single CPU/node IDs or as ranges.

           For example:

            (a) xl cpupool-cpu-add mypool 4
            (b) xl cpupool-cpu-add mypool 1,5,10-16,^13
            (c) xl cpupool-cpu-add mypool node:0,nodes:2-3,^10-12,8

           means adding CPU 4 to mypool, in (a); adding CPUs 1,5,10,11,12,14,15 and 16, in (b); and
           adding all the CPUs of NUMA nodes 0, 2 and 3, plus CPU 8, but keeping out CPUs 10,11,12, in
           (c).

           All the specified CPUs that can be added to the cpupool will be added to it. If some CPU
           can't (e.g., because they're already part of another cpupool), an error is reported about
           each one of them.

       cpupool-cpu-remove cpus|node:nodes
           Removes one or more CPUs or NUMA nodes from cpu-pool. CPUs and NUMA nodes can be specified
           as single CPU/node IDs or as ranges, using the exact same syntax as in cpupool-cpu-add
           above.

       cpupool-migrate domain-id cpu-pool
           Moves a domain specified by domain-id or domain-name into a cpu-pool.  Domain-0 can't be
           moved to another cpu-pool.

       cpupool-numa-split
           Splits up the machine into one cpu-pool per numa node.

VIRTUAL DEVICE COMMANDS
       Most virtual devices can be added and removed while guests are running, assuming that the
       necessary support exists in the guest OS.  The effect to the guest OS is much the same as any
       hotplug event.

   BLOCK DEVICES
       block-attach domain-id disc-spec-component(s) ...
           Create a new virtual block device and attach it to the specified domain.  A disc
           specification is in the same format used for the disk variable in the domain config file.
           See xl-disk-configuration(5). This will trigger a hotplug event for the guest.

           Note that only PV block devices are supported by block-attach.  Requests to attach emulated
           devices (eg, vdev=hdc) will result in only the PV view being available to the guest.

       block-detach domain-id devid [OPTIONS]
           Detach a domain's virtual block device. devid may be the symbolic name or the numeric
           device id given to the device by domain 0.  You will need to run xl block-list to determine
           that number.

           Detaching the device requires the cooperation of the domain.  If the domain fails to
           release the device (perhaps because the domain is hung or is still using the device), the
           detach will fail.

           OPTIONS

           --force
               If this parameter is specified the device will be forcefully detached, which may cause
               IO errors in the domain.

       block-list domain-id
           List virtual block devices for a domain.

       cd-insert domain-id virtualdevice target
           Insert a cdrom into a guest domain's existing virtual cd drive. The virtual drive must
           already exist but can be empty. How the device should be presented to the guest domain is
           specified by the virtualdevice parameter; for example "hdc". Parameter target is the target
           path in the backend domain (usually domain 0) to be exported; can be a block device or a
           file etc.  See target in xl-disk-configuration(5).

           Only works with HVM domains.

       cd-eject domain-id virtualdevice
           Eject a cdrom from a guest domain's virtual cd drive, specified by virtualdevice. Only
           works with HVM domains.

   NETWORK DEVICES
       network-attach domain-id network-device
           Creates a new network device in the domain specified by domain-id.  network-device
           describes the device to attach, using the same format as the vif string in the domain
           config file. See xl.cfg(5) and xl-network-configuration(5) for more informations.

           Note that only attaching PV network interfaces is supported.

       network-detach domain-id devid|mac
           Removes the network device from the domain specified by domain-id.  devid is the virtual
           interface device number within the domain (i.e. the 3 in vif22.3). Alternatively, the mac
           address can be used to select the virtual interface to detach.

       network-list domain-id
           List virtual network interfaces for a domain.

   CHANNEL DEVICES
       channel-list domain-id
           List virtual channel interfaces for a domain.

   VIRTUAL TRUSTED PLATFORM MODULE (vTPM) DEVICES
       vtpm-attach domain-id vtpm-device
           Creates a new vtpm (virtual Trusted Platform Module) device in the domain specified by
           domain-id. vtpm-device describes the device to attach, using the same format as the vtpm
           string in the domain config file.  See xl.cfg(5) for more information.

       vtpm-detach domain-id devid|uuid
           Removes the vtpm device from the domain specified by domain-id.  devid is the numeric
           device id given to the virtual Trusted Platform Module device. You will need to run xl
           vtpm-list to determine that number. Alternatively, the uuid of the vtpm can be used to
           select the virtual device to detach.

       vtpm-list domain-id
           List virtual Trusted Platform Modules for a domain.

PCI PASS-THROUGH
       pci-assignable-list
           List all the assignable PCI devices.  These are devices in the system which are configured
           to be available for passthrough and are bound to a suitable PCI backend driver in domain 0
           rather than a real driver.

       pci-assignable-add BDF
           Make the device at PCI Bus/Device/Function BDF assignable to guests.  This will bind the
           device to the pciback driver.  If it is already bound to a driver, it will first be
           unbound, and the original driver stored so that it can be re-bound to the same driver later
           if desired.  If the device is already bound, it will return success.

           CAUTION: This will make the device unusable by Domain 0 until it is returned with pci-
           assignable-remove.  Care should therefore be taken not to do this on a device critical to
           domain 0's operation, such as storage controllers, network interfaces, or GPUs that are
           currently being used.

       pci-assignable-remove [-r] BDF
           Make the device at PCI Bus/Device/Function BDF not assignable to guests.  This will at
           least unbind the device from pciback.  If the -r option is specified, it will also attempt
           to re-bind the device to its original driver, making it usable by Domain 0 again.  If the
           device is not bound to pciback, it will return success.

       pci-attach domain-id BDF
           Hot-plug a new pass-through pci device to the specified domain.  BDF is the PCI
           Bus/Device/Function of the physical device to pass-through.

       pci-detach [OPTIONS] domain-id BDF
           Hot-unplug a previously assigned pci device from a domain. BDF is the PCI
           Bus/Device/Function of the physical device to be removed from the guest domain.

           OPTIONS

           -f  If this parameter is specified, xl is going to forcefully remove the device even
               without guest domain's collaboration.

       pci-list domain-id
           List pass-through pci devices for a domain.

USB PASS-THROUGH
       usbctrl-attach domain-id usbctrl-device
           Create a new USB controller in the domain specified by domain-id, usbctrl-device describes
           the device to attach, using form "KEY=VALUE KEY=VALUE ..." where KEY=VALUE has the same
           meaning as the usbctrl description in the domain config file.  See xl.cfg(5) for more
           information.

       usbctrl-detach domain-id devid
           Destroy a USB controller from the specified domain.  devid is devid of the USB controller.

       usbdev-attach domain-id usbdev-device
           Hot-plug a new pass-through USB device to the domain specified by domain-id, usbdev-device
           describes the device to attach, using form "KEY=VALUE KEY=VALUE ..." where KEY=VALUE has
           the same meaning as the usbdev description in the domain config file.  See xl.cfg(5) for
           more information.

       usbdev-detach domain-id controller=devid port=number
           Hot-unplug a previously assigned USB device from a domain.  controller=devid and
           port=number is USB controller:port in the guest domain the USB device is attached to.

       usb-list domain-id
           List pass-through usb devices for a domain.

DEVICE-MODEL CONTROL
       qemu-monitor-command domain-id command
           Issue a monitor command to the device model of the domain specified by domain-id. command
           can be any valid command qemu understands. This can be e.g. used to add non-standard
           devices or devices with non-standard parameters to a domain. The output of the command is
           printed to stdout.

           Warning: This qemu monitor access is provided for convenience when debugging,
           troubleshooting, and experimenting.  Its use is not supported by the Xen Project.

           Specifically, not all information displayed by the qemu monitor will necessarily be
           accurate or complete, because in a Xen system qemu does not have a complete view of the
           guest.

           Furthermore, modifying the guest's setup via the qemu monitor may conflict with the Xen
           toolstack's assumptions.  Resulting problems may include, but are not limited to: guest
           crashes; toolstack error messages; inability to migrate the guest; and security
           vulnerabilities which are not covered by the Xen Project security response policy.

           EXAMPLE

           Obtain information of USB devices connected as such via the device model (only!) to a
           domain:

            xl qemu-monitor-command vm1 'info usb'
             Device 0.2, Port 5, Speed 480 Mb/s, Product Mass Storage

TRANSCENDENT MEMORY (TMEM)
       tmem-list [OPTIONS] domain-id
           List tmem pools.

           OPTIONS

           -l  If this parameter is specified, also list tmem stats.

       tmem-freeze domain-id
           Freeze tmem pools.

       tmem-thaw domain-id
           Thaw tmem pools.

       tmem-set domain-id [OPTIONS]
           Change tmem settings.

           OPTIONS

           -w WEIGHT
               Weight (int)

           -p COMPRESS
               Compress (int)

       tmem-shared-auth domain-id [OPTIONS]
           De/authenticate shared tmem pool.

           OPTIONS

           -u UUID
               Specify uuid (abcdef01-2345-6789-1234-567890abcdef)

           -a AUTH
               0=auth,1=deauth

       tmem-freeable
           Get information about how much freeable memory (MB) is in-use by tmem.

FLASK
       FLASK is a security framework that defines a mandatory access control policy providing fine-
       grained controls over Xen domains, allowing the policy writer to define what interactions
       between domains, devices, and the hypervisor are permitted. Some example of what you can do
       using XSM/FLASK:
        - Prevent two domains from communicating via event channels or grants
        - Control which domains can use device passthrough (and which devices)
        - Restrict or audit operations performed by privileged domains
        - Prevent a privileged domain from arbitrarily mapping pages from other
          domains.

       You can find more details on how to use FLASK and an example security policy here:
       <http://xenbits.xen.org/docs/unstable/misc/xsm-flask.txt>

       getenforce
           Determine if the FLASK security module is loaded and enforcing its policy.

       setenforce 1|0|Enforcing|Permissive
           Enable or disable enforcing of the FLASK access controls. The default is permissive, but
           this can be changed to enforcing by specifying "flask=enforcing" or "flask=late" on the
           hypervisor's command line.

       loadpolicy policy-file
           Load FLASK policy from the given policy file. The initial policy is provided to the
           hypervisor as a multiboot module; this command allows runtime updates to the policy.
           Loading new security policy will reset runtime changes to device labels.

PLATFORM SHARED RESOURCE MONITORING/CONTROL
       Intel Haswell and later server platforms offer shared resource monitoring and control
       technologies. The availability of these technologies and the hardware capabilities can be shown
       with psr-hwinfo.

       See <http://xenbits.xen.org/docs/unstable/misc/xl-psr.html> for more information.

       psr-hwinfo [OPTIONS]
           Show Platform Shared Resource (PSR) hardware information.

           OPTIONS

           -m, --cmt
               Show Cache Monitoring Technology (CMT) hardware information.

           -a, --cat
               Show Cache Allocation Technology (CAT) hardware information.

   CACHE MONITORING TECHNOLOGY
       Intel Haswell and later server platforms offer monitoring capability in each logical processor
       to measure specific platform shared resource metric, for example, L3 cache occupancy. In the
       Xen implementation, the monitoring granularity is domain level. To monitor a specific domain,
       just attach the domain id with the monitoring service. When the domain doesn't need to be
       monitored any more, detach the domain id from the monitoring service.

       Intel Broadwell and later server platforms also offer total/local memory bandwidth monitoring.
       Xen supports per-domain monitoring for these two additional monitoring types. Both memory
       bandwidth monitoring and L3 cache occupancy monitoring share the same set of underlying
       monitoring service. Once a domain is attached to the monitoring service, monitoring data can be
       shown for any of these monitoring types.

       psr-cmt-attach domain-id
           attach: Attach the platform shared resource monitoring service to a domain.

       psr-cmt-detach domain-id
           detach: Detach the platform shared resource monitoring service from a domain.

       psr-cmt-show psr-monitor-type [domain-id]
           Show monitoring data for a certain domain or all domains. Current supported monitor types
           are:
            - "cache-occupancy": showing the L3 cache occupancy(KB).
            - "total-mem-bandwidth": showing the total memory bandwidth(KB/s).
            - "local-mem-bandwidth": showing the local memory bandwidth(KB/s).

   CACHE ALLOCATION TECHNOLOGY
       Intel Broadwell and later server platforms offer capabilities to configure and make use of the
       Cache Allocation Technology (CAT) mechanisms, which enable more cache resources (i.e. L3 cache)
       to be made available for high priority applications. In the Xen implementation, CAT is used to
       control cache allocation on VM basis. To enforce cache on a specific domain, just set capacity
       bitmasks (CBM) for the domain.

       Intel Broadwell and later server platforms also offer Code/Data Prioritization (CDP) for cache
       allocations, which support specifying code or data cache for applications. CDP is used on a per
       VM basis in the Xen implementation. To specify code or data CBM for the domain, CDP feature
       must be enabled and CBM type options need to be specified when setting CBM, and the type
       options (code and data) are mutually exclusive.

       psr-cat-cbm-set [OPTIONS] domain-id cbm
           Set cache capacity bitmasks(CBM) for a domain. For how to specify cbm please refer to
           <http://xenbits.xen.org/docs/unstable/misc/xl-psr.html>.

           OPTIONS

           -s SOCKET, --socket=SOCKET
               Specify the socket to process, otherwise all sockets are processed.

           -c, --code
               Set code CBM when CDP is enabled.

           -d, --data
               Set data CBM when CDP is enabled.

       psr-cat-show [domain-id]
           Show CAT settings for a certain domain or all domains.

IGNORED FOR COMPATIBILITY WITH XM
       xl is mostly command-line compatible with the old xm utility used with the old Python xend.
       For compatibility, the following options are ignored:

       xl migrate --live

TO BE DOCUMENTED
       We need better documentation for:

       tmem
           Transcendent Memory.

SEE ALSO
       The following man pages:

       xl.cfg(5), xlcpupool.cfg(5), xentop(1), xl-disk-configuration(5) xl-network-configuration(5)

       And the following documents on the xen.org website:

       <http://xenbits.xen.org/docs/unstable/misc/xsm-flask.txt>
       <http://xenbits.xen.org/docs/unstable/misc/xl-psr.html>

       For systems that don't automatically bring the CPU online:

       <http://wiki.xen.org/wiki/Paravirt_Linux_CPU_Hotplug>

BUGS
       Send bugs to xen-devel@lists.xen.org, see http://wiki.xen.org/xenwiki/ReportingBugs on how to
       send bug reports.

4.9.2                                         2018-04-12                                         xl(1)
