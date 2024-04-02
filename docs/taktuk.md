TAKTUK(1)                                                    TakTuk Deployment Engine                                                    TAKTUK(1)

NAME
       TakTuk - a tool for large scale remote execution deployment

SYNOPSIS
       taktuk [-behinsvzMP] [-c connector] [-d limit] [-f filename] [-g duration] [-l login] [-m hostname [-[ args ... -]]] [-o stream=template]
       [-t timeout] [-u limit] [-w size] [-B parameter=expression] [-C separators] [-E character] [-F filename] [-G hostname [-[ args ... -]]] [-L
       hostname] [-I interpreter] [-O separators] [-R stream=filename] [-S files] [-T command] [-V path ] [-W scheme] [commands ... ]

DESCRIPTION
       TakTuk is a tool for broadcasting the remote execution of one ore more commands to a set of one or more distant machines. TakTuk combines
       local parallelization (using concurrent deployment processes) and work distribution (using an adaptive work-stealing algorithm) to achieve
       both scalability and efficiency.

       TakTuk is especially suited to interactive tasks involving several distant machines and parallel remote executions. This is the case of
       clusters administration and parallel program debugging.

       TakTuk also provides a basic communication layer to programs it executes.  This communication layer uses the communication infrastructure
       set up by TakTuk during its deployment. It is available both for the Perl and the C langages and is described in TakTuk(3) and
       taktukcomm(3) respectively.

OPTIONS
       Caution, in TakTuk options are parsed in the order given on the command line.  This means that TakTuk is not POSIX compliant regarding
       options order.  This is important as some of the options change the behavior of following ones (and only these ones - e.g. -l applies to
       following -m options). The defaults settings of TakTuk can be obtained by using the "--print-defaults" option.  The following options are
       given by category in alphabetical order.

DEPLOYMENT OPTIONS
       -b
       --begin-group
           begins a new deployment group. A deployment group acts both as a context for most options (options set within a group have no effect
           outside the group) and as an isolation for deployment tasks scheduling (deployment tasks within a group cannot be stolen by nodes
           deployed in other groups).

       -c connector
       --connector connector
           defines the connector command used to contact the following remote machines.

       -d limit
       --dynamic limit
           turns dynamic mode (work stealing) on or off for the deployment of all the following remote machines specifications. If "limit" is
           positive or null, TakTuk uses the dynamic mode with its value as a maximal arity (0 = no maximal arity).  A negative value for "limit"
           turns dynamic mode off.  Warning, currently it is a bad idea to use several -d options with positive values on the same command line.

       -e
       --end-group
           ends a deployment group.

       -f filename
       --machines-file filename
           "filename" is the name of a file that contains remote machines names (equivalent to several "-m" opions). In each line of this file,
           the first word is considered as a machine name and the remaining as comments.

       -l login
       --login login
           sets the login name for the following hosts. This assumes that the connector command accepts "-l" option (this is the case for ssh, the
           default).

       -m hostname
       --machine hostname
           "hostname" is the name of a remote machine on which TakTuk has to be deployed. "hostname" might contain list of values specified inside
           brackets and exclusion lists (see "HOSTNAMES SPECIFICATION"). In such case, the depolyment will be performed on all the matching hosts.
           This option can be followed by any number of arguments enclosed between "-[" and "-]" which will be transmitted as arguments of the
           remote TakTuk that will execute on all the target hosts.

       -s
       --self-propagate
           propagates the TakTuk executable through the following connectors and thus eliminates the need for a TakTuk installation on remote
           machines.

       -z
       --dont-self-propagate
           cancels a preceding -s option.

       -F filename
       --args-file filename
           "filename" is the name of a file that contains additional options for TakTuk. The parsing of the file is done when encountering this
           option.

       -G hostname
       --gateway hostname
           same as -m hostname, except that the deployed node(s) are considered as forward-only nodes: they will not be numbered and will not be
           targeted by subsequent diffusion commands. As an exception, execution of TakTuk commands on those nodes is still possible by giving
           them as deployment arguments of the -G option.

       -I command
       --perl-interpreter command
           "command" is the name of the command to use as a Perl interpreter when auto propagating or when using the "taktuk_perl" command.

       -L hostname
       --localhost hostname
           changes the name of localhost as viewed by TakTuk.

       -S files
       --send-files files
           gives to TakTuk a list of files to be sent upon successfull remote connection. Use with caution as it will slow down deployment (the
           files are transfered before the end of the deployment). The intended use is NOT to transfer application data files (rather use the
           "put" command to transfer such files). This option should be used to transfer files that are necessary to perform further connections
           from the remote node.  "files" is a comma separated list of pairs "local_file:remote_file". Regarding the transfer itself, it behaves
           as the "put" command.

       -T command
       --taktuk-command command
           "command" is the name of the TakTuk command (default is $0, the name used to launch TakTuk). This is the command used once connected to
           initiate the remote TakTuk engine. Note that the effect of this switch is void when using the "-s" option.

       -V list
       --path-value list
           set the PATH environment variable to the given list (as usual, a colon separated directories list) on remote hosts to which TakTuk
           connects. This is performed very early and is taken into account even for "taktuk" or "perl" invocations at connection time.

COMMAND LINE PARSING OPTIONS
       -C separators set
       --command-separator separators set
           replaces the default set of characters that separates successive TakTuk commands.

       -E character
       --escape-character character
           defines an escape character that can be used to protect any following character from TakTuk interpretation. This protection applies
           nearly to the whole TakTuk command line.

       -O separators set
       --option-separator separators set
           replaces the default set of characters that separates successive words when reading options and commands from a file (using the "-F"
           switch).

I/O OPTIONS
       -o stream=template
       --output-template stream=template
           sets an output template specification for one of output streams designed by the given name. When giving only a stream name (without
           template) this disables the stream. Available streams include :

           "connector" (errors from the connector command)
               this stream contains in $line information outputed to stderr by a connector command. Relevant fields include $host, $peer and
               others listed below.

           "error", "output" (error and output of remotely executed commands)
               these streams contain in $line information outputed by executed command to stdout or stderr (respectively). Relevant fields include
               $host, $command, $pid and others listed below.

           "info" (general information such as help summary or version)
               this stream contains in $line information outputed by taktuk in response to commands such as "help" or "version".

           "message" (messages from running processes)
               each output of this stream contains in $line a message sent with target "output" (through TakTuk out-of-band communications
               facilities) by some processus started using TakTuk commands. Relevant fields for this stream include $from and $to and others
               listed below.

           "state" (internal state of TakTuk instance)
               this stream contains in $line the state change code matching some TakTuk events. Codes are the following:

                 0 - TakTuk is ready
                 1 - TakTuk is numbered
                 2 - TakTuk terminated
                 3 - connection failed
                 4 - connection initialized
                 5 - connection lost
                 6 - command started
                 7 - command failed
                 8 - command terminated
                 9 - numbering update failed
                10 - pipe input started
                11 - pipe input failed
                12 - pipe input terminated
                13 - file reception started
                14 - file reception failed
                15 - file reception terminated
                16 - file send failed
                17 - Invalid target
                18 - No target
                19 - Message delivered
                20 - Invalid destination
                21 - Destination not available anymore
                22 - Wait complete
                23 - Wait reduce complete

               The function event_msg($) can be used in the template to translate this code into a string that describes the event.  Relevant
               fields include $host, $position, $rank, $count and others listed below.

           "status" (commands exit status)
               this stream contains in $line the return code of executed commands. Relevant fields include $host, $pid and others listed below.

           "taktuk" (internal messages, warnings and errors)
               this stream contains in $line error, warning and debug messages outputed by TakTuk itself. Relevant fields include $line_number,
               $package and others listed below.

           a template is a Perl expression that should evaluate to the string eventually displayed. Within a specification, some variables might
           be used depending on the concerned stream:

           $command (not for "taktuk" nor "info")
               the command line execution that generated output.

           $count
               the total number of TakTuk instances.

           $eol
               an empty string or a newline depending on what character ended command output.

           $filename ("taktuk" only)
               the file in which a TakTuk diagnostic function has been called.

           $from ("message" only)
               the logical number of the TakTuk instance from which the message has been sent.

           $host
               the name of the host executing the current TakTuk instance

           $init_date ("connector" and "state" only)
               the time in seconds since Jan. 1, 1970 at which the remote TakTuk instance completed its initialization (including ssh connection
               time and self propagation if any).

           $level ("taktuk" only)
               the level of the diagnostic function called.

           $level_name ("taktuk" only)
               the name associated with the level of the diagnostic function called.

           $line
               the raw data outputed by a command or passed to a diagnostic function, any trailing newline removed (see $eol).

           $line_number ("taktuk" only)
               the line number at which a TakTuk diagnostic function has been called.

           $package ("taktuk" only)
               the package in which a TakTuk diagnostic function has been called.

           $peer ("connector" and "state" only)
               the remote machine for which a connector command outputed information.

           $peer_position ("connector" and "state" only)
               position on the command line of the remote host. This position is expressed as a path in the hierarchy of hosts expressed on the
               command line (dot separated position number at each level of imbrication).

           $peers_given ("state" only)
               a space separated list of remote nodes that has been given to the remote peer for deployment (whatever their deployment state).
               Each remote node is specified as a colon separated couple made of its hostname and its position on the command line. This variable
               has only a meaningful value when the event outputed to the stream "state" is a connection loss (event number 5).

           $pid (not for "taktuk" nor "info")
               the pid of the command line executed (that produced output).

           $position
               position on the command line of the current host. This position is expressed as a path in the hierarchy of hosts expressed on the
               command line (dot separated position number at each level of imbrication).

           $rank
               the logical number of TakTuk instance in which output is collected.

           $reply_date ("connector" and "state" only)
               the time in seconds since Jan. 1, 1970 at which the connector command replied to the local TakTuk instance (note that this does not
               include the initialization exange occuring before the remote TakTuk is considered as functional).

           $start_date ("output", "error", "connector" and "status")
               the time in seconds since Jan. 1, 1970 at which the command started (taken just after the call to fork()).

           $init_date ("connector" and "state" only)
               the time in seconds since Jan. 1, 1970 at which the remote TakTuk completed its initilization.

           $stop_date ("connector" and "status" only)
               the time in seconds since Jan. 1, 1970 at which the command terminated (after the closing of its stdout).

           $to ("message" only)
               the logical number (or set of such numbers) of the TakTuk instance to which the message has been sent.

           $type
               the name of the output stream (connector, error, output, ...).

           $user_scalar
               a scalar, global to the package, initially initialized to undef, that the user is free to use for any purpose.

           at the end of the day, the specification is evaluated for each line of the concerned stream and the result printed on the root node.
           Note that the newline has to be added explicitly as "\n" in the template if needed.

           WARNING: take care of your specification, if the Perl syntax is not correct lots of awfull compilation error messages will be displayed
           and TakTuk execution will fail.

       -R stream=filename
       --output-redirect stream=filename
           redirect a given stream output to a given file (located at the root node).  Notice that the given filename comply with Perl open
           syntax: for instance, one might redirect to a file descriptor X using the name ">&=X". See "-o" option for more details about streams
           output.

PERFORMANCE TUNING OPTIONS
       -B parameter=expression
       --worksteal-behavior parameter=expression
           caution: this feature should be considered as experimental and could be removed from future releases.  Tunes finely the behavior of the
           work-stealing algorithm by setting some its parameters to Perl expressions. These Perl expressions can use the variables $last_given
           and $available which are respectively equal to the number of tasks given to a stealer last time it stole and to the total number of
           remaining deployment tasks.  Available parameters are :

           initial
               the number of tasks given to a remote TakTuk instance the first time it send a steal request to the local host.

           growth
               the number of tasks given to a remote TakTuk instance each time it performs a steal to the local host after the first time.

           limit
               an upper bound to the value resulting from the evaluation of "growth".

       -g duration
       --time-granularity duration
           sets to "duration" (in seconds) the maximal interval between timeouts checks (usually checks are made more often: at each message
           received a timeouts check is made).

       -n
       --no-numbering
           disables TakTuk logical numbering and the variables "TAKTUK_COUNT" and "TAKTUK_RANK" are not defined in executed commands. This has the
           advantage of removing the global synchronization occuring at the end of the deployment and making the deployment more efficient.

           WARNING: use this option only before any remote node specification ("-m" or "-f") otherwise you might get serious synchronization
           issues in TakTuk.  Using TakTuk point-to-point communication along with this option will fail and produce TakTuk warnings.

       -t timeout
       --timeout timeout
           sets the timeout (in seconds) for following connectors (0 = no timeout). Notice that this option override the timeout of the connector
           command ("ssh" for instance).  When the delay expires, the connector command is simply killed.

       -u limit
       --cache-limit limit
           limits a number of memory bytes TakTuk might use as an internal write buffer. For most users, setting such a limit is a bad idea : in
           some rare situations it might result in a deadlock in TakTuk (caused by parallel blocking writes between an application and TakTuk
           itself). Setting this option to a negative value disables the limit (default).

           Nevertheless, if you use TakTuk to transfer large files, because of I/O bandwith disparities in various parts of a system, TakTuk
           memory use might grow too large and performance can be severely degraded when the system starts swapping. In such situations, limiting
           the size of the internal cache will keep TakTuk in main memory and preserve the performance.

       -w size
       --window size
           sets initial window to the given size (= pipeline width).

       -W scheme
       --window-adaptation scheme
           sets the windows adaptation scheme to number (default is 0, 0: no adaptation, 1: implementation in progress).

MISCELLANEOUS OPTIONS
       -M
       --my
           makes the next option local (not inherited). This means that the next option is set only for the local host and not propagated to
           children TakTuk instances.  Has no effect if the next option is already a local one.

       -h
       --help
           prints a short description of TakTuk on the screen.

       -i
       --interactive
           forces TakTuk interactive mode even after some batch commands given on the command line.

       -v
       --version
           prints the TakTuk version.

       -P
       --print-defaults
           prints the defaults settings used by TakTuk (environment variables taken into account).

INTERNAL OPTIONS
       These option are not useful for most users. They are used either internally by TakTuk itself or for development purposes.

       -p packagename
       --print-package packagename
           prints the content of package "packagename" extracted from the taktuk code in execution.

       -r
       --not-root
           current TakTuk instance is not the root node. This is an internal switch used by spawned TakTuk instances. This is usually not useful
           for most users.

       -D scope=level
       --debug scope=level
           sets debugging level (1..4) for "scope". The "scope" might be a TakTuk package name or "default" and the lowest the level the more
           verbose the output.

COMMANDS
       After the options parsing, TakTuk expects some commands either on the remaining of the command line (batch mode) or on the standard input
       (interactive mode). These commands are actions to be performed by TakTuk using the logical network infrastructure set up during the
       deployment. By default, commands might be separated by ; or newlines. For all the commands, any non ambiguous prefix can be used instead of
       their full name.  In interactive mode, TakTuk has support for "readline" (history, command line editing) if installed on your system.

       When TakTuk commands accept arguments, they should be enclosed into matching delimiters (indicated by * below). In other words, * might be
       replaced either by any non alphanumeric character or by a pair of matching braces, brackets or parenthesis.  These delimiters must be
       separated from their content (using the options separator). If the argument contains a closing delimiter preceded by a separator, then it
       is probably a good idea to escape it (see -E option) or to protect the whole arguments string if given on the command line.

       Taktuk understands the following commands:

       [ set specification ] command
           Sends the execution of command to all the peers belonging to the given set. For more details about the set specification, see section
           "SET AND TARGETS SPECIFICATION".

       broadcast command
           Broadcasts the execution of command on all the remote peers (not including the node initiating the broadcast).

       downcast command
           Spreads the execution of command on all the children of the node initiating the downcast (not including itself).

       exec parameters * command line *
           Executes the "command line" on the local machine.  Inputs/outputs of the execution are multiplexed and fowarded to the TakTuk root.
           This command accepts optional parameters that enable the attachment of callbacks triggered by timeouts to the execution of the command.
           See section "EXEC PARAMETERS" for more details.

       get * src * * dest *
           Copies (a) remote source(s) (present on the remote node(s)) to a destination on the node executing this command.  The type of source
           and destination is quite similar to those accepted by the "cp -r" command (that is file or directories). This command also performs
           some kind of magic with its parameters: shell environment variables present in the source or destination names are replaced by their
           respective value on the remote and local nodes.  In addition, the variables $host, $rank and $position of the remote node (which are
           the same as in -o option) can also be used in both names.

       help
           Prints a very concise TakTuk help.

       input [ target target ] * data *
       input [ target target ] data * data *
           Sends the given data as input to commands in execution on the local machine as specified by the given target. If no target is given,
           the data is sent to all commands. For more details about targets, see "SET AND TARGETS SPECIFICATION"

       input [ target target ] close
           Closes the inputs descriptor of executing commands on the local machine as specified by the given target. If no target is given, the
           inputs of all commands are closed.

       input [ target target ] file * filename *
           Sends the content of a file (which must be local to the node executing the input file) as input to commands in execution on the local
           machine as specified by the given target. If no target is given, the data is sent to all commands.

           WARNING: this command is not atomic. If you manage somehow to initiate a input file command from two different TakTuk instances, data
           will probably be interleaved. In this case you should synchronize the two instances. This is not required when spreading files only
           from the root node.

       input [ target target ] line * data *
           Sends the given data with an additional newline as input to commands in execution on the local machine as specified by the given
           target. If no target is given, the data is sent to all commands.

       input [ target target ] pipe * filename *
           Treat the parameter as a file (which must be local to the node executing the input pipe) which behavior is the same as a pipe: data can
           arrive continuously. TakTuk add it as one of its input channels and send data as input to commands when available. If given, the target
           specifies to which command the data are to be sent, otherwise it is sent to all commands.

       kill [ target target ] <signal>
           Sends the given signal to local commands processes groups. If no signal is given, sends a TERM signal (signal 15).  If given, the
           target specifies to which command the signal is to be sent, otherwise it is sent to all commands.  For more details about targets, see
           "SET AND TARGETS SPECIFICATION"

       message [ target target ] * data *
       message [ target target ] data * data *
           Sends the given data as a message to commands in execution on the local machine as specified by the given target (see TakTuk(3) and
           taktukcomm(3) for more details about messages). If no target is given, the data is sent to the first command peforming a receive and
           not already targeted by another message.  For more details about targets, see "SET AND TARGETS SPECIFICATION"

       message [ target target ] file * filename *
           Sends the content of a file (which must be local to the node executing the message file) as a message to commands in execution on the
           local machine as specified by the given target (see TakTuk(3) and taktukcomm(3) for more details about messages). If no target is
           given, the data is sent to the first command peforming a receive and not already targeted by another message.

           WARNING: this command is not atomic. If you manage somehow to initiate a message file command from two different TakTuk instances, data
           will probably be interleaved. In this case you should synchronize the two instances. This is not required when spreading files only
           from the root node.

       message [ target target ] line * data *
           Sends the given data with an additional newline as a message to commands in execution on the local machine as specified by the given
           target (see TakTuk(3) and taktukcomm(3) for more details about messages). If no target is given, the data is sent to the first command
           peforming a receive and not already targeted by another message.

       message [ target target ] pipe * data *
           Treat the parameter as a filename (which must be local to the node executing the input pipe) which behavior is the same as a pipe: data
           can arrive continuously. TakTuk add it as one of its input channels and send data as a message to commands when available (see
           TakTuk(3) and taktukcomm(3) for more details about messages). If given, the target specifies to which command the data are to be sent,
           otherwise it is sent to the first command peforming a receive and not already targeted by another message.

       network
       network state
           Prints the current TakTuk deployment tree. Numbers in parenthesis match the peer rank in the logical TakTuk numbering and the peer
           ready state. If the deployment is not complete, the printed tree will display "connecting ..."  leaves.

       network cancel
           Cancels all ongoing connections. Consequently, this causes immediate starting of the possible numbering of TakTuk instances and the
           execution of TakTuk commands.

       network renumber
           Completely recomputes the logical numbering of TakTuk instances. This is especially useful when adding new nodes to the deployed
           network after initial numbering.

       network update
           Updates the logical numbering of TakTuk instances without changing already existing numbers. Does not always succeed as TakTuk uses a
           depth first scheme for numbering. Sends an event 9 in the stream 'state' for each node of the tree that cannot be updated while keeping
           TakTuk numbering scheme.  This is especially useful when adding new nodes to the deployed network after initial numbering.

       option name * value *
       option * line *
           Either changes a single option which name is given (first form) or parses an additional options line (second form) on the node(s)
           executing this command.  See TakTuk options for more details, name can be either short or long in the first form.

           WARNING: new nodes added to TakTuk network using this command are not numbered. Further use of network renumbering or update is
           necessary to get TakTuk logical numbering.

       put * src * * dest *
           Copies a local source (present on the node executing this command) to a destination on all the remote nodes given as prefix of the
           command.  The type of source and destination is quite similar to those accepted by the "cp -r" command (that is file or directories).
           This command also performs some kind of magic with its parameters: shell environment variables present in the source or destination
           names are replaced by their respective value on the local and remote nodes.  In addition, the variables $host, $rank and $position of
           the local node (which are the same as in -o option) can also be used in both names.

       synchronize command
           Forces the given command to wait for the completion of deployment, nodes numbering and previous commands before executing. This is
           useful for global commands like "broadcast" which does not wait for nodes numbering. In contrary, multicast commands (those that use a
           set specification as a prefix) wait for the nodes numbering and the completion of previous commands. If in doubt, always use
           "synchronize" before a "broadcast", "downcast" or "wait reduce".

       taktuk_perl * arguments *
           Forks a perl interpreter on the local node just as if the command "exec perl arguments" has been used. The difference is that this
           interpreter is previously fetched with the "taktuk" package that contains point-to-point communication routines ("TakTuk::send" and
           "TakTuk::recv", see taktukcomm(3)).  WARNING: due to the limitations of the parser that analyses the arguments of this command, you
           have to give arguments (even if empty) and to use '--' if you give any option to the perl interpreter (and even if you give it only
           options).

       version
           prints TakTuk version.

       quit
           Quit the TakTuk engine and shut down the logical communication network established during the deployment.

       wait target target
           Waits (suspends the execution of following commands) in the local TakTuk instance for the completion of some local process depending on
           the given target. This target might be any target specification except "output".  For more details about targets, see "SET AND TARGETS
           SPECIFICATION".

       wait reduce target target
           Can only be used in the root node. Waits (suspends the execution of following commands) for the completion of some processes in all the
           deployed TakTuk instances depending on the given target. This target might be any target specification except "output". Notice that,
           contrary to simple "wait" commands, this command is synchronized the same way as "broadcast". Thus, it should be explicitly
           synchronized if mixed with non broadcasted commands (otherwise it will be executed before them).

EXEC PARAMETERS
       The TakTuk command "exec" accepts optional parameters. These parameters are used to specify a target id for the command, or to attach
       actions triggered by timeouts to commands execution. An "exec" command accepts any number of parameters. These parameters are interpreted
       from left to right using the following syntax:

       target value
           Attach the (numerical) value as the target id of the executed command. This target id will be used by any subsequent command that make
           use of targets (such as "input", "message", "kill" or "wait").

           Caution: this value overwrite any target id that could have been automatically assigned by TakTuk. Therefore, it is not recommended to
           mix the use of explicitly assigned target ids with the use of automatically assigned target ids.

       timeout value
           Creates a new timeout specification. At the end of the duration expressed by the given value, it will trigger its attached callbacks.
           If it has no attached callback, it will send a TERM signal to the command. If the command execution terminates before the end of the
           timeout duration, the timeout is canceled.

       kill value
           Attach a callback to the last defined timeout. This callback send a signal, which number is the given value, to the timeouted command.

       action command
           Attach a callback to the last defined timeout. This callback executes the given TakTuk command. If it executes some other command, it
           can use the environment variable "TAKTUK_PID" that contains the pid of the timeouted command. The given TakTuk command can be any valid
           TakTuk command (without command separator).

       Notice that each timeout can have any number of attached callbacks. They will be processed in the order they are given as parameters.

ENVIRONMENT
       Variables that change TakTuk default behavior
           Some of TakTuk defaults settings can be changed on some host using environment variables. These settings are propagated as are other
           options.  They are overridden by propagated settings and command line options.

           To change some default setting use the variable TAKTUK_NAME where NAME is the name of the according long option in upper case and with
           dashes replaced by underscores. For option taking complex value (such as "--debug") just add an underscore and the field you want to
           change in upper case at the end of the name.  Using "taktuk --print-defaults" will give you examples of names used to change default
           settings.  Note that defining in the environment a default setting not used by TakTuk has no effect.

           You can also change some TakTuk default settings locally without propagating the change in the deployment tree. To do this, use the
           variable TAKTUK_MY_NAME where name is defined as above. As before, these local settings are overridden by propagated settings and
           command line options.

       Variables set by TakTuk in remotely executed commands
           Taktuk sets the following environment variables for all the commands it executes :

           TAKTUK_CONTROL_READ, TAKTUK_CONTROL_WRITE
               File descriptors, used internally by TakTuk.

           TAKTUK_COUNT
               The total number of successfully deployed TakTuk instances

           TAKTUK_HOSTNAME
               Local node hostname as given to TakTuk (on the command line)

           TAKTUK_PIDS
               List of pids (separated by spaces) of commands executed by the local TakTuk instance.

           TAKTUK_TARGET
               Target number of the currently executing process (see "SET AND TARGETS SPECIFICATION" for more details).

           TAKTUK_POSITION
               Host position on the command line.

           TAKTUK_RANK
               The logical rank of the local instance.

           TAKTUK_FATHER
               The logical rank of the taktuk instance that spawned this one.

           TAKTUK_CHILD_MIN
               The logical rank of the lowest numbered descendent from the current taktuk instance (-1 if the local TakTuk instance has no
               children).

           TAKTUK_CHILD_MAX
               The logical rank of the highest numbered descendent from the current taktuk instance (-1 if the local TakTuk instance has no
               children).

HOSTNAMES SPECIFICATION
       Hostnames given to TakTuk might be simple machine name or complex hosts lists specifications. In its general form, an hostname is made of
       an host set and an optional exclusion set separated by a slash.  Each of those sets is a comma separated list of host templates.  Each of
       these templates is made of constant part (characters outside brackets) and optional range parts (characters inside brackets). Each range
       part is a comma separated list of intervals or single values. Each interval is made of two single values separated by a dash. This is true
       for all hostnames given to TakTuk (both with -m or -f options).

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

SET AND TARGETS SPECIFICATION
       The TakTuk command line and the "TakTuk::send" routine accept a set specification as destination host(s). A set specification is made of
       interval specifications separated by slashes. An interval specification is either made of a single number, two numbers separated by a dash
       or a single number followed by a plus symbol (this last case match the interval that goes from the number to the highest numbered TakTuk
       destination). Of course the two numbers specifying an interval must be given in increasing order.

       The remote peers included in a set specification are all the peer which logical number belong to at least one interval of the set. Here are
       some exemples of set specifications :

           1
       the peer numbered 1

           2-7
       the peers numbered 2,3,4,5,6 and 7

           2-4/1/10
       the peers numbered 1,2,3,4 an 10

           3+
       the peers from 3 to the highest numbered

           5+/1
       the peers from 5 to the highest numbered and the peer 1

       The target number is a number assigned by TakTuk to all processes it executes (successfully started or not using "exec" or "taktuk_perl"
       commands).  By default, this number starts from 0 and goes to the total number of processes that have been executed since TakTuk launch
       minus one.  Target processes of a "TakTuk::send" or a TakTuk command can be expressed with the same syntax as in the case of sets.

       Furthermore, TakTuk understands several special targets. The special target "all" targets all processes: this means that the command is
       applied to all executing local processes (message or input data are duplicated and sent to all of them), this is the default for the
       "input" and "kill" commands. The special target "any" targets the first eligible process. In the case of a message this is the first
       process that issues a "TakTuk::recv" and that is not already the target of another message, this is the default for the "message" command.
       Finally, the special target "output" targets the output stream "message" rather than a process.

EXAMPLES
       The following examples illustrate the basic use of TakTuk on a few machines and the use of developer options. Notice that TakTuk is
       designed to scale to much more peers than the number involved in these examples.

   Basic usage
       simple deployment
           the simplest way to use TakTuk is to make it selfpropagate with option "-s". In this case, the basic remote execution of "hostname" on
           the host "toto.nowhere.com" can be written :

               taktuk -s -m toto.nowhere.com broadcast exec [ hostname ]

           In this example, "-s" asks TakTuk to propagate its own code on remote hosts. It can be removed by installing the "taktuk" executable on
           "toto.nowhere.com". By the following we will assume that TakTuk is installed on all the remote hosts.

           The "-m toto.nowhere.com" describe the set of remote hosts to be contacted by TakTuk and "broadcast exec [ hostname ]" is a command
           that will be executed by the TakTuk interpreter.

           This example can be written in many other ways. In interactive mode, the same execution might become:

               taktuk -m toto.nowhere.com

           here TakTuk is blocked waiting for commands from stdin. Thus, we just have to type:

               broadcast exec { hostname }
               Ctrl-D

           here you can notice that parameters to the "exec" TakTuk command (as all commands parameters) can be enclosed in any reasonable pair of
           delimiters.  We might also write the list of hosts involved in the command in a file "machine" that contains:

               toto.nowhere.com

           and the TakTuk command becomes:

               taktuk -f machine broadcast exec - hostname -

           We could also use another file "options" that contains:

               -f machine

           and use it as the options line given to TakTuk:

               taktuk -F options broadcast exec \( hostname \)

           Finally, everything could be stored in a last file "command_line" that contains:

               -f machine broadcast exec = hostname =

           and the following command achieve the same result:

               taktuk -F command_line

           All of these variants have the same effect: they execute "hostname" on "toto.nowhere.com" and the output of the program is forwarded to
           the localhost. In this case:

               toto.nowhere.com: hostname: somepid: output > toto.nowhere.com

       parameters braces
           notice that braces for command parameters must be separated from their content.  Thus, they can contain other braces as long as no
           single closing brace is part of the content:

               taktuk -m localhost broadcast exec [ 'if [ $RANDOM -gt 10000 ];then echo greater;else echo lower;fi' ]

           In this example, quotes are necessary to prevent the shell from interpreting the "$" and ";" characters and to prevent the closing
           brace for "if" toe be considered as closing the "exec" command.  In this case the variable will be interpolated only on remote hosts.
           This same example can also be expressed using shortcuts and intercative mode:

               taktuk -m localhost -E%

           then type:

               b e [ if [ $RANDOM -gt 10000 %];then echo greater;else echo lower;fi ]
               Ctrl-D

           Notice the closing bracket used in the test that should not be interpreted as the closing bracket for "exec" arguments. In such case, a
           simpler solution is probably to use another kind of braces

               taktuk -m localhost

           and then:
               b e { if [ $RANDOM -gt 10000 ];then echo greater;else echo lower;fi }
               Ctrl-D

           Usually, if you want to be safe, you can quote all commands parameters.  Nevertheless, notice that parameters should not be quoted in
           interactive mode as input lines are not interpreted by the shell.

       exec parameters
           commands executed by TakTuk can be timeouted using "exec" parameters.  For instance if you want to execute some command and send it a
           TERM signal after two seconds, just type:

               taktuk -m localhost broadcast exec timeout 2 [ sleep 10 ]

           the callback executed when a timeout occurs can also be something else than a TERM signal. This can be another signal (KILL for
           instance):

               taktuk -m localhost broadcast exec timeout 2 kill 9 [ sleep 10 ]

           or any valid TakTuk command:

               taktuk -m localhost broadcast exec timeout 2 action broadcast exec [ echo hello ] [ sleep 10 ]

           or even several timeouts and several callbacks:

               taktuk -m localhost b e t 2 a e [ echo hello ] k 30 t 10 k 9 [ sleep 5 ]

           in this last example, the command "sleep 5" is executed by TakTuk. After 2 seconds, the first timeout will be triggered, it will
           execute the command "echo hello" and send a USR1 signal to the first command ("sleep 5"). The second timeout is set to 10 seconds.
           Thus, it will never occur as the "sleep 5" command will be terminated before its expiration.

       topology
           Usually, TakTuk deploys itself using a relatively flat tree because its default window size is quite large (10 simultaneous ongoing
           connections).  Using a smaller window size will result in a deeper tree although it also depends on the local load of the deployment
           nodes.  You can use the TakTuk "network state" command to print the tree constructed by TakTuk.

           Notice that it is usually a bad idea to use a too large window as it results in too much local load and bad distribution of work
           (something like 10 is often sufficient).

           You can also force TakTuk to use more specific topologies. For instance, to execute "echo $$" using a flat-tree as deployment topology,
           just disable work-stealing in TakTuk:

               taktuk -d -1 -m host1 -m host2 -m host3 broadcast exec [ 'echo $$' ]

           and to use a chain-like topology, either encode the topology in arguments structure:

               taktuk -m host1 -[ -m host2 -[ -m host3 -] -] broadcast exec [ 'echo $$' ]

           or limits the arity of the dynamic tree to 1:

               taktuk -d 1 -m host1 -m host2 -m host3 broadcast exec [ 'echo $$' ]

           Finally, the default will use a dynamicly constructed topology:

               taktuk -d 0 -m host1 -m host2 -m host3 broadcast exec [ 'echo $$' ]

       lightweight grid deployment
           On a lightweight grid, because of locality issues (ldap cache, network topology, ...) it seems interesting to separate the deployment
           of each subcluster. To do this, it is possible to enclose the nodes of each cluster into a separate deployment group:

               taktuk -b -m node1.cluster1 -m node2.cluster1 -m node3.cluster1 -m node4.cluster1 -e -b -m node1.cluster2 -m node2.cluster2 -m node3.cluster2 -m node4.cluster2 -e broadcast exec [ hostname ]

           This command has the effect of deploying TakTuk on two clusters (cluster 1 and 2) made of four nodes (node 1 to 4), preventing deployed
           nodes from one cluster to be used to deploy nodes from the other cluster.  Finally, once the deployment is complete, it executes the
           command "hostname" on all these nodes.

       executing a distinct command on each host
           each distinct host can be given its own command using arguments:

               ./taktuk -m host1 -[ exec [ hostname ] -] -m host2 -[ exec [ id ] -] -m host3 -[ exec [ 'echo $TAKTUK_RANK; ls' ] -] quit

           but this could also be given using set specification (in this case logical number are used for hosts):

               ./taktuk -m host1 -m host3 -m host8 1 exec [ hostname ], 2 exec [ id ], 3 exec [ 'echo $TAKTUK_RANK; ls' ]

           or in interactive mode:

               ./taktuk -m host1 -m host3 -m host8
               1 exec [ hostname ]
               2 exec [ id ]
               3 exec [ echo $TAKTUK_RANK; ls ]
               Ctrl-D

           Nevertheless keep in mind that in general these logical numbers do not match the position of hosts on the command line.

       script diffusion
           spreading and executing a perl script named "essai.pl" on three hosts, knowing that "taktuk" and "essai.pl" are only present on the
           root node is straightforward with TakTuk:

               taktuk -s -m host1 -m host2 -m host3
               broadcast exec [ perl -- - ]
               broadcast input file [ essai.pl ]
               broadcast input close
               Ctrl-D

       files diffusion and collection
           since version 3.4, files transfer is supported directly by TakTuk. Notice that this transfer uses the TakTuk network (usually a tree
           composed of ssh connections by default). This network is not efficient for the tranfer of large files (both topologically and from a
           protocol point of view), so keep this in mind when using this feature.

           copying a file named "message.txt" to the "/tmp" directory of each remote host is thus as easy as:

               taktuk -s -m host1 -m host2 -m host3
               broadcast put [ message.txt ] [ /tmp ]
               Ctrl-D

           but the older method still works (and does almost the same as the previous command):

               taktuk -s -m host1 -m host2 -m host3
               broadcast exec [ cat - >/tmp/message.txt ]
               broadcast input file [ message.txt ]
               broadcast input close
               Ctrl-D

           although it requires to be more careful about shell interpretation when typing everything directly on the command line:

               taktuk -s -m host1 -m host2 -m host3  broadcast exec [ 'cat - >/tmp/message.txt' ]\;broadcast input file [ message.txt ]

           notice in this latter command that the "input close" is not necessary as TakTuk closes inputs of all spawned commands when quitting.

           the "get" command also makes possible things that were previously very difficult in TakTuk, files collecting. The following command
           gets the file "/tmp/message.txt" from each remote host and copies it locally to "message-number.txt" where "number" is the logical rank
           of the source node:

               taktuk -s -m host1 -m host2 -m host3
               broadcast get [ /tmp/message.txt ] [ message-$rank.txt ]
               Ctrl-D

           finally, it seems important to mention that "put/get" commands can copy directories and keep files permissions unchanged.

       communication
           TakTuk can also be used to establish a point-to-point communication. Assume the file "communication.pl" contains the following Perl
           script:

               my $rank = TakTuk::get('rank');
               my $count = TakTuk::get('count');
               if ($rank == 1)
                 {
                   print "I'm process 1\n";
                   if ($count > 1)
                     {
                       TakTuk::send(to=>2, body=>"Hello world");
                     }
                 }
               elsif ($rank == 2)
                 {
                   print "I'm process 2\n";
                   my ($from, $message) = TakTuk::recv();
                   print "Process $to received $message from $from\n";
                 }

           then the execution of the following command:

               taktuk -m localhost -m localhost broadcast taktuk_perl [ - ]\;broadcast input file [ communication.pl ]

           would produce an output similar to:

               Astaroth.local: taktuk_perl: 3523: output > I'm process 2
               Astaroth.local: taktuk_perl: 3523: output > Process 2 received Hello world from 1
               Astaroth.local: taktuk_perl: 3523: status > 0
               Astaroth.local: taktuk_perl: 3524: output > I'm process 1
               Astaroth.local: taktuk_perl: 3524: status > 0

           if the file "communication.pl" was placed in the login directory of the user, this could have also been executed by the more simple:

               taktuk -m localhost -m localhost broadcast taktuk_perl [ communication.pl ]

       output templates and redirections
           TakTuk is also capable of making each site echo its rank without command status information:

               taktuk -o status -m host1 -m host2 broadcast exec [ 'echo $TAKTUK_RANK' ]

           or removing the prompt before each line of output from commands:

               taktuk -o output='"$line\n"' -m host1 -m host2 broadcast exec [ 'echo $TAKTUK_RANK' ]

           or even changing the prompt to make it display only the stream type:

               taktuk -o default='"$type > $line\n"' -m host1 -m host2 broadcast exec [ 'echo $TAKTUK_RANK' ]

           and it also possible to redirect the status to file descriptor 2 only for the second host:

               taktuk -m host1 -R status=2 -m host2 broadcast exec [ 'echo $TAKTUK_RANK' ]

           and so on...

   Developer usage
       debugging TakTuk
           debugging in TakTuk is made using "debug", "warning" and "error" functions of the package "diagnostic". These routines, depending on
           the debugging level of the package in which they are called, produce an output that is propagated up to the root node and printed on
           screen.

           By default the debugging level of packages is set to 2 (everything is printed out except "debug" messages). It might be changed for
           each package using the -D option. For instance the following code executes "true" on "toto.nowhere.com" and prints out every bit of
           internal messaging:

               taktuk -D default=1 -m toto.nowhere.com broadcast exec [ true ]

           but one could have executed the same command keeping only messages from the "scheduler" package:

               taktuk -D scheduler=1 -m toto.nowhere.com broadcast exec [ true ]

           or ensuring an  execution exempted of any warning or error messages:

               taktuk -D default=4 -m toto.nowhere.com broadcast exec [ true ]

       internal messages server
           the internal message server used in TakTuk for the management of logical network construction, commands execution and I/O forwarding
           can be exposed using the -r option:

               taktuk -r

           Notice that in this mode the behavior of TakTuk can seem very cryptic. This is not intended for ordinary users.

BUGS
       The development of TakTuk is still in progress, so there are propably numbers of bugs. For now, the following characteristics (some of them
       are not really bugs) have been identified :

       hanged commands
           currently TakTuk do not quit (even if asked to do so) if some local commands do not terminate upon the closing of their standard input.
           Interrupting TakTuk actually terminate the engine but do not kill these commands. We still have to decide if this is the appropriate
           behavior.

       command order
           broadcasts and multicast (set specifications) are not synchronized the same way in TakTuk. Thus, broadcast commands given after
           multicast commands might be executed before these last ones. Use the "synchronize" command to avoid this.

       fork failures
           this is not really a bug : when a machine is highly loaded, fork may fail.  If this happen to a local command, a distributed
           application may deadlock, because the taktuk instances numbering is correct but some instance didn't fork the local command.  The
           simplest fix is to use timeouts on "TakTuk::recv()".

       You might also want to have a look at:

           http://taktuk.gforge.inria.fr/Bugs.txt

       where all the temporary bugs are listed version by version.

SEE ALSO
       taktukcomm(3), TakTuk(3), TakTuk::Pilot(3)

AUTHOR
       The original concept of TakTuk has been proposed by Cyrille Martin in his PhD thesis. People involved in this work include Jacques Briat,
       Olivier Richard, Thierry Gautier and Guillaume Huard.

       The author of the version 3 (perl version) and current maintainer of the package is Guillaume Huard.

COPYRIGHT
       TakTuk is provided under the terms of the GNU General Public License version 2 or later.

perl v5.20.2                                                        2015-07-01                                                           TAKTUK(1)
