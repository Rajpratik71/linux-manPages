package-cleanup(1)                                                                                                                                                                         package-cleanup(1)



NAME
       package-cleanup - clean up locally installed, duplicate, or orphaned packages

SYNOPSIS
       package-cleanup [options] <item ...>

DESCRIPTION
       package-cleanup is a program for cleaning up the locally-installed RPMs.

GENERAL OPTIONS
       -c <config file>
              Use alternative config file (default is /etc/yum.conf).

       -h, --help
              Help; display a help message and then quit.

       -q, --quiet
              Print out nothing unnecessary.

       -v, --version
              Report program version and exit.

       -y     Agree to anything asked.

       --leaves
              List leaf nodes in the local RPM database.  Leaf nodes are RPMs that are not relied upon by any other RPM.

       --orphans
              List installed packages which are not available from currently configured repositories. This is identical to "yum list extras", which may provide better output.

       --oldkernels
              Remove old kernel and kernel-devel packages.

       --problems
              List dependency problems in the local RPM database. If any problems are found it will exit with an exit code of 1.

       --dupes
              Scan for duplicates in the local RPM database.

       --cleandupes
              Scan for duplicates in the local RPM database and clean out the older versions.

       --removenewestdupes
              Remove the newest dupes instead of the oldest dupes when cleaning duplicates.

       --noscripts
              Disable rpm scriptlets from running when cleaning duplicates.

       --count <COUNT>
              Number of duplicate/kernel packages to keep on the system (default 2)

LEAVES OPTIONS
       --all  When listing leaf nodes also list leaf nodes that are not libraries.

       --leaf-regex
              A package name that matches this regular expression will be considered a leaf.

       --exclude-devel
              When listing leaf nodes do not list development packages.

       --exclude-bin
              When listing leaf nodes do not list packages with files in bin directories.

OLDKERNELS OPTIONS
       --keepdevel
              Do not remove kernel-devel packages when removing kernels


EXAMPLES
       List all dependency problems:
              package-cleanup --problems

       List all packages that are not in any Yum repository:
              package-cleanup --orphans

       Remove old kernels keeping 3 and leaving old kernel-devel packages installed:
              package-cleanup --oldkernels --count=3 --keepdevel

       List all leaf packages with no files in a bin directory whose name begins with either 'perl' or 'python':
              package-cleanup --leaves --exclude-bin --leaf-regex="^(perl)|(python)"

FILES
       As package-cleanup uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.



Gijs Hollestelle                                                                               03 November 2005                                                                            package-cleanup(1)
