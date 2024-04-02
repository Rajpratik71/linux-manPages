YAST2(8)                                                                                     System configuration                                                                                    YAST2(8)



NAME
       YaST2 - universal configuration utility

SYNOPSIS
       yast2 [ options ] [ module ] [ module specific options ]
       yast2 --install <package> [ <package> [ ...  ] ]

DESCRIPTION
       YaST2  is used to configure the system. It can configure a common hardware (sound cards, printers, keyboards, mice), network connections (network cards, ISDN cards, modems, DSL connections), network
       clients and services (NFS, NIS), as well as a general system options (language, partitioning, software, bootloader).

       YaST2 comes with three frontends: GTK , QT and ncurses.  All frontends are functionally equivalent.  The correct frontend is selected automatically based on the available components and the  current
       environment (the DISPLAY variable).

       Use yast2 alone to launch the YaST2 Control Center from which you can select a particular configuration module or use yast2 <module> to launch the module directly.

OPTIONS
       --qt   Run YaST in the QT graphical frontend

       --gtk  Run YaST in the GTK graphical frontend

       --ncurses
              Run YaST in the ncurses text-mode frontend

       -g, --geometry
              Default window size (QT frontend only).

       -h, --help
              Print a usage and exit.

       -i, --install <package> [ <package> [ ... ] ]
              Install  an  RPM  package.  The package can be a single short package name (e.g. gvim) which will be installed with dependency checking, or the full path to an rpm package (e.g /tmp/gvim.rpm)
              which will be installed without dependency checking.

       --remove <package> [ <package> [ ... ] ]
              Remove an RPM package. The package can be short package names (e.g. gvim) which will be removed with dependency checking.

       -l, --list
              List all available modules. To obtain usage info about a module, use "yast module help".

MODULES WITH COMMAND LINE INTERFACE
       This is a list of YaST modules currently supporting command line interface:

       answering_machine, bootloader, ca_mgm, dhcp-server, dns, dns-server, fax, firewall, groups, host, http-server, idedma, inetd, irda, kerberos-client, keyboard, lan, language, ldap, mail, mouse,  nfs,
       nfs_server,  nis,  nis_server,  ntp-client,  power-management,  powertweak,  printer, profile-manager, proxy, remote, routing, runlevel, samba-client, samba-server, security, sound, sysconfig, tftp-
       server, timezone, tv, users

       To obtain a list of basic commands for using a YaST module with support for command line interface, use:
       yast2 module help

       To get more comprehensive information about the commands available for a YaST module, use:
       yast2 module longhelp

       To get information about the commands available for a YaST module in a XML formatted file, use:
       yast2 module xmlhelp xmlfile= <filename>

       To get information about a specific command of a YaST module, use:
       yast2 module command help

       To start an interactive console in which you can execute commands of a YaST module, use
       yast2 module interactive

FILES
       /var/log/YaST2/*
              Logs

       /etc/sysconfig/yast2, $HOME/.yast2/yast2
              Configures the preferred GUI.



EXIT STATUS
       0      Successful program execution.

       1      Too few arguments.

       5      Error in arguments.

       16     Generic module error.

       > 16   Module specific error codes.

AUTHOR
       Michal Svec <msvec@suse.cz> - manual page
       Jakub Friedl <jfriedl@suse.cz> - manual page

SEE ALSO
       Documentation in /usr/share/doc/packages/yast2*.



yast2                                                                                            January 2003                                                                                        YAST2(8)
