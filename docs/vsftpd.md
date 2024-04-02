VSFTPD(8)                                                                                BSD System Manager's Manual                                                                                VSFTPD(8)

NAME
     vsftpd — Very Secure FTP Daemon

SYNOPSIS
     vsftpd [configuration file and / or options]

DESCRIPTION
     vsftpd is the Very Secure File Transfer Protocol Daemon. The server can be launched via a “super-server” such as inetd(8) or xinetd(8).  Alternatively, vsftpd can be launched in standalone mode, in
     which case vsftpd itself will listen on the network. This latter mode is easier to use, and recommended. It is activated by setting listen=YES in /etc/vsftpd.conf.  Direct execution of the vsftpd
     binary will then launch the FTP service ready for immediate client connections.

OPTIONS
     An optional configuration file or files may be given on the command line. These files must be owned as root if running as root. Any command line option not starting with a "-" character is treated as
     a config file that will be loaded. Note that config files are loaded in the strict order that they are encountered on the command line.  If no config files are specified, the default configuration
     file of /etc/vsftpd.conf will be loaded, after all other command line options are processed.

     Supported options are:

     -v      Print the version information and exit, even if other options are encountered.

     -ooption=value
             Set a single option, value pair as per the format in the config file. Multiple -o options are supported, and they are applied in strict order relative to their appearance on the command line,
             including intermingling with loading of config files.

EXAMPLES
     vsftpd -olisten=NO /etc/vsftpd.conf -oftpd_banner=blah

     That example overrides vsftpd's built-in default for the "listen" option to be NO, but then loads /etc/vsftpd.conf which may override that setting. Finally, the "ftpd_banner" setting is set to "blah",
     which overrides any default vsftpd setting and any identical setting that was in the config file.

FILES
     /etc/vsftpd.conf

SEE ALSO
     vsftpd.conf(5)

                                                                                                March 8, 2001
