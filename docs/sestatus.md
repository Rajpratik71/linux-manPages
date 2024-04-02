sestatus(8)                                                                           SELinux command line documentation                                                                          sestatus(8)



NAME
       sestatus - SELinux status tool


SYNOPSIS
       sestatus [-v] [-b]

       This tool is used to get the status of a system running SELinux.


DESCRIPTION
       This manual page describes the sestatus program.

       This  tool is used to get the status of a system running SELinux. It displays data about whether SELinux is enabled or disabled, location of key directories, and the loaded policy with its status as
       shown in the example:
              > sestatus
              SELinux status:              enabled
              SELinuxfs mount:             /selinux
              SELinux root directory:      /etc/selinux
              Loaded policy name:          targeted
              Current mode:                permissive
              Mode from config file:       enforcing
              Policy MLS status:           enabled
              Policy deny_unknown status:  allow
              Max kernel policy version:   26

       sestatus can also be used to display:

              -   The security context of files and processes listed in the /etc/sestatus.conf file. The format of this file is described in sestatus.conf(5).

              -   The status of booleans.


OPTIONS
       -v
              Displays the contexts of files and processes listed in the /etc/sestatus.conf file. It also checks whether the file is a symbolic link, if so then the context  of  the  target  file  is  also
              shown.

              The following contexts will always be displayed:
                     The current process context
                     The init process context
                     The controlling terminal file context

       -b
              Display the current state of booleans.


FILES
       /etc/sestatus.conf


AUTHOR
       This man page was written by Daniel Walsh <dwalsh@redhat.com>.
       The program was written by Chris PeBenito <pebenito@gentoo.org>


SEE ALSO
       selinux(8), sestatus.conf(5)




Security Enhanced Linux                                                                          26 Nov 2011                                                                                      sestatus(8)
