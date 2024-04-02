APACHE2(8)                                                            apache2                                                           APACHE2(8)

NAME
       apache2 - Apache Hypertext Transfer Protocol Server

SYNOPSIS
       apache2  [  -d  serverroot  ]  [  -f  config  ]  [  -C  directive  ]  [  -c  directive  ]  [  -D  parameter ] [ -e level ] [ -E file ] [ -k
       start|restart|graceful|stop|graceful-stop ] [ -R directory ] [ -h ] [ -l ] [ -L ] [ -S ] [ -t ] [ -v ] [ -V ] [ -X ] [ -M ]

SUMMARY
       apache2 is the Apache HyperText Transfer Protocol (HTTP) server program. It is designed to be run as a standalone daemon process. When used
       like this it will create a pool of child processes or threads to handle requests.

       In  general, apache2 should not be invoked directly, but rather should be invoked via /etc/init.d/apache2 or apache2ctl. The default Debian
       configuration requires environment variables that are defined in /etc/apache2/envvars and are not available if apache2 is started directly.
       However, apache2ctl can be used to pass arbitrary arguments to apache2.

DOCUMENTATION
       The  full documentation is available in the apache2-doc package or at http://httpd.apache.org/docs/2.2/ . Information about Debian specific
       changes and configuration can be found in /usr/share/doc/apache2/README.Debian.gz .

OPTIONS
       -d serverroot
              Set the initial value for the ServerRoot directive to serverroot. This can be overridden by the ServerRoot directive in the configu‐
              ration file.

       -f config
              Uses  the directives in the file config on startup. If config does not begin with a /, then it is taken to be a path relative to the
              ServerRoot. The default is /etc/apache2/apache2.conf.

       -k start|restart|graceful|stop|graceful-stop
              Signals apache2 to start, restart, or stop. See Stopping Apache for more information.

       -C directive
              Process the configuration directive before reading config files.

       -c directive
              Process the configuration directive after reading config files.

       -D parameter
              Sets a configuration parameter which can be used with <IfDefine> sections in  the  configuration  files  to  conditionally  skip  or
              process commands at server startup and restart.

       -e level
              Sets  the  LogLevel to level during server startup. This is useful for temporarily increasing the verbosity of the error messages to
              find problems during startup.

       -E file
              Send error messages during server startup to file.

       -R directory
              When the server is compiled using the SHARED_CORE rule, this specifies the directory for the shared object files.

       -h     Output a short summary of available command line options.

       -l     Output a list of modules compiled into the server. This will not list dynamically  loaded  modules  included  using  the  LoadModule
              directive.

       -L     Output a list of directives together with expected arguments and places where the directive is valid.

       -M     Dump a list of loaded Static and Shared Modules.

       -S     Show the settings as parsed from the config file (currently only shows the virtualhost settings).

       -t     Run  syntax  tests for configuration files only. The program immediately exits after these syntax parsing tests with either a return
              code of 0 (Syntax OK) or return code not equal to 0 (Syntax Error). If -D DUMP_VHOSTS is also set, details of the virtual host  con‐
              figuration will be printed. If -D DUMP_MODULES  is set, all loaded modules will be printed.

       -v     Print the version of apache2, and then exit.

       -V     Print the version and build parameters of apache2, and then exit.

       -X     Run apache2 in debug mode. Only one worker will be started and the server will not detach from the console.

SEE ALSO
       apache2ctl(8), /usr/share/doc/apache2/README.Debian.gz

Apache HTTP Server                                                  2008-04-05                                                          APACHE2(8)
