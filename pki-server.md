pki-server(8)                                                                  PKI Administrative Command-Line Interface (CLI)                                                                  pki-server(8)



NAME
       pki-server - Command-Line Interface for performing administrative tasks on Certificate System subsystems.


SYNOPSIS
       pki-server [CLI options] <command> [command arguments]


DESCRIPTION
       The  pki-server  command  provides  a  command-line interface allowing administrators to perform various administrative operations on the Certificate System instances.  These services include start‐
       ing/stopping instances, enabling/disabling subsystems, performing certain migrations and enabling/disabling startup using nuxwdog.

       Operations are performed using file system utilities, and can only be performed by an administrative user on the local host.  This utility does not connect to any of  the  subsystem's  WEB  or  REST
       interfaces.


CLI OPTIONS
       --help Prints additional help information.

       -d     Displays debug information.

       -v     Displays verbose information.


OPERATIONS
       To view available commands and options, simply type pki-server.

       Some commands have sub-commands.  To view the sub-commands, type pki-server <command>.  To view each command's usage, type  pki-server <command> --help.


FILES
       /usr/sbin/pki-server


SEE ALSO
       pki-server-instance(1)
           Certificate Server instance management commands.


       pki-server-subsystem(1)
           Certificate Server subsystem management commands.


       pki-server-migrate(1)
           Certificate server migration script management commands.


       pki-server-nuxwdog(1)
           Commands to enable/disable startup using nuxwdog.


       pki-server-cert(1)
           System certificate management commands.


AUTHORS
       Ade Lee <alee@redhat.com>, and Dinesh Prasanth M K <dmoluguw@redhat.com>


COPYRIGHT
       Copyright  (c)  2017  Red  Hat,  Inc.  This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of this license is available at http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.



version 10.4                                                                                    July 31, 2017                                                                                   pki-server(8)
