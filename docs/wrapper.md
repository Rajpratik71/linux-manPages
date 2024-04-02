javawrapper(1)                                                General Commands Manual                                               javawrapper(1)

NAME
       wrapper - Jar daemon wrapper

USAGE
       wrapper [<command>] [<configuration file>] [<configuration properties>]

       where <command> can be one of:

       -c --console
              run as a Console application

       -v --version
              print the wrapper's version information.

       -? --help
              print this help message

       -- <args>
               mark the end of Wrapper arguments.  All arguments after the '--' will be passed through unmodified to the java application.

       <configuration file> is the wrapper.conf to use.  The filename must either be absolute or relative to the location of wrapper

       <configuration properties> are configuration name-value pairs which override values  in wrapper.conf.  For example:
                wrapper.debug=true

       Please note that any file references must be either absolute or relative to the location of the wrapper executable.

       This manual page was written by Rémi Debay <debay.remi@gmail.com> and Kill Your TV <killyourtv@i2pmail.org>.

                                                                    12/24/2012                                                      javawrapper(1)
