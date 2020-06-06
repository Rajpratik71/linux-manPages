yum-debug-dump(1)                                                                                                                                                                           yum-debug-dump(1)



NAME
       yum-debug-dump - write system RPM configuration to a debug-dump file

SYNOPSIS
       yum-debug-dump

DESCRIPTION
       yum-debug-dump is a program which creates a gzipped file containing a lot of information useful to developers trying to debug a problem.

       By  default  it  will  output a file to the current working directory named yum_debug_dump-<hostname>-<time>.txt.gz. This file contains no private information but does contain a complete list of all
       packages you have installed, all packages available in any repository, important configuration and system information.  You can view this file using the 'zless' command.

       You can use the coresponding program yum-debug-restore to act on this file and restore a set of packages (much like dump/restore).

FILES
       As yum-debug-dump uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum-debug-restore (1)
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There are of course no bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding  a  resolution  contact  the  mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




Seth Vidal                                                                                      28 April 2008                                                                               yum-debug-dump(1)
