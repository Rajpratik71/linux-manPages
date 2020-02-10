VIRT-ADMIN(1)                                                                             Virtualization Support                                                                            VIRT-ADMIN(1)

NAME
       virt-admin - daemon administration interface

SYNOPSIS
       virt-admin [OPTION]... [COMMAND_STRING]

       virt-admin [OPTION]... COMMAND [ARG]...

DESCRIPTION
       The virt-admin program is the main administration interface for modifying the libvirt daemon configuration at runtime, changing daemon behaviour as well as for monitoring and managing all
       clients connected to the daemon.

       The basic structure of most virt-admin usage is:

         virt-admin [OPTION]... <command> [ARG]...

       Where command is one of the commands listed below.

       The virt-admin program can be used either to run one COMMAND by giving the command and its arguments on the shell command line, or a COMMAND_STRING which is a single shell argument consisting of
       multiple COMMAND actions and their arguments joined with whitespace, and separated by semicolons between commands.  Within COMMAND_STRING, virt-admin understands the same single, double, and
       backslash escapes as the shell, although you must add another layer of shell escaping in creating the single shell argument.  If no command is given in the command line, virt-admin will then
       start a minimal interpreter waiting for your commands, and the quit command will then exit the program.

       The virt-admin program understands the following OPTIONS.

       -c, --connect URI
           Connect to the specified URI, as if by the connect command, instead of the default connection.

       -d, --debug LEVEL
           Enable debug messages at integer LEVEL and above.  LEVEL can range from 0 to 4 (default).  See the documentation of VIRT_ADMIN_DEBUG environment variable below for the description of each
           LEVEL.

       -h, --help
           Ignore all other arguments, and behave as if the help command were given instead.

       -l, --log FILE
           Output logging details to FILE.

       -q, --quiet
           Avoid extra informational messages.

       -v, --version[=short]
           Ignore all other arguments, and prints the version of the libvirt library virt-admin is coming from

       -V, --version=long
           Ignore all other arguments, and prints the version of the libvirt library virt-admin is coming from.

NOTES
       Running virt-admin requires root privileges due to the communications channels used to talk to the daemon. Consider changing the unix_sock_group ownership setting to grant access to specific set
       of users or modifying unix_sock_rw_perms permissions. Daemon configuration file provides more information about setting permissions.

GENERIC COMMANDS
       The following commands are generic.

       help [command-or-group]
           This lists each of the virt-admin commands.  When used without options, all commands are listed, one per line, grouped into related categories, displaying the keyword for each group.

           To display detailed information for a specific command, use its name as the option.

       quit, exit
           quit this interactive terminal

       version
           Will print out the version info about which libvirt library was this client built from. As opposed to virsh client, the output already includes the version of the daemon.

           Example

            $ virt-admin version
            Compiled against library: libvirt 1.2.21
            Using library: libvirt 1.2.21
            Running against daemon: 1.2.20

       cd [directory]
           Will change current directory to directory.  The default directory for the cd command is the home directory or, if there is no HOME variable in the environment, the root directory.

           This command is only available in interactive mode.

       pwd Will print the current directory.

       connect [URI]
           (Re)-Connect to a daemon's administrating server. The URI parameter specifies how to connect to the administrating server.  If LIBVIRT_ADMIN_DEFAULT_URI or admin_uri_default (see below) were
           set, connect is automatically issued every time a command that requires an active connection is executed. Note that this only applies if there is no connection at all or there is an inactive
           one.

           To find the currently used URI, check the uri command documented below.

           For remote access see the documentation page at <http://libvirt.org/uri.html> on how to make URIs.

       uri Prints the administrating server canonical URI, can be useful in shell mode. If no uri was specified, neither LIBVIRT_ADMIN_DEFAULT_URI or admin_uri_default were set, libvirtd:///system is
           used.

ENVIRONMENT
       The following environment variables can be set to alter the behaviour of "virt-admin"

       VIRT_ADMIN_DEBUG=<0 to 4>
           Turn on verbose debugging of virt-admin commands. Valid levels are

           ·   VIRT_ADMIN_DEBUG=0

               DEBUG - Messages at ALL levels get logged

           ·   VIRT_ADMIN_DEBUG=1

               INFO - Logs messages at levels INFO, NOTICE, WARNING and ERROR

           ·   VIRT_ADMIN_DEBUG=2

               NOTICE - Logs messages at levels NOTICE, WARNING and ERROR

           ·   VIRT_ADMIN_DEBUG=3

               WARNING - Logs messages at levels WARNING and ERROR

           ·   VIRT_ADMIN_DEBUG=4

               ERROR - Messages at only ERROR level gets logged.

       VIRT_ADMIN_LOG_FILE="LOGFILE"
           The file to log virt-admin debug messages.

       LIBVIRT_ADMIN_DEFAULT_URI
           The daemon whose admin server to connect to by default. Set this to a URI, in the same format as accepted by the connect option. This overrides the default URI set in any client config file.

       VIRT_ADMIN_HISTSIZE
           The number of commands to remember in the command  history.  The default value is 500.

       LIBVIRT_DEBUG=LEVEL
           Turn on verbose debugging of all libvirt API calls. Valid levels are

           ·   LIBVIRT_DEBUG=1

               Messages at level DEBUG or above

           ·   LIBVIRT_DEBUG=2

               Messages at level INFO or above

           ·   LIBVIRT_DEBUG=3

               Messages at level WARNING or above

           ·   LIBVIRT_DEBUG=4

               Messages at level ERROR or above

           For further information about debugging options consult "http://libvirt.org/logging.html"

BUGS
       Report any bugs discovered to the libvirt community via the mailing list "http://libvirt.org/contact.html" or bug tracker "http://libvirt.org/bugs.html".  Alternatively report bugs to your
       software distributor / vendor.

AUTHORS
         Please refer to the AUTHORS file distributed with libvirt.

         Based on the virsh man page.

COPYRIGHT
       Copyright (C) 2015 Red Hat, Inc., and the authors listed in the libvirt AUTHORS file.

LICENSE
       virt-admin is distributed under the terms of the GNU LGPL v2+.  This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
       PARTICULAR PURPOSE

SEE ALSO
       virsh(1), virt-xml-validate(1), virt-host-validate(1), <http://www.libvirt.org/>

libvirt-1.3.1                                                                                   2015-12-02                                                                                  VIRT-ADMIN(1)
