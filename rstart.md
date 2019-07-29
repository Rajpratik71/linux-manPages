RSTART(1)                                                                               General Commands Manual                                                                              RSTART(1)

NAME
       rstart - a sample implementation of a Remote Start client

SYNOPSIS
       rstart [-c context] [-g] [-l username] [-v] hostname command args ...

DESCRIPTION
       Rstart is a simple implementation of a Remote Start client as defined in "A Flexible Remote Execution Protocol Based on rsh".  It uses rsh as its underlying remote execution mechanism.

OPTIONS
       -c context
               This option specifies the context in which the command is to be run.  A context specifies a general environment the program is to be run in.  The details of this environment are host-
               specific; the intent is that the client need not know how the environment must be configured.  If omitted, the context defaults to X.  This should be suitable for running  X  programs
               from the host's "usual" X installation.

       -g      Interprets  command  as  a generic command, as discussed in the protocol document.  This is intended to allow common applications to be invoked without knowing what they are called on
               the remote system.  Currently, the only generic commands defined are Terminal, LoadMonitor, ListContexts, and ListGenericCommands.

       -l username
               This option is passed to the underlying rsh; it requests that the command be run as the specified user.

       -v      This option requests that rstart be verbose in its operation.  Without this option, rstart discards output from the remote's rstart helper, and directs the rstart helper to detach the
               program from the rsh connection used to start it.  With this option, responses from the helper are displayed and the resulting program is not detached from the connection.

NOTES
       This is a trivial implementation.  Far more sophisticated implementations are possible and should be developed.

       Error handling is nonexistent.  Without -v, error reports from the remote are discarded silently.  With -v, error reports are displayed.

       The $DISPLAY environment variable is passed.  If it starts with a colon, the local hostname is prepended.  The local domain name should be appended to unqualified host names, but isn't.

       The $SESSION_MANAGER environment variable should be passed, but isn't.

       X11 authority information is passed for the current display.

       ICE authority information should be passed, but isn't.  It isn't completely clear how rstart should select what ICE authority information to pass.

       Even  without -v, the sample rstart helper will leave a shell waiting for the program to complete.  This causes no real harm and consumes relatively few resources, but if it is undesirable it
       can be avoided by explicitly specifying the "exec" command to the shell, eg
       rstart somehost exec xterm
       This is obviously dependent on the command interpreter being used on the remote system; the example given will work for the Bourne and C shells.

SEE ALSO
       rstartd(1), rsh(1), A Flexible Remote Execution Protocol Based on rsh

AUTHOR
       Jordan Brown, Quarterdeck Office Systems

X Version 11                                                                                 rstart 1.0.5                                                                                    RSTART(1)
