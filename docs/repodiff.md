repodiff(1)                                                                                                                                                                                       repodiff(1)



NAME
       repodiff - list differences between two or more Yum repositories

SYNOPSIS
       repodiff --old=old_repo_baseurl --new=new_repo_baseurl

DESCRIPTION
       repodiff is a program which will list differences between two sets of repositories.  Note that by default only source packages are compared.

GENERAL OPTIONS
       --old, -o
              Add a repo. as an old repo. Note that if you prefix the url with "mirror:" then the following url is treated as a mirror and not a baseurl.

       --new, -n
              Add a repo. as an new repo. Note that if you prefix the url with "mirror:" then the following url is treated as a mirror and not a baseurl.

       --archlist, -a
              Add  architectures to change the default from just comparing source packages.  Note that if you want the same as a native "x86_64" architecture machine you just need to pass "x86_64" (this is
              different from earlier versions where you needed to specify "x86_64,athlon,i686,i586,i486,i386,noarch" and you still got "src").

       --size, -s
              Output additional data about the size of the changes.

       --compare-arch
              Normally packages are just compared based on their name, this flag makes the comparison also use the arch. So foo.i386 and foo.x86_64 are different.

       --simple
              Output a simple one line message for modified packages.

       --downgrade
              Split the data for modified packages between upgraded and downgraded packages.

EXAMPLES
       Compare source pkgs in two local repos:
              repodiff --old=/tmp/repo-old --new=/tmp/repo-new

       Compare x86_64 compat. binary pkgs in two remote repos, and two local one:
              repodiff -a x86_64 --old=http://example.com/repo1-old --old=/tmp/repo-old --new=http://example.com/repo1-new --new=/tmp/repo-new

       Compare x86_64 compat. binary pkgs, but also compare arch:
              repodiff -a x86_64 --compare-arch --old=http://example.com/repo1-old --old=/tmp/repo-old --new=http://example.com/repo1-new --new=/tmp/repo-new

       Compare two releases of Fedora (15 => 16):
              repodiff  --old='mirror:https://mirrors.fedoraproject.org/metalink?repo=fedora-source-15&arch=i386'   --new='mirror:https://mirrors.fedoraproject.org/metalink?repo=fedora-source-16&arch=i386'
              --size --simple --downgrade

SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




James Antill                                                                                   21 October 2008                                                                                    repodiff(1)
