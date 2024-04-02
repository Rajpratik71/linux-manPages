distcc(1)                              General Commands Manual                              distcc(1)

NAME
       distcc - distributed C/C++/ObjC compiler with distcc-pump extensions

SYNOPSIS
       distcc <compiler> [COMPILER OPTIONS]

       distcc [COMPILER OPTIONS]

       <compiler> [COMPILER OPTIONS]

       distcc [DISTCC OPTIONS]

DESCRIPTION
       distcc  distributes compilation of C code across several machines on a network.  distcc should
       always generate the same results as a local compile, it is simple to install and use,  and  it
       is often much faster than a local compile.

       This  version  incorporates plain distcc as well as an enhancement called pump mode or distcc-
       pump.

       For each job, distcc in plain mode sends the complete preprocessed source  code  and  compiler
       arguments  across  the  network from the client to a compilation server.  In pump mode, distcc
       sends the source code and recursively included header files (excluding those from the  default
       system  header  directories), so that both preprocessing and compilation can take place on the
       compilation servers. This speeds up the delivery of compilations by up to an order  of  magni‐
       tude over plain distcc.

       Compilation  is  driven by a client machine, which is typically the developer's workstation or
       laptop.  The distcc client runs on this machine, as does make, the preprocessor  (if  distcc's
       pump mode is not used), the linker, and other stages of the build process.  Any number of vol‐
       unteer machines act as compilation servers and help the client to build the program,  by  run‐
       ning the distccd(1) daemon, C compiler and assembler as required.

       distcc  can  run across either TCP sockets (on port 3632 by default), or through a tunnel com‐
       mand such as ssh(1).  For TCP connections the volunteers must run the distccd(1) daemon either
       directly  or from inetd.  For SSH connections distccd must be installed but should not be lis‐
       tening for connections.

       TCP connections should only be used on secure networks because there is no user authentication
       or  protection  of source or object code.  SSH connections are typically 25% slower because of
       processor overhead for encryption, although this can vary greatly depending on  CPUs,  network
       and the program being built.

       distcc is intended to be used with GNU Make's -j option, which runs several compiler processes
       concurrently.  distcc spreads the jobs across both local and remote CPUs.  Because  distcc  is
       able to distribute most of the work across the network, a higher concurrency level can be used
       than for local builds.  As a rule of thumb, the -j value should be  set  to  about  twice  the
       total  number of available server CPUs but subject to client limitations.  This setting allows
       for maximal interleaving of tasks being blocked waiting for disk  or  network  IO.  Note  that
       distcc  can also work with other build control tools, such as SCons, where similar concurrency
       settings must be adjusted.

       The -j setting, especially for large values of -j, must take into account the CPU load on  the
       client.   Additional  measures may be needed to curtail the client load.  For example, concur‐
       rent linking should be severely curtailed using auxiliary locks.  The effect  of  other  build
       activity,  such  as  Java  compilation  when  building  mixed code, should be considered.  The
       --localslots_cpp parameter is by default set to 16.  This limits the number of concurrent pro‐
       cesses  that  do  preprocessing  in plain distcc (non-pump) mode.  Therefore, larger -j values
       than 16 may be used without overloading a single-CPU client due to preprocessing.  Such  large
       values may speed up parts of the build that do not involve C compilations, but they may not be
       useful to distcc efficiency in plain mode.

       In contrast, using pump mode and say 40 servers, a setting of -j80 or larger may be  appropri‐
       ate even for single-CPU clients.

       It is strongly recommended that you install the same compiler version on all machines partici‐
       pating in a build.  Incompatible compilers may cause mysterious compile or link failures.

QUICKSTART
       1      For each machine, download distcc, unpack, and install.

       2      On each of the servers, run distccd --daemon with --allow options to restrict access.

       3      Put the names of the servers in your environment:
              $ export DISTCC_HOSTS='localhost red green blue'

       4      Build!
              $ make -j8 CC=distcc

QUICKSTART FOR DISTCC-PUMP MODE
       Proceed as above, but in Step 3, specify that the remote hosts are to carry the burden of pre‐
       processing and that the files sent over the network should be compressed:

              $ export DISTCC_HOSTS='--randomize localhost red,cpp,lzo green,cpp,lzo blue,cpp,lzo'

       The  --randomize  option enforces a uniform usage of compile servers.  While you will get some
       benefit from distcc's pump mode with only a few servers, you get increasing benefit with  more
       server  CPUs (up to the hundreds!).  Wrap your build inside the pump command, here assuming 10
       servers:

              $ distcc-pump make -j20 CC=distcc

HOW PLAIN (NON-PUMP) DISTCC WORKS
       distcc only ever runs the compiler and assembler remotely.  With plain distcc, the  preproces‐
       sor  must  always  run  locally  because  it needs to access various header files on the local
       machine which may not be present, or may not be the same, on the volunteer.  The linker  simi‐
       larly needs to examine libraries and object files, and so must run locally.

       The compiler and assembler take only a single input file (the preprocessed source) and produce
       a single output (the object file).  distcc ships these two files across the  network  and  can
       therefore run the compiler/assembler remotely.

       Fortunately, for most programs running the preprocessor is relatively cheap, and the linker is
       called relatively infrequent, so most of the work can be distributed.

       distcc examines its command line to determine which of these phases  are  being  invoked,  and
       whether the job can be distributed.

HOW DISTCC-PUMP MODE WORKS
       In pump mode, distcc runs the preprocessor remotely too.  To do so, the preprocessor must have
       access to all the files that it would have accessed if had  been  running  locally.   In  pump
       mode,  therefore, distcc gathers all of the recursively included headers, except the ones that
       are default system headers, and sends them along with  the  source  file  to  the  compilation
       server.

       In  distcc-pump mode, the server unpacks the set of all source files in a temporary directory,
       which contains a directory tree that mirrors the part of the file system that is  relevant  to
       preprocessing, including symbolic links.

       The compiler is then run from the path in the temporary directory that corresponds to the cur‐
       rent working directory on the client.  To find and transmit the many hundreds  of  files  that
       are  often  part of a single compilation, pump mode uses an incremental include analysis algo‐
       rithm.  The include server is a Python program that implements this  algorithm.   The  distcc-
       pump  command  starts  the  include  server so that throughout the build it can answer include
       queries by distcc commands.

       The include server uses static analysis of the macro language to deal with conditional  compi‐
       lation  and computed includes.  It uses the property that when a given header file has already
       been analyzed for includes, it is not necessary to do so again  if  all  the  include  options
       (-I's) are unchanged (along with other conditions).

       For  large builds, header files are included, on average, hundreds of times each. With distcc-
       pump mode each such file is analyzed only a few times, perhaps just  once,  instead  of  being
       preprocessed hundreds of times.  Also, each source or header file is now compressed only once,
       because the include server memoizes the compressed files.  As a result, the time used for pre‐
       paring  compilations  may  drop by up to an order of magnitude over the preprocessing of plain
       distcc.

       Because distcc in pump mode is able to push out files up to  about  ten  times  faster,  build
       speed may increase 3X or more for large builds compared to plain distcc mode.

RESTRICTIONS FOR PUMP MODE
       Using  pump  mode  requires  both client and servers to use release 3.0 or later of distcc and
       distccd (respectively).

       The incremental include analysis of distc-pump mode rests on the fundamental  assumption  that
       source  and header files do not change during the build process.  A few complex build systems,
       such as that for Linux kernel 2.6, do not quite satisfy this requirement.   To  overcome  such
       issues,   and   other   corner   cases  such  as  absolute  filepaths  in  includes,  see  the
       include_server(1) man page.

       Another important assumption is that the include configuration of all machines must be identi‐
       cal.   Thus  the headers under the default system path must be the same on all servers and all
       clients.  If a standard GNU compiler installation is used, then this  requirement  applies  to
       all  libraries  whose  header  files  are installed under /usr/include or /usr/local/include/.
       Note that installing software packages often lead to additional headers files being placed  in
       subdirectories of either.

       If  this  assumption does not hold, then it is possible to break builds with distcc-pump mode,
       or worse, to get wrong results without warning.  Presently this condition is not verified, and
       it is on our TODO list to address this issue.

       An  easy way to guarantee that the include configurations are identical is to use a cross-com‐
       piler that defines a default system search path restricted  to  directories  of  the  compiler
       installation.

       See  the include_server(1) manual for more information on symptoms and causes of violations of
       distcc-pump mode assumptions.

OPTION SUMMARY
       Most options passed to distcc are interpreted as compiler options.  The following options  are
       understood  by  distcc  itself.  If any of these options are specified, distcc will not invoke
       the compiler.

       --help Displays summary instructions.

       --version
              Displays the distcc client version.

       --show-hosts
              Displays the host list that distcc would use.  See the Host Specifications section.

       --scan-includes
              Displays the list of files that distcc would send to the remote machine, as computed by
              the  include  server.   This  is  a conservative (over-)approximation of the files that
              would be read by the C compiler.  This option only works in pump mode.   See  the  "How
              Distcc-pump Mode Works" section for details on how this is computed.

              The  list  output by distcc --scan-includes will contain one entry per line.  Each line
              contains a category followed by a path.  The category is one of FILE,  SYMLINK,  DIREC‐
              TORY, or SYSTEMDIR:

              FILE  indicates  a  source  file or header file that would be sent to the distcc server
              host.

              SYMLINK indicates a symbolic link that would be sent to the distcc server host.

              DIRECTORY indicates a directory that may be needed in order to compile the source file.
              For example, a directory "foo" may be needed because of an include of the form #include
              "foo/../bar.h".  Such directories would be created on the distcc server host.

              SYSTEMDIR indicates a system include directory, i.e. a directory which is on  the  com‐
              piler's  default  include path, such as "/usr/include"; such directories are assumed to
              be present on the distcc server host, and so would not be sent  to  the  distcc  server
              host.

       -j     Displays  distcc's concurrency level, as calculated from the host list; it is the maxi‐
              mum number of outstanding jobs issued by this client to all servers.  By  default  this
              will  be  four times the number of hosts in the host list, unless the /LIMIT option was
              used in the host list.  See the Host Specifications section.

INSTALLING DISTCC
       There are three different ways to call distcc, to suit different circumstances:

              distcc can be installed under the name of the real compiler, to intercept calls  to  it
              and  run  them remotely.  This "masqueraded" compiler has the widest compatibility with
              existing source trees, and is convenient when you want to use distcc for  all  compila‐
              tion.  The fact that distcc is being used is transparent to the makefiles.

              distcc  can  be  prepended to compiler command lines, such as "distcc cc -c hello.c" or
              CC="distcc gcc".  This is convenient when you want to use distcc for only some compila‐
              tions  or  to  try  it  out,  but  can cause trouble with some makefiles or versions of
              libtool that assume $CC does not contain a space.

              Finally, distcc can be used directly as a compiler.  "cc" is always used as the name of
              the  real compiler in this "implicit" mode.  This can be convenient for interactive use
              when "explicit" mode does not work but is not really recommended for new use.

       Remember that you should not use two methods for calling distcc at the same time.  If you  are
       using a masquerade directory, don't change CC and/or CXX, just put the directory early on your
       PATH.  If you're not using a masquerade directory, you'll need to either change CC and/or CXX,
       or modify the makefile(s) to call distcc explicitly.

MASQUERADING
       The basic idea is to create a "masquerade directory" which contains links from the name of the
       real compiler to the distcc binary.  This directory is inserted early on  the  PATH,  so  that
       calls  to  the compiler are intercepted and distcc is run instead.  distcc then removes itself
       from the PATH to find the real compiler.

       For example:

              # mkdir /usr/lib/distcc/bin
              # cd /usr/lib/distcc/bin
              # ln -s ../../../bin/distcc gcc
              # ln -s ../../../bin/distcc cc
              # ln -s ../../../bin/distcc g++
              # ln -s ../../../bin/distcc c++

       Then, to use distcc, a user just needs to put the directory /usr/lib/distcc/bin early  in  the
       PATH, and have set a host list in DISTCC_HOSTS or a file.  distcc will handle the rest.

       Note  that  this  masquerade  directory must occur on the PATH earlier than the directory that
       contains the actual compilers of the same names, and that any auxiliary  programs  that  these
       compilers call (such as as or ld) must also be found on the PATH in a directory after the mas‐
       querade directory since distcc calls out to the real compiler with a PATH value that  has  all
       directory up to and including the masquerade directory trimmed off.

       It is possible to get a "recursion error" in masquerade mode, which means that distcc is some‐
       how finding itself again, not the real compiler.  This can indicate that you have two masquer‐
       ade  directories on the PATH, possibly because of having two distcc installations in different
       locations.  It can also indicate that you're trying to mix "masqueraded" and "explicit" opera‐
       tion.

       Recursion  errors  can  be  avoided  by using shell scripts instead of links.  For example, in
       /usr/lib/distcc/bin create a file cc which contains:

              #!/bin/sh
              distcc /usr/bin/gcc "$@"

       In this way, we are not dependent on distcc having to locate the real gcc by investigating the
       PATH variable. Instead, the compiler location is explicitly provided.

USING DISTCC WITH CCACHE
       ccache  is  a  program  that  speeds  software  builds by caching the results of compilations.
       ccache is normally called before distcc, so that results are retrieved from  a  normal  cache.
       Some  experimentation  may  be  required  for  idiosyncratic makefiles to make everything work
       together.

       The most reliable method is to set

              CCACHE_PREFIX="distcc"

       This tells ccache to run distcc as a wrapper around the real compiler.  ccache still uses  the
       real compiler to detect compiler upgrades.

       ccache  can then be run using either a masquerade directory or by setting

              CC="ccache gcc"

       As  of  version  2.2,  ccache  does not cache compilation from preprocessed source and so will
       never get a cache hit if it is run from distccd or distcc.  It must be run only on the  client
       side and before distcc to be any use.

       distcc's pump mode is not compatible with ccache.

HOST SPECIFICATIONS
       A  "host  list" tells distcc which machines to use for compilation.  In order, distcc looks in
       the $DISTCC_HOSTS environment variable, the user's $DISTCC_DIR/hosts file, and the system-wide
       host file.  If no host list can be found, distcc emits a warning and compiles locally.

       The  host list is a simple whitespace separated list of host specifications.  The simplest and
       most common form is a host names, such as

              localhost red green blue

       distcc prefers hosts towards the start of the list, so machines should be listed in descending
       order of speed.  In particular, when only a single compilation can be run (such as from a con‐
       figure script), the first machine listed is used (but see --randomize below).

       Placing localhost at the right point in the list is important  to  getting  good  performance.
       Because  overhead  for  running jobs locally is low, localhost should normally be first.  How‐
       ever, it is important that the client have enough cycles free to run the local  jobs  and  the
       distcc  client.  If the client is slower than the volunteers, or if there are many volunteers,
       then the client should be put later in the list or not at all.  As  a  general  rule,  if  the
       aggregate  CPU speed of the client is less than one fifth of the total, then the client should
       be left out of the list.

       If you have a large shared build cluster and a single shared hosts file, the above rules would
       cause  the  first few machines in the hosts file to be tried first even though they are likely
       to be busier than machines later in the list.  To avoid this, place  the  keyword  --randomize
       into the host list.  This will cause the host list to be randomized, which should improve per‐
       formance slightly for large build clusters.

       There are two special host names  --localslots  and  --localslots_cpp  which  are  useful  for
       adjusting  load on the local machine.  The --localslots host specifies how many jobs that can‐
       not be run remotely that can be run concurrently on the local machine, while  --localslots_cpp
       controls  how many preprocessors will run in parallel on the local machine.  Tuning these val‐
       ues can improve performance.  Linking on large projects can  take  large  amounts  of  memory.
       Running  parallel  linkers, which cannot be executed remotely,  may force the machine to swap,
       which reduces performance over just running the jobs in sequence without  swapping.    Getting
       the number of parallel preprocessors just right allows you to use larger parallel factors with
       make, since the local machine now has some machanism for measuring local resource usage.

       Finally there is the host entry

       Performance depends on the details of the source and makefiles used for the project,  and  the
       machine  and  network  speeds.  Experimenting with different settings for the host list and -j
       factor may improve performance.

       The syntax is

         DISTCC_HOSTS = HOSTSPEC ...
         HOSTSPEC = LOCAL_HOST | SSH_HOST | TCP_HOST | OLDSTYLE_TCP_HOST
                               | GLOBAL_OPTION
                               | ZEROCONF
         LOCAL_HOST = localhost[/LIMIT]
                    | --localslots=<int>
                    | --localslots_cpp=<int>
         SSH_HOST = [USER]@HOSTID[/LIMIT][:COMMAND][OPTIONS]
         TCP_HOST = HOSTID[:PORT][/LIMIT][OPTIONS]
         OLDSTYLE_TCP_HOST = HOSTID[/LIMIT][:PORT][OPTIONS]
         HOSTID = HOSTNAME | IPV4 | IPV6
         OPTIONS = ,OPTION[OPTIONS]
         OPTION = lzo | cpp
         GLOBAL_OPTION = --randomize
         ZEROCONF = +zeroconf

       Here are some individual examples of the syntax:

       localhost
              The literal word "localhost" is interpreted  specially  to  cause  compilations  to  be
              directly executed, rather than passed to a daemon on the local machine.  If you do want
              to connect to a daemon on the local machine for testing, then  give  the  machine's  IP
              address or real hostname.  (This will be slower.)

       IPV6   A literal IPv6 address enclosed in square brackets, such as [::1]

       IPV4   A literal IPv4 address, such as 10.0.0.1

       HOSTNAME
              A hostname to be looked up using the resolver.

       :PORT  Connect to a specified decimal port number, rather than the default of 3632.

       @HOSTID
              Connect  to  the host over SSH, rather than TCP.  Options for the SSH connection can be
              set in ~/.ssh/config

       USER@  Connect to the host over SSH as a specified username.

       :COMMAND
              Connect over SSH, and use a specified path to find the distccd server.   This  is  nor‐
              mally  only needed if for some reason you can't install distccd into a directory on the
              default PATH for SSH connections.  Use this if you get errors  like  "distccd:  command
              not found" in SSH mode.

       /LIMIT A  decimal  limit can be added to any host specification to restrict the number of jobs
              that this client will send to the machine.  The limit defaults to four  per  host  (two
              for  localhost),  but may be further restricted by the server.  You should only need to
              increase this for servers with more than two processors.

       ,lzo   Enables LZO compression for this TCP or SSH host.

       ,cpp   Enables distcc-pump mode for this host.  Note: the build command must be wrapped in the
              distcc-pump script in order to start the include server.

       --randomize
              Randomize the order of the host list before execution.

       +zeroconf
              This option is only available if distcc was compiled with Avahi support enabled at con‐
              figure time.  When this special entry is present in the hosts  list,  distcc  will  use
              Avahi  Zeroconf  DNS Service Discovery (DNS-SD) to locate any available distccd servers
              on the local network.  This avoids the need to explicitly list the  host  names  or  IP
              addresses  of  the  distcc server machines.  The distccd servers must have been started
              with the "--zeroconf" option to distccd.  An important caveat is that  in  the  current
              implementation,  pump  mode  (",cpp")  and  compression (",lzo") will never be used for
              hosts located via zeroconf.

       Here is an example demonstrating some possibilities:

              localhost/2 @bigman/16:/opt/bin/distccd oldmachine:4200/1
              # cartman is down
              distant/3,lzo

       Comments are allowed in host specifications.  Comments start with a hash/pound  sign  (#)  and
       run to the end of the line.

       If  a  host  in  the list is not reachable distcc will emit a warning and ignore that host for
       about one minute.

COMPRESSION
       The lzo host option specifies that LZO compression should be used for data transfer, including
       preprocessed  source,  object  code  and error messages.  Compression is usually economical on
       networks slower than 100Mbps, but results may vary depending on the  network,  processors  and
       source tree.

       Enabling  compression  makes  the distcc client and server use more CPU time, but less network
       traffic.  The added CPU time is insignificant for pump mode.  The compression ratio  is  typi‐
       cally 4:1 for source and 2:1 for object code.

       Using  compression  requires both client and server to use at least release 2.9 of distcc.  No
       server configuration is required: the server always responds with compressed replies  to  com‐
       pressed requests.

       Pump mode requires the servers to have the lzo host option on.

SEARCH PATHS
       If the compiler name is an absolute path, it is passed verbatim to the server and the compiler
       is run from that directory.  For example:

              distcc /usr/local/bin/gcc-3.1415 -c hello.c

       If the compiler name is not absolute, or not fully  qualified,  distccd's  PATH  is  searched.
       When  distcc  is  run from a masquerade directory, only the base name of the compiler is used.
       The client's PATH is used only to run the preprocessor and has no effect on the server's path.

TIMEOUTS
       Both the distcc client and server impose timeouts on transfer  of  data  across  the  network.
       This  is intended to detect hosts which are down or unreachable, and to prevent compiles hang‐
       ing indefinitely if a server is disconnected while in use.  If a client-side timeout  expires,
       the job will be re-run locally.

       The timeouts are not configurable at present.

DIAGNOSTICS
       Error  messages  or  warnings  from local or remote compilers are passed through to diagnostic
       output on the client.

       distcc can supply extensive debugging information when the verbose option is  used.   This  is
       controlled  by the DISTCC_VERBOSE environment variable on the client, and the --verbose option
       on the server.  For troubleshooting, examine both the client and server error messages.

EXIT CODES
       The exit code of distcc is normally that of the compiler: zero for successful compilation  and
       non-zero otherwise.

       distcc distinguishes between "genuine" errors such as a syntax error in the source, and "acci‐
       dental" errors such as a networking problem connecting to a volunteer.  In the case  of  acci‐
       dental errors, distcc will retry the compilation locally unless the DISTCC_FALLBACK option has
       been disabled.

       If the compiler exits with a signal, distcc returns an exit code of 128 plus the  signal  num‐
       ber.

       distcc internal errors cause an exit code between 100 and 127.  In particular

       100    General distcc failure.

       101    Bad arguments.

       102    Bind failed.

       103    Connect failed.

       104    Compiler crashed.

       105    Out of memory.

       106    Bad Host SPEC

       107    I/O Error

       108    Truncated.

       109    Protocol Error.

       110    The  given  compiler was not found on the remote host.  Check that $CC is set appropri‐
              ately and that it's installed in a directory on the search path for distccd.

       111    Recursive call to distcc.

       112    Failed to discard privileges.

       113    Network access denied.

       114    In use by another process.

       115    No such file.

       116    No hosts defined and fallbacks disabled.

       118    Timeout.

FILES
       If $DISTCC_HOSTS is not set, distcc reads a host list from either $DISTCC_DIR/hosts or a  sys‐
       tem-wide  configuration  file set at compile time.  The file locations are shown in the output
       from distcc --help

       distcc creates a number of temporary and lock files underneath the temporary directory.

ENVIRONMENT VARIABLES
       distcc's behaviour is controlled by a number of environment variables.  For most cases nothing
       need be set if the host list is stored in a file.

       DISTCC_HOSTS
              Space-separated list of volunteer host specifications.

       DISTCC_VERBOSE
              If  set  to  1, distcc produces explanatory messages on the standard error stream or in
              the log file.  This can be helpful in debugging problems.  Bug reports  should  include
              verbose output.

       DISTCC_LOG
              Log file to receive messages from distcc itself, rather than stderr.

       DISTCC_FALLBACK
              By  default distcc will compile locally if it fails to distribute a job to the intended
              machine, or if no host list can be found.  If this variable is set to 0 then  fallbacks
              are  disabled  and those compilations will simply fail.  Note that this does not affect
              jobs which must always be local such as linking.

       DISTCC_SAVE_TEMPS
              If set to 1, temporary files are not deleted after use.  Good for debugging, or if your
              disks are too empty.

       DISTCC_TCP_CORK
              If set to 0, disable use of "TCP corks", even if they're present on this system.  Using
              corks normally helps pack requests into  fewer  packets  and  aids  performance.   This
              should normally be left enabled.

       DISTCC_SSH
              Specifies  the  command used for opening SSH connections.  Defaults to "ssh" but may be
              set to a different connection command such as "lsh" or "tsocks-ssh" that accepts a sim‐
              ilar command line.  The command is not split into words and is not executed through the
              shell.

       DISTCC_DIR
              Per-user configuration directory to store lock  files  and  state  files.   By  default
              ~/.distcc/ is used.

       TMPDIR Directory for temporary files such as preprocessor output.  By default /tmp/ is used.

       UNCACHED_ERR_FD
              If  set  and if DISTCC_LOG is not set, distcc errors are written to the file descriptor
              identified by this variable.  This variable is intended mainly  for  automatic  use  by
              ccache, which sets it to avoid caching transient errors such as network problems.

       DISTCC_ENABLE_DISCREPANCY_EMAIL
              If  set,  distcc  sends  an  email  when  a  compilation failed remotely, but succeeded
              locally.  Built-in heuristics prevent some such discrepancy email from  being  sent  if
              the problem is that a local file changed between the failing remote compilation and the
              succeeding local compilation.

       DCC_EMAILLOG_WHOM_TO_BLAME
              The email address for discrepancy email; the default is "distcc-pump-errors".

CROSS COMPILING
       Cross compilation means building programs to run on a  machine  with  a  different  processor,
       architecture, or operating system to where they were compiled.  distcc supports cross compila‐
       tion, including teams of mixed-architecture machines, although some changes to the compilation
       commands may be required.

       The  compilation command passed to distcc must be one that will execute properly on every vol‐
       unteer machine to produce an object file of the appropriate type.  If the machines  have  dif‐
       ferent  processors, then simply using distcc cc will probably not work, because that will nor‐
       mally invoke the volunteer's native compiler.

       Machines with the same CPU but different operating systems may not necessarily  generate  com‐
       patible .o files.

       Several  different  gcc  configurations  can be installed side-by-side on any machine.  If you
       build gcc from source, you should use the --program-suffix configuration options to  cause  it
       to be installed with a name that encodes the gcc version and the target platform.

       The recommended convention for the gcc name is TARGET-gcc-VERSION such as i686-linux-gcc-3.2 .
       GCC 3.3 will install itself under this name, in addition to TARGET-gcc and,  if  it's  native,
       gcc-VERSION and gcc .

       The  compiler  must  be  installed  under  the  same name on the client and on every volunteer
       machine.

BUGS
       If you think you have found a  distcc bug, please see the file reporting-bugs.txt in the docu‐
       mentation directory for information on how to report it.

       Some  makefiles  have  missing  or  extra  dependencies  that cause incorrect or slow parallel
       builds.  Recursive make is inefficient and can leave processors unnecessarily  idle  for  long
       periods.  (See Recursive Make Considered Harmful by Peter Miller.)  Makefile bugs are the most
       common cause of trees failing to build under distcc.  Alternatives to Make such as  SCons  can
       give much faster builds for some projects.

       Using  different  versions  of gcc can cause confusing build problems because the header files
       and binary interfaces have changed over time, and some distributors have included incompatible
       patches without changing the version number.  distcc does not protect against using incompati‐
       ble versions.  Compiler errors about link problems or declarations in system header files  are
       usually due to mismatched or incorrectly installed compilers.

       gcc's  -MD option can produce output in the wrong directory if the source and object files are
       in different directories and the -MF option is not used.  There is no perfect solution because
       of  incompatible  changes  between  gcc versions.  Explicitly specifying the dependency output
       file with -MF will fix the problem.

       TCP mode connections should only be used on trusted networks.

       Including slow machines in the list of volunteer hosts can slow the build down.

       When distcc or ccache is used on NFS,  the  filesystem  must  be  exported  with  the  no_sub‐
       tree_check option to allow reliable renames between directories.

       The  compiler can be invoked with a command line gcc hello.c to both compile and link.  distcc
       doesn't split this into separate parts, but rather runs the whole thing locally.

       distcc-pump mode reverts to plain distcc mode for source  files  that  contain  includes  with
       absolute paths (either directly or in an included file).

       Due to limitations in gcc, gdb may not be able to automatically find the source files for pro‐
       grams built using distcc in some circumstances.  The gdb directory command can be  used.   For
       distcc's plain (non-pump) mode, this is fixed in gcc 3.4 and later.  For pump mode, the fix in
       gcc 3.4 does not suffice; we've worked around the gcc limitation by rewriting the object files
       that  gcc  produces, but this is only done for ELF object files, but not for other object file
       formats.

       The .o files produced by discc in pump mode will be different from those produced locally: for
       non-ELF files, the debug information will specify compile directories of the server.  The code
       itself should be identical.

       For the ELF-format, distcc rewrites the .o files to correct compile  directory  path  informa‐
       tion.   While  the  resulting .o files are not bytewise identical to what would have been pro‐
       duced by compiling on the local client (due to different padding, etc), they should  be  func‐
       tionally identical.

       In  distcc-pump mode, the include server is unable to handle certain very complicated computed
       includes as found in parts of the Boost library. The include server will time out  and  distcc
       will revert to plain mode.

       In  distcc-pump  mode, certain assumptions are made that source and header files do not change
       during  the   build.    See   discussion   in   section   DISTCC   DISCREPANCY   SYMPTOMS   of
       include_server(1().

       Other known bugs may be documented on http://code.google.com/p/distcc/

AUTHOR
       distcc was written by Martin Pool <mbp@sourcefrog.net>, with the co-operation of many scholars
       including Wayne Davison, Frerich Raabe, Dimitri Papadopoulos and  others  noted  in  the  NEWS
       file.   Please report bugs to <distcc@lists.samba.org>.  See distcc-pump(1) for the authors of
       pump mode.

LICENCE
       You are free to use distcc.  distcc (including this manual) may be copied,  modified  or  dis‐
       tributed  only  under  the terms of the GNU General Public Licence version 2 or later.  distcc
       comes with absolutely no warrany.  A copy of the GPL is included in the file COPYING.

SEE ALSO
       distccd(1),   distcc-pump(1),   include_server(1),   gcc(1),    make(1),    and     ccache(1).
       http://code.google.com/p/distcc/ http://ccache.samba.org/

                                             9 June 2008                                    distcc(1)
