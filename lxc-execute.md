lxc-execute(1)                                            lxc-execute(1)

NAME
       lxc-execute - run an application inside a container.

SYNOPSIS
       lxc-execute {-n name} [-d] [-f config_file] [-s KEY=VAL] [--
                   command]

DESCRIPTION
       lxc-execute runs the specified command inside the container spec‐
       ified by name.

       It will setup the container according to the configuration previ‐
       ously defined with the lxc-create command or with the  configura‐
       tion file parameter.  If no configuration is defined, the default
       isolation is used.

       This command is mainly used when you want to  quickly  launch  an
       application in an isolated environment.

       lxc-execute  command will run the specified command into the con‐
       tainer via an intermediate process, lxc-init.  This lxc-init  af‐
       ter  launching  the  specified command, will wait for its end and
       all other reparented processes.  (to support daemons in the  con‐
       tainer).   In other words, in the container, lxc-init has the pid
       1 and the first process of the application has the pid 2.

       The above lxc-init is designed to forward received signals to the
       started command.

OPTIONS
       -f, --rcfile config_file
              Specify  the  configuration file to configure the virtual‐
              ization and isolation functionalities for the container.

              This configuration file if present will be  used  even  if
              there  is already a configuration file present in the pre‐
              viously created container (via lxc-create).

       -s, --define KEY=VAL
              Assign value VAL to configuration variable KEY. This over‐
              rides any assignment done in config_file.

       -d, --daemon
              Run  the  container  as  a daemon. As the container has no
              more tty, if an error occurs nothing  will  be  displayed,
              the log file can be used to check the error.

       --     Signal the end of options and disables further option pro‐
              cessing. Any arguments after the -- are treated  as  argu‐
              ments to command.

              This  option  is  useful  when you want specify options to
              command and don't want lxc-execute to interpret them.

COMMON OPTIONS
       These options are common to most of lxc commands.

       -?, -h, --help
              Print a longer usage message than normal.

       --usage
              Give the usage message

       -q, --quiet
              mute on

       -P, --lxcpath=PATH
              Use  an  alternate  container   path.   The   default   is
              /var/lib/lxc.

       -o, --logfile=FILE
              Output to an alternate log FILE. The default is no log.

       -l, --logpriority=LEVEL
              Set log priority to LEVEL. The default log priority is ER‐
              ROR. Possible values are : FATAL, CRIT, WARN,  ERROR,  NO‐
              TICE, INFO, DEBUG.

              Note  that  this  option  is  setting  the priority of the
              events log in the alternate log file. It do not  have  ef‐
              fect on the ERROR events log on stderr.

       -n, --name=NAME
              Use  container  identifier NAME.  The container identifier
              format is an alphanumeric string.

       --rcfile=FILE
              Specify the configuration file to configure  the  virtual‐
              ization and isolation functionalities for the container.

              This  configuration  file  if present will be used even if
              there is already a configuration file present in the  pre‐
              viously created container (via lxc-create).

       --version
              Show the version number.

DIAGNOSTIC
       The container is busy
              The specified container is already running an application.
              You should stop it before reuse this container or create a
              new one.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
       lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-
       wait(1),  lxc-cgroup(1),  lxc-ls(1),  lxc-info(1), lxc-freeze(1),
       lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Daniel Lezcano <daniel.lezcano@free.fr>

                               2018-12-20                 lxc-execute(1)
