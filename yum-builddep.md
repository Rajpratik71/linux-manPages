yum-builddep(1)                                                                                                                                                                               yum-builddep(1)



NAME
       yum-builddep - install missing dependencies for building an RPM package

SYNOPSIS
       yum-builddep package

       yum-builddep /path/to/local/package.src.rpm

       yum-builddep /path/to/local/package.spec

DESCRIPTION
       yum-builddep  is a program which installs the RPMs needed to build the specified package.  The source RPM for the specified package must be available in a Yum repository (which will be automatically
       enabled, if it is disabled) or it can be a local source RPM or a spec file.

       Note, that only the BuildRequires information within the SRPM header information is used to determine build dependencies. This will specifically omit any dependencies that are required only for spe‐
       cific architectures.

GENERAL OPTIONS
       --target ARCH
              Set target architecture for spec parsing.

       --define 'MACRO EXPR'
              Define the rpm MACRO with value EXPR for spec parsing.

EXAMPLES
       Download and install all the RPMs needed to build the kernel RPM:
              yumdownloader --source kernel && rpm2cpio kernel*src.rpm | cpio -i kernel.spec && \
              yum-builddep kernel.spec

       The  kernel  includes  specific BuildRequires dependencies for different architectures. In order to make sure that those dependencies are downloaded and installed, the SRPM should be downloaded, the
       .spec file extracted from it and used to determine the full dependency list.

FILES
       As yum-builddep uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There are of course no bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding  a  resolution  contact  the  mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




Panu Matilainen                                                                                 17 July 2005                                                                                  yum-builddep(1)
