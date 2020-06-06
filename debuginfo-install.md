debuginfo-install(1)                                                                                                                                                                     debuginfo-install(1)



NAME
       debuginfo-install - install debuginfo packages and their dependencies

SYNOPSIS
       debuginfo-install package

DESCRIPTION
       debuginfo-install is a program which installs the RPMs needed to debug the specified package.  The package argument can be a wildcard, but will only match installed packages.  debuginfo-install will
       then enable any debuginfo repositories, and install the relevant debuginfo rpm.

EXAMPLES
       Download and install all the RPMs needed to debug the kernel RPM:
              debuginfo-install kernel

WARNING MESSAGES
       Could not find debuginfo for:
              You may sometimes see warning messages about certain packages not being found if you run debuginfo-install for a wildcard or glob. Debuginfo packages are  not  necessary  for  "noarch"  RPMs;
              these will generate a warning message.  Additionally, On 64-bit systems, no multilib debuginfo packages are published, so if you have 32-bit packages installed, these will also generate warn‐
              ing messages.

FILES
       As debuginfo-install uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which  repositories  to  use.  Consult  YUM  documentation  for
       details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum.conf (5)
       http://yum-utils.baseurl.org/
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.



James Antill                                                                                   21 October 2008                                                                           debuginfo-install(1)
