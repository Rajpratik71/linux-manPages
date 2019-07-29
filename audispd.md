AUDISPD:(8)                                               System Administration Utilities                                              AUDISPD:(8)

NAME
       audispd - an event multiplexor

SYNOPSIS
       audispd

DESCRIPTION
       audispd  is an audit event multiplexor. It has to be started by the audit daemon in order to get events. It takes audit events and distrib‐
       utes them to child programs that want to analyze events in realtime. When the audit daemon receives a SIGTERM or  SIGHUP,  it  passes  that
       signal to the dispatcher, too. The dispatcher in turn passes those signals to its child processes.

       The  child programs install a configuration file in a plugins directory, /etc/audisp/plugins.d. Filenames are not allowed to have more than
       one '.' in the name or it will be treated as a backup copy and skipped. Options are given one per line with an equal sign between the  key‐
       word and its value. The available options are as follows:

       active The options for this are yes or no.

       direction
              The  option is dictated by the plugin.  In or out are the only choices. You cannot make a plugin operate in a way it wasn't designed
              just by changing this option.This option is to give a clue to the event dispatcher about which direction events flow. NOTE:  inbound
              events are not supported yet.

       path   This is the absolute path to the plugin executable. In the case of internal plugins, it would be the name of the plugin.

       type   This  tells the dispatcher how the plugin wants to be run. Choices are builtin and always.  Builtin should always be given for plug‐
              ins that are internal to the audit event dispatcher. These are af_unix and syslog. The option always should be given for most if not
              all plugins. The default setting is always.

       args   This  allows you to pass arguments to the child program. Generally plugins do not take arguments and have their own config file that
              instructs them how they should be configured. At the moment, there is a limit of 2 args.

       format The valid options for this are binary and string.  Binary passes the data exactly as the audit event dispatcher  gets  it  from  the
              audit  daemon.  The  string  option  tells the dispatcher to completely change the event into a string suitable for parsing with the
              audit parsing library. The default value is string.

FILES
       /etc/audisp/audispd.conf /etc/audisp/plugins.d

SEE ALSO
       audispd.conf(5), auditd(8).

AUTHOR
       Steve Grubb

Red Hat                                                              Sept 2007                                                         AUDISPD:(8)
