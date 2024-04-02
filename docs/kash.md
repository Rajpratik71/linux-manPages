KANIF(1)                                                       kanif TakTuk Wrapper                                                       KANIF(1)

NAME
       kanif - a TakTuk wrapper for cluster management

SYNOPSIS
       kash|kaget|kaput [-aFHhimqsV] [-f conf-file] [-l login] [-M machines-list] [-n|-w nodes] [-o options] [-p level] [-r command] [-T options]
       [-t timeout] [-u timeout] [-x nodes] [machines specifications] [command body]

DESCRIPTION
       kanif is a tool for cluster management and administration. It combines main features of well known cluster management tools such as c3,
       pdsh and dsh and mimics their syntax. For the effective cluster management it relies on TakTuk, a tool for large scale remote execution
       deployment.

       For simple parallel tasks that have to be executed on regular machines such as clusters, TakTuk syntax is too complicated.  The goal of
       kanif is to provide an easier and familiar syntax to cluster administrators while still taking advantage of TakTuk characteristics and
       features (adaptivity, scalability, portability, autopropagation and information redirection).

       To work, kanif needs to find the "taktuk" command (version 3.3 and above) in the user path. The other requirements are the same as TakTuk:
       it requires, on all the nodes of the cluster, a working Perl interpreter (version 5.8 and above) and a command to log without password
       (such as "ssh" with proper rsa keys installed).

       kanif provides three simple commands for clusters administration and management:

       kash: runs the same command on multiple nodes
       kaput: broadcasts the copy of files or directories to several nodes
       kaget: gathers several remote files or directories

       kanif combines the advantages of several cluster management tools.  Its main features can be summarized as follows:

       ·   C3-style configuration file for static clusters setups

       ·   pdsh-like options such as nodes ranges and timeouts

       ·   dshbak-like gathering, sorting and merging of output

       As with "pdsh", kanif deployment can be monitored and controlled by signals.  When kanif receives a SIGINT (usually sent by typing Ctrl-C),
       it displays a brief summary of its deployment state and commands execution progress. After this first SIGINT, if kanif receives a second
       signal within one second:

       ·   it terminates its execution (cancelling any ongoing task) if this is a SIGINT

       ·   it cancels any ongoing connections and start executions on the already deployed nodes if this is a SIGTSTP (usually sent by typing
           Ctrl-Z)

       At the end of executions, kanif also reports a quick summary of failures: connections and commands execution.

OPTIONS
       To help administrators in their task, kanif options syntax is as close as possible to C3/pdsh/dsh well known tools.

       -a
       --all
           Deploys on all nodes of all configured clusters.

       -f conf-file
       --file conf-file
           Uses "conf-file" as configuration file instead of default. Several possibilities are examined for default configuration file, in order:
           "$HOME/.kanif.conf", "/etc/kanif.conf", "/etc/c3.conf".

       -F
       --flat-deployment
           Deploys all remote execution from the root node (which executes kanif). Useful when remote nodes cannot log on each other.

       -H
       --head
           Deploys only on clusters "head" node (using local interface) for all specified clusters.

       -h
       --help
           Prints a short help text and exits.

       -i
       --interactive
           Asks confirmation before any action. An action is either the execution of one command on all the hosts (default) or the execution of
           one command on one host (sequential mode, see -s switch).

       -l login
       --login login
           Uses the given "login" to connect to remote hosts.

       -M machines-list
       --list machines-list
           Adds to the remote hosts the names contained in the file named "machines-list". kanif accepts as many -M options as you wish.

       -m
       --monitoring
           Makes kanif more verbose about whats happening during deployment commands execution.

       -n nodes
       --nodes nodes
           Adds the given "nodes" to the deployment. See section "HOSTNAMES SPECIFICATION" for more information about "nodes" syntax.  kanif
           accepts as many -n options as you wish.

       -o options
       --remote-opts options
           Sets additional options to be passed to the remote shell command.

       -p level
       --postprocess level
           Sets the level of output formating made in kanif. The general idea is: the higher the level, the more sorted, merged and human readable
           the output. Default is 4, differents levels are:

           0   No processing at all: raw commands output is printed to stdout and raw commands error is printed to stderr. Connections and
               executions errors are not reported.

           1   Same as 0 except that the name of the host which produced the output is prepended before each line.

           2   Same as 1 except that the output is sorted by command (one complete command execution is outputed entirely before another one).
               Connections and executions errors are summarized at the end to stderr.

           3   Same as 2 except that the hostname is printed once, formatted as a title, before its output.

           4   Same as 3 except that identical output produced by multiple nodes is printed once with all the hosts summarized in the title.

       -q
       --dry-run
           When this option is given, kanif does nothing and prints its configuration, the remote nodes it would have tried to contact and the
           TakTuk command that would have been executed.

       -r command
       --remote-cmd command
           Sets the name of the "command" used to contact remote hosts (default is "ssh -o StrictHostKeyChecking=no -o BatchMode=yes").

       -s
       --sequential
           Each command is executed sequentially on remote hosts (using the order given on the command line as hosts order).

       -T options
       --taktuk-options options
           Allows power users to pass some options to the TakTuk command executed (caution: always include -s which is the default unless you
           really know what you are doing).

       -t timeout
       --timeout timeout
           Gives a timeout value for connection attempts. At expiration, connection is canceled and deployment on the remote host is aborted.

       -u timeout
       --upper-limit timeout
           Gives a timeout value for commands execution. At expiration the command is killed with a TERM signal.

       -V
       --version
           Prints kanif version and exits.

       -w
       -wcoll
           Synonym to -n.

       -x nodes
       --exclude nodes
           Excludes some nodes from the ones given using -n or -w. Applies to all hosts sets that do not already contain an exclusion part. Does
           not apply to host given with -M option.

ENVIRONMENT
       Usually all kanif options can be set by environment variables.  The rationale is that boolean options have 0/1 value and environment
       settings are overridden by command line switches.

       The name of an environment variable used by kanif is made of the long option name capitalized with dashes replaced by underscores and
       "KANIF_" prepended (for instance "KANIF_ALL", "KANIF_HEAD", and so on).  This rule admits the following exceptions (that have been chosen
       to mimic C3/dsh behavior):

       KANIF_CONF
           Instead of KANIF_FILE for configuration file.

       KANIF_USER
           Instead of KANIF_LOGIN for login name.

       Notice also that the variable KANIF_WCOLL has no meaning to kanif.

HOSTNAMES SPECIFICATION
       Hostnames given to kanif might be simple machine name or complex hosts lists specifications. In its general form, an hostname is made of an
       host set and an optional exclusion set separated by a slash.  Each of those sets is a comma separated list of host templates. Each of these
       templates is made of constant parts (characters outside brackets) and optional range parts (characters inside brackets). Each range part is
       a comma separated list of intervals or single values. Each interval is made of two single values separated by a dash. This is true for all
       hostnames given to kanif (both with -M or -n/-w options).

       In other words, the following expressions are valid host specifications:
           node1
           node[19]
           node[1-3]
           node[1-3],otherhost/node2
           node[1-3,5]part[a-b]/node[3-5]parta,node1partb

       they respectively expand to:
           node1
           node19
           node1 node2 node3
           node1 node3 otherhost
           node1parta node2parta node2partb node3partb node5partb

       Notice that these list of values are not regular expressions ("node[19]" is "node19" and not "node1, node2, ...., node9"). Intervals are
       implemented using the perl magical auto increment feature, thus you can use alphanumeric values as interval bounds (see perl documentation,
       operator ++ for limitations of this auto increment).

MACHINES SPECIFICATIONS
       With kanif, you can specify the remote nodes on which you want to do some stuff using the command line switches (-n and -x, pdsh/dsh
       style), using machines specifications (C3 style) or both. Thus, this part of the documentation might be ignored if you do not want to use
       C3 style nodes management.

       To use machines specification you must describe your cluster in a configuration file (see -f option and kanif.conf(5)).  Machines
       specifications are nodes intervals taken from clusters defined in this file.

       A machine specification is an optional cluster name followed by a colon and an optional range. The default cluster is taken if no cluster
       name is given.  All the nodes of the cluster are taken if no range is given. Notice that if none of -n/-w, -M or machine specification is
       given on the command line, the remote hosts are assumed to be all the nodes of the default cluster.

COMMAND BODY
       Depending on the name used to invoke it (kash, kaput or kaget), kanif does not perform the same task. Here are its various behavior:

       kash [options] [command line]
           Executes the last part of the command line on all the remote hosts. If this last part is empty, enters interactive mode in which kanif
           waits for command (one per line) on stdin. In interactive mode, just send an EOF character (Ctrl-D) to exit kash.

       kaput [options] src1 [src2 ...] dest
           Copies one ore more files or directories to all the remote hosts. The last argument is the path to the destination file or directory on
           the remote machine.  The other arguments are local files or directories to copy. Behavior and limitations are similar to the command
           cp(1).

       kaget [options] src1 [src2 ...] dest
           Download one ore more files or directories from all the remote hosts. The last argument is the path to the destination directory on the
           local machine. The other arguments are path to files or directories on remote hosts. Each source must be present on all the remote
           hosts. Sources are copied to the destination directory having the originating host appended to their name.

       Notice that when using kaget or kaput each file or directory is completely copied before proceeding to the next one.

EXAMPLES
       When a configuration file exists on the system or is given on the command line (see option -f), remote machines can be specified via
       clusters names. For instance, the simple execution of the command "ls -l" on all the nodes of the cluster named "megacluster" can be
       written:

           kash megacluster: ls -l

       Intervals can also be given. The following command copies the local .cshrc file to the login directory of a subset of the default cluster
       and another subset of the "megacluster":

           kaput :3-6 megacluster:2-5 $HOME/.cshrc .

       Finally, one can take advantage of the default behavior to gather a file named "results.txt" placed in the "/tmp" directory on all the
       nodes of the default cluster to the local directory "results":

           kaget /tmp/results.txt results

       When a user does not want to write a configuration file or just wants to deploy on some other nodes, it is possible to give remote hosts on
       the command line:

           kash -n localhost,supernode uptime

       This last command will just execute "uptime" on "localhost" and "supernode".  Giving intervals and exclusion lists is also possible on the
       command line. The following command copie the file "/tmp/temporary.txt" to the remote "/tmp" directories of node1 and node5:

           kaput -n node[1-6] -x node[2-4],node6 /tmp/temporary.txt /tmp

       Finally, without entering into the details of each option, the final command illustrates the -u option. It executes during 5 seconds a
       "ping" to "gateway" from 5 nodes:

           kash -n node[1-2],node[4-6] -u 5 ping gateway

BUGS
       Missing features:

       ·   indirect clusters not supported (see C3 documentation about such clusters)

       ·   when there are no machine to deploy and kanif runs in interactive mode, kanif still waits for a command (or eof) before exiting

       Performance issues:

       ·   the algorithm used by kaput is not very efficient for transferring large files. Although the precise limit depends on the machine, it
           should not scale well above a few hundreds of megabytes.

SEE ALSO
       taktuk(1), kanif.conf(5)

AUTHOR
       The author of kanif and current maintainer of the package is Guillaume Huard. Acknowledgements to Lucas Nussbaum for the idea of the name
       "kanif".

COPYRIGHT
       kanif is provided under the terms of the GNU General Public License version 2 or later.

perl v5.20.1                                                        2014-10-24                                                            KANIF(1)
