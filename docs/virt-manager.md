VIRT-MANAGER(1)                                               Virtual Machine Manager                                              VIRT-MANAGER(1)

NAME
       virt-manager - display the virtual machine desktop management tool

SYNOPSIS
       virt-manager [OPTIONS]

DESCRIPTION
       virt-manager is a desktop tool for managing virtual machines. It provides the ability to control the lifecycle of existing machines
       (bootup/shutdown,pause/resume,suspend/restore), provision new virtual machines and various types of store, manage virtual networks, access
       the graphical console of virtual machines, and view performance statistics, all done locally or remotely.

OPTIONS
       The following options are accepted when running "virt-manager":

       -h
       --help
           Display command line help summary

       --version
           Show virt-manager's version number and exit

       -c URI
       --connect=URI
           Specify the hypervisor connection "URI"

       --debug
           List debugging output to the console (normally this is only logged in ~/.cache/virt-manager/virt-manager.log). This function implies
           --no-fork.

       --no-fork
           Don't fork "virt-manager" off into the background: run it blocking the current terminal. Useful for seeing possible errors dumped to
           stdout/stderr.

       --no-conn-autostart
           Don't autostart any libvirt connections when launching "virt-manager".

       --show-DIALOG-WINDOW
           Display the corresponding "DIALOG-WINDOW" when launching "virt-manager". This function implies --no-conn-autostart and the manager
           window will not be shown at startup in this case.

           The following "DIALOG-WINDOW" options are currently available:

           --show-domain-creator
               Display the wizard for creating new virtual machines

           --show-domain-editor NAME|ID|UUID
               Display the dialog for editing properties of the virtual machine with unique ID matching either the domain name, ID, or UUID

           --show-domain-performance NAME|ID|UUID
               Display the dialog for monitoring performance of the virtual machine with unique ID matching either the domain name, ID, or UUID

           --show-domain-console NAME|ID|UUID
               Display the virtual console of the virtual machine with unique ID matching either the domain name, ID, or UUID

           --show-host-summary
               Display the main window summarizing performance for all virtual machines on the host.

       --spice-disable-auto-usbredir
           Auto USB redirection is supported by default. This option switches off it.

       Standard GTK options like --g-fatal-warnings are also accepted.

BUGS
       Please see <http://virt-manager.org/bugs/>

COPYRIGHT
       Copyright (C) Red Hat, Inc, and various contributors.  This is free software. You may redistribute copies of it under the terms of the GNU
       General Public License "http://www.gnu.org/licenses/gpl.html". There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       virsh(1), "virt-viewer(1)", the project website "http://virt-manager.org"

1.4.0                                                               2017-08-16                                                     VIRT-MANAGER(1)
