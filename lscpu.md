LSCPU(1)                                     User Commands                                    LSCPU(1)

NAME
       lscpu - display information about the CPU architecture

SYNOPSIS
       lscpu [options]

DESCRIPTION
       lscpu  gathers CPU architecture information from sysfs, /proc/cpuinfo and any applicable archi‐
       tecture-specific libraries (e.g. librtas on Powerpc).  The command output can be optimized  for
       parsing  or  for easy readability by humans.  The information includes, for example, the number
       of CPUs, threads, cores, sockets, and Non-Uniform Memory Access (NUMA) nodes.   There  is  also
       information  about  the  CPU caches and cache sharing, family, model, bogoMIPS, byte order, and
       stepping.

       In virtualized environments, the CPU architecture information displayed reflects the configura‐
       tion  of  the guest operating system which is typically different from the physical (host) sys‐
       tem.  On architectures that support retrieving physical topology information, lscpu  also  dis‐
       plays the number of physical sockets, chips, cores in the host system.

       Options  that  result  in an output table have a list argument.  Use this argument to customize
       the command output.  Specify a comma-separated list of column labels to limit the output  table
       to  only  the  specified  columns,  arranged in the specified order.  See COLUMNS for a list of
       valid column labels.  The column labels are not case sensitive.

       Not all columns are supported on all architectures.  If an  unsupported  column  is  specified,
       lscpu prints the column but does not provide any data for it.

       The  default  output formatting on terminal maybe optimized for better readability.  The output
       for non-terminals (e.g. pipes) is never affected by this  optimization  and  it  is  always  in
       "Field: data\n" format.

   COLUMNS
       Note that topology elements (core, socket, etc.) use a sequential unique ID starting from zero,
       but CPU logical numbers follow the kernel where there is no guarantee of sequential numbering.

       CPU    The logical CPU number of a CPU as used by the Linux kernel.

       CORE   The logical core number.  A core can contain several CPUs.

       SOCKET The logical socket number.  A socket can contain several cores.

       BOOK   The logical book number.  A book can contain several sockets.

       DRAWER The logical drawer number.  A drawer can contain several books.

       NODE   The logical NUMA node number.  A node can contain several drawers.

       CACHE  Information about how caches are shared between CPUs.

       ADDRESS
              The physical address of a CPU.

       ONLINE Indicator that shows whether the Linux instance currently makes use of the CPU.

       CONFIGURED
              Indicator that shows if the hypervisor has allocated the CPU to the virtual hardware  on
              which  the Linux instance runs.  CPUs that are configured can be set online by the Linux
              instance.  This column contains data only if your hardware system and hypervisor support
              dynamic CPU resource allocation.

       POLARIZATION
              This column contains data for Linux instances that run on virtual hardware with a hyper‐
              visor that can switch the CPU dispatching mode (polarization).  The polarization can be:

              horizontal  The workload is spread across all available CPUs.

              vertical    The workload is concentrated on few CPUs.

              For vertical polarization, the column also shows  the  degree  of  concentration,  high,
              medium,  or  low.  This column contains data only if your hardware system and hypervisor
              support CPU polarization.

       MAXMHZ Maximum megahertz value for the CPU. Useful when lscpu is used as hardware inventory in‐
              formation gathering tool.  Notice that the megahertz value is dynamic, and driven by CPU
              governor depending on current resource need.

       MINMHZ Minimum megahertz value for the CPU.

OPTIONS
       -a, --all
              Include lines for online and offline CPUs in the output (default for -e).   This  option
              may only be specified together with option -e or -p.

       -B, --bytes
              Print the sizes in bytes rather than in a human-readable format.

       -b, --online
              Limit the output to online CPUs (default for -p).  This option may only be specified to‐
              gether with option -e or -p.

       -C, --caches[=list]
              Display details about CPU caches.  For details about available  information  see  --help
              output.

              If the list argument is omitted, all columns for which data is available are included in
              the command output.

              When specifying the list argument, the string of option, equal sign (=), and  list  must
              not   contain   any   blanks  or  other  whitespace.   Examples:  '-C=NAME,ONE-SIZE'  or
              '--caches=NAME,ONE-SIZE'.

       -c, --offline
              Limit the output to offline CPUs.  This option may only be specified together  with  op‐
              tion -e or -p.

       -e, --extended[=list]
              Display the CPU information in human-readable format.

              If the list argument is omitted, all columns for which data is available are included in
              the command output.

              When specifying the list argument, the string of option, equal sign (=), and  list  must
              not  contain  any  blanks  or  other  whitespace.   Examples:  '-e=cpu,node'  or  '--ex‐
              tended=cpu,node'.

       -h, --help
              Display help text and exit.

       -J, --json
              Use JSON output format for the default summary or extended output (see --extended).

       -p, --parse[=list]
              Optimize the command output for easy parsing.

              If the list argument is omitted, the command output is compatible with earlier  versions
              of lscpu.  In this compatible format, two commas are used to separate CPU cache columns.
              If no CPU caches are identified the cache column is omitted.
              If the list argument is used, cache columns are separated with a colon (:).

              When specifying the list argument, the string of option, equal sign (=), and  list  must
              not   contain   any   blanks   or   other   whitespace.    Examples:   '-p=cpu,node'  or
              '--parse=cpu,node'.

       -s, --sysroot directory
              Gather CPU data for a Linux instance other than the instance from which the  lscpu  com‐
              mand  is issued.  The specified directory is the system root of the Linux instance to be
              inspected.

       -x, --hex
              Use hexadecimal masks for CPU sets (for example "ff").  The default is to print the sets
              in  list  format  (for  example  0,1).   Note that before version 2.30 the mask has been
              printed with 0x prefix.

       -y, --physical
              Display physical IDs for all columns with topology elements (core, socket, etc.).  Other
              than logical IDs, which are assigned by lscpu, physical IDs are platform-specific values
              that are provided by the kernel. Physical IDs are not necessarily unique and they  might
              not be arranged sequentially.  If the kernel could not retrieve a physical ID for an el‐
              ement lscpu prints the dash (-) character.

              The CPU logical numbers are not affected by this option.

       -V, --version
              Display version information and exit.

       --output-all
              Output all available columns.  This option must  be  combined  with  either  --extended,
              --parse or --caches.

BUGS
       The basic overview of CPU family, model, etc. is always based on the first CPU only.

       Sometimes in Xen Dom0 the kernel reports wrong data.

       On virtual hardware the number of cores per socket, etc. can be wrong.

AUTHOR
       Cai Qian <qcai@redhat.com>
       Karel Zak <kzak@redhat.com>
       Heiko Carstens <heiko.carstens@de.ibm.com>

SEE ALSO
       chcpu(8)

AVAILABILITY
       The  lscpu  command  is  part  of the util-linux package and is available from https://www.ker‐
       nel.org/pub/linux/utils/util-linux/.

util-linux                                    March 2019                                      LSCPU(1)
