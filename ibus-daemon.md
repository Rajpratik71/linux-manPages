IBUS-DAEMON(1)                                                     User Commands                                                    IBUS-DAEMON(1)

NAME
       ibus-daemon - daemon program for ibus

SYNOPSIS
       ibus-daemon [OPTION]...

DESCRIPTION
       IBus  is  an Intelligent Input Bus. It is a new input framework for Linux OS. It provides full featured and user friendly input method user
       interface.  It also may help developers to develop input method easily.

       ibus-daemon is a daemon program for ibus and it is also a start up program for users to activate ibus daemon, engines and panel.

   Help Options:
       -h, --help
              Show help options

   Application Options:
       -d, --daemonize
              run ibus as background process.

       -s, --single
              do not execute panel and config module.

       -x, --xim
              execute ibus XIM server.

       -n, --desktop=name
              specify the name of desktop session. [default=gnome]

       -p, --panel=cmdline
              specify the cmdline of panel program.

       -c, --config=cmdline
              specify the cmdline of config program.

       -a, --address=address
              specify the address of ibus daemon.

       -r, --replace
              if there is an old ibus-daemon is running, it will be replaced.

       -t, --cache=mode [default is auto]
              force to re-scan components, and re-create registry cache.  auto, refresh, none is available.

       -o, --timeout=timeout [default is 2000]
              dbus reply timeout in milliseconds.

       -j, --monitor-timeout=timeout [default is 0]
              timeout of poll changes of engines in seconds. 0 to disable it.

       -m, --mem-profile
              enable memory profile, send SIGUSR2 to print out the memory profile.

       -v, --verbose
              verbose.

BUGS
       If you find a bug, please report it at https://github.com/ibus/ibus/issues

SEE ALSO
       ibus(1)

1.5.14                                                              April 2010                                                      IBUS-DAEMON(1)
