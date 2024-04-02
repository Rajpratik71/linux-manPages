yumdownloader(1)                                                                                                                                                                             yumdownloader(1)



NAME
       yumdownloader - download RPM packages from Yum repositories

SYNOPSIS
       yumdownloader [options] package1 [package2...]

DESCRIPTION
       yumdownloader is a program for downloading RPMs from Yum repositories.

GENERAL OPTIONS
       -h, --help
              Help; display a help message and then quit.

       --destdir DIR
              Specify a destination directory for the download.  Defaults to the current directory.

       --urls Instead of downloading RPMs, list the URLs that would be downloaded.

       --resolve
              When downloading RPMs, resolve dependencies and also download the required packages.

       --source
              Instead of downloading the binary RPMs, download the source RPMs.

       --archlist=ARCH1[,ARCH2...]
              Limit  the  query to packages of given and compatible architectures. Valid values are all architectures known to rpm/yum such as 'i386' and 'src' for source RPMS. Note that repoquery will now
              change yum's "arch" to the first value in the archlist. So "--archlist=i386,i686" will change yum's canonical arch to i386, but allow packages of i386 and i686.

ADDITIONAL OPTIONS
       Yumdownloader inherits all other options from yum. See the yum(8) man page for more information


EXAMPLES
       Download the kernel RPM to /var/tmp:
              yumdownloader --destdir /var/tmp kernel

       List the URL for the kernel and kernel-smp RPMs:
              yumdownloader --urls kernel kernel-smp

FILES
       As yumdownloader uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

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




Gijs Hollestelle                                                                               28 November 2005                                                                              yumdownloader(1)
