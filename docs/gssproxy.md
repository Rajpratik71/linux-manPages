GSSPROXY(8)                                                                                 GssProxy Manual pages                                                                                 GSSPROXY(8)



NAME
       gssproxy - GssProxy Daemon

SYNOPSIS
       gssproxy [options]

DESCRIPTION
       gssproxy provides a daemon to manage access to GSSAPI credentials.

       gssproxy consists of the gssproxy daemon (configured by the gssproxy.conf(5) file) and a GSSAPI interposer plugin (gssproxy-mech(8)).

OPTIONS
       -D,--daemon
           Become a daemon after starting up.

       -i,--interactive
           Run in the foreground, don't become a daemon.

       -c,--config
           Specify a config file to use as the main config file (read before the rest of the config directory). The default is to use the file /etc/gssproxy/gssproxy.conf. For reference on the config file
           syntax and options, consult the gssproxy.conf(5) manual page.

       -C,--configdir
           Specify a non-default config dir. Files named of the form "##-foo.conf" (that is, beginning with two digits and a dash, and ending in ".conf") will be read in numeric order from this directory,
           in addition to the config file itself. The default is /etc/gssproxy. For reference on the config file syntax and options, consult the gssproxy.conf(5) manual page.

       -s,--socket
           Specify a custom default socket name. This socket will be used by all sections that do not define an explicit socket.

       -d,--debug
           Turn on debugging. This option is identical to --debug-level=1.

       --debug-level=
           Turn on debugging at the specified level. 0 corresponds to no logging, while 1 turns on basic debug logging. Level 2 increases verbosity, including more detailed credential verification.

           At level 3 and above, KRB5_TRACE output is logged. If KRB5_TRACE was already set in the execution environment, trace output is sent to its value instead.

       --version
           Print version number and exit.

SIGNALS
       SIGTERM/SIGINT
           Informs the GssProxy to gracefully terminate all of its child processes and then shut down.

       SIGHUP
           Request a reload of all configuration for gssproxy. If there is an error in the configuration files, the existing configuration will not be replaced; if there is a problem applying the new
           configuration, gssproxy will exit.

SEE ALSO
       gssproxy.conf(5) and gssproxy-mech(8).

AUTHORS
       GSS-Proxy - http://fedorahosted.org/gss-proxy



GSS Proxy                                                                                         08/08/2019                                                                                      GSSPROXY(8)
