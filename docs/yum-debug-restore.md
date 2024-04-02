yum-debug-restore(1)                                                                                                                                                                     yum-debug-restore(1)



NAME
       yum-debug-restore - replay Yum transactions captured in a debug-dump file

SYNOPSIS
       yum-debug-restore

DESCRIPTION
       yum-debug-restore is a program which takes a gzipped file created by yum-debug-dump and acts on the information about installed packages contained within.

GENERAL OPTIONS
       --output
              Output the commands that would be run to stdout.

       --shell=<file>
              Output the commands that would be run to a file.

       --install-latest
              Ask yum to install the latest version of the given packages, instead of the version that was installed in the debug-dump file.

       --ignore-arch
              Ignore the architecture of the packages, so you can "restore" an i386 debug-dump on an x86_64 machine.

       --filter-types=[install,remove,update,downgrade]
              Only perform the given types of commands, so you can filter to just upgrades and installs.


FILES
       As  yum-debug-restore  uses  YUM  libraries  for  retrieving  all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for
       details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum-debug-dump (1)
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There are of course no bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding  a  resolution  contact  the  mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




James Antill                                                                                   15 December 2011                                                                          yum-debug-restore(1)
