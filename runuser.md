RUNUSER(1)                                   User Commands                                  RUNUSER(1)

NAME
       runuser - run a command with substitute user and group ID

SYNOPSIS
       runuser [options] -u user [[--] command [argument...]]

       runuser [options] [-] [user [argument...]]

DESCRIPTION
       runuser  allows  to  run commands with a substitute user and group ID.  If the option -u is not
       given, it falls back to su-compatible semantics and a shell is executed.   The  difference  be‐
       tween  the  commands runuser and su is that runuser does not ask for a password (because it may
       be executed by the root user only) and it uses a  different  PAM  configuration.   The  command
       runuser does not have to be installed with set-user-ID permissions.

       If the PAM session is not required then recommended solution is to use setpriv(1) command.

       When called without arguments, runuser defaults to running an interactive shell as root.

       For  backward  compatibility,  runuser defaults to not change the current directory and to only
       set the environment variables HOME and SHELL (plus USER and LOGNAME if the target user  is  not
       root).  This version of runuser uses PAM for session management.

OPTIONS
       -c, --command=command
              Pass command to the shell with the -c option.

       -f, --fast
              Pass -f to the shell, which may or may not be useful depending on the shell.

       -g, --group=group
              The primary group to be used.  This option is allowed for the root user only.

       -G, --supp-group=group
              Specify  a  supplemental  group.   This  option is available to the root user only.  The
              first specified supplementary group is also used  as  a  primary  group  if  the  option
              --group is unspecified.

       -, -l, --login
              Start the shell as a login shell with an environment similar to a real login:

                 o      clears  all  the environment variables except for TERM and variables specified
                        by --whitelist-environment

                 o      initializes the environment variables HOME, SHELL, USER, LOGNAME, PATH

                 o      changes to the target user's home directory

                 o      sets argv[0] of the shell to '-' in order to make the shell a login shell

       -P, --pty
              Create pseudo-terminal for the session. The independent terminal provides  better  secu‐
              rity as user does not share terminal with the original session.  This allow to avoid TI‐
              OCSTI ioctl terminal injection and another security attacks against  terminal  file  de‐
              scriptors.  The  all session is also possible to move to background (e.g. "runuser --pty
              -u username -- command &").  If the pseudo-terminal  is  enabled  then  runuser  command
              works as a proxy between the sessions (copy stdin and stdout).

              This feature is mostly designed for interactive sessions. If the standard input is not a
              terminal, but for example pipe (e.g. echo "date" | runuser --pty -u user) than ECHO flag
              for the pseudo-terminal is disabled to avoid messy output.

       -m, -p, --preserve-environment
              Preserve  the  entire  environment,  i.e. it does not set HOME, SHELL, USER nor LOGNAME.
              The option is ignored if the option --login is specified.

       -s, --shell=shell
              Run the specified shell instead of the default.  The shell to run is selected  according
              to the following rules, in order:

                 o      the shell specified with --shell

                 o      the  shell specified in the environment variable SHELL if the --preserve-envi‐
                        ronment option is used

                 o      the shell listed in the passwd entry of the target user

                 o      /bin/sh

              If the target user has a restricted shell (i.e. not listed in /etc/shells)  the  --shell
              option and the SHELL environment variables are ignored unless the calling user is root.

       --session-command=command
              Same as -c , but do not create a new session.  (Discouraged.)

       -w, --whitelist-environment=list
              Don't reset environment variables specified in comma separated list when clears environ‐
              ment for --login. The whitelist is ignored for the environment  variables  HOME,  SHELL,
              USER, LOGNAME, and PATH.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

CONFIG FILES
       runuser  reads the /etc/default/runuser and /etc/login.defs configuration files.  The following
       configuration items are relevant for runuser:

       ENV_PATH (string)
           Defines the PATH environment variable for a regular user.  The default  value  is  /usr/lo‐
           cal/bin:/bin:/usr/bin.

       ENV_ROOTPATH (string)
       ENV_SUPATH (string)
           Defines  the PATH environment variable for root.  ENV_SUPATH takes precedence.  The default
           value is /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin.

       ALWAYS_SET_PATH (boolean)
           If set to yes and --login and --preserve-environment were not specified runuser initializes
           PATH.

       The  environment variable PATH may be different on systems where /bin and /sbin are merged into
       /usr.

EXIT STATUS
       runuser normally returns the exit status of the command it executed.  If the command was killed
       by a signal, runuser returns the number of the signal plus 128.

       Exit status generated by runuser itself:

                 1      Generic error before executing the requested command

                 126    The requested command could not be executed

                 127    The requested command was not found

FILES
       /etc/pam.d/runuser
                        default PAM configuration file
       /etc/pam.d/runuser-l
                        PAM configuration file if --login is specified
       /etc/default/runuser
                        runuser specific logindef config file
       /etc/login.defs  global logindef config file

SEE ALSO
       setpriv(1), su(1), login.defs(5), shells(5), pam(8)

HISTORY
       This   runuser  command was derived from coreutils' su, which was based on an implementation by
       David MacKenzie, and the Fedora runuser command by Dan Walsh.

AVAILABILITY
       The runuser command is part of the util-linux  package  and  is  available  from  Linux  Kernel
       Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                     July 2014                                    RUNUSER(1)
