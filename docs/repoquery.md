repoquery(1)                                                                                                                                                                                     repoquery(1)



NAME
       repoquery - query information from Yum repositories

SYNOPSIS
       repoquery [options] <item ...>
       repoquery -a [options]

DESCRIPTION
       repoquery is a program for querying information from YUM repositories similarly to rpm queries.

GENERAL OPTIONS
       --querytags
              List valid queryformat tags and exit..

       --version
              Report program version and exit.

       --repoid=<repo>
              Specify  which  repository  to  query. Using this option disables all repositories not explicitly enabled with --repoid option (can be used multiple times). By default repoquery uses whatever
              repositories are enabled in YUM configuration.

       --enablerepo=<repo>
              In addition to the default set, query the given additional repository, even if it is disabled in YUM configuration.  Can be used multiple times.

       --disablerepo=<repo>
              Do not query the given repository, even if it is enabled in YUM configuration.  Can be used multiple times.

       --repofrompath=<repoid>,<path/url>
              Specify a path or url to a repository (same path as in a baseurl) to add to the repositories for this query. This option can be used multiple times. If you want to view  only  the  pkgs  from
              this repository combine this with --repoid. The repoid for the repository is specified by <repoid>.

       --plugins
              Enable YUM plugin support.

       -q, --query
              For rpmquery compatibility, doesn't do anything.

       -h, --help
              Help; display a help message and then quit.

       --quiet
              Run quietly: no warnings printed to stderr.

       --verbose
              Produce verbose output.

       -C, --cache
              Tells  repoquery  to run entirely from YUM cache - does not download any metadata or update the cache. Queries in this mode can fail or give partial/incorrect results if the cache isn't fully
              populated beforehand with eg "yum makecache".

       --tempcache
              Create and use a private cache instead of the main YUM cache. This is used by default when run as non-root user.

       -c <config file>, --config=<config file>
              Use alternative config file (default is /etc/yum.conf).

       --releasever=version
              Pretend the current release version is the given string. This is very useful when combined with --installroot. You can also use --releasever=/ to take the releasever information from  outside
              the  installroot.   Note  that  with the default upstream cachedir, of /var/cache/yum, using this option will corrupt your cache (and you can use $releasever in your cachedir configuration to
              stop this).

       --installroot=root
              Specifies an alternative installroot, relative to which all packages will be installed. Think of this like doing "chroot <root> yum" except using --installroot allows yum to work  before  the
              chroot  is  created.   Note: You may also want to use the option --releasever=/ when creating the installroot as otherwise the $releasever value is taken from the rpmdb within the installroot
              (and thus. will be empty, before creation).

       --setopt=option=value
              Set any config option in yum config or repo files. For options in the global config just use: --setopt=option=value for repo options use: --setopt=repoid.option=value


PACKAGE QUERY OPTIONS
       -i, --info
              Show general information about package similarly to "rpm -qi"

       -l, --list
              List files in package.

       -R, --requires
              List package dependencies.

       --resolve
              When used with --requires, resolve capabilities to originating packages.

       --provides
              List capabilities package provides.

       --obsoletes
              List capabilities obsoleted by package.

       --conflicts
              List capabilities conflicting with package.

       --changelog
              List package changelog.

       --location
              Show a location where the package could be downloaded from.  For example: wget `repoquery --location yum`

       -s, --source
              Show package source RPM name.

       --srpm Operate on corresponding source RPM.

       --groupmember PACKAGE
              List the repodata groups (yumgroups.xml) belongs to (if any).

       --nvr  Use name-version-release output format (rpm query default)

       --nevra
              Use name-epoch:version-release.architecture output format (default)

       --envra
              Use epoch:name-version-release.architecture output format (easier to parse than nevra)

       --qf=FORMAT, --queryformat=FORMAT
              Specify custom output format for queries. You can add ":date", ":day" and ":isodate" to all the tags that are a time, and you can add ":k", ":m", ":g", ":t" and ":h" to sizes.  You  can  also
              specify field width as in sprintf (Eg. %-20{name})

       --output [text|ascii-tree|dot-tree]
              Output format which can be used with --requires/--whatrequires/--obsoletes/--conflicts.  Default output is 'text'.

       --level [all|any int]
              In combination with --output ascii-tree|dot-tree this option specifies the number of level to print on the tree. Default level is 'all'.

PACKAGE SELECTION OPTIONS
       -a, --all
              Query all available packages (for rpmquery compatibility / shorthand for repoquery '*')

       --show-duplicates
              Query all versions of packages.

       -f, --file FILE
              Query package owning FILE.

       --whatobsoletes CAPABILITY
              Query all packages that obsolete CAPABILITY.

       --whatconflicts CAPABILITY
              Query all packages that conflict with CAPABILITY.

       --whatprovides CAPABILITY
              Query all packages that provide CAPABILITY.

       --whatrequires CAPABILITY
              Query all packages that require CAPABILITY.

       --alldeps
              When used with --whatrequires, look for non-explicit dependencies in addition to explicit ones (e.g. files and Provides in addition to package names).  This is the default.

       --exactdeps
              When used with --whatrequires, search for dependencies only exactly as given.  This is effectively the opposite of --alldeps.

       --recursive
              When used with --whatrequires, and --requires --resolve, query packages recursively.

       --archlist=ARCH1[,ARCH2...]
              Limit  the  query to packages of given architecture(s). Valid values are all architectures known to rpm/yum such as 'i386' and 'src' for source RPMS. Note that repoquery will now change yum's
              "arch" to the first value in the archlist. So "--archlist=i386,i686" will change yum's canonical arch to i386, but allow packages of i386 and i686.

       --pkgnarrow=WHAT
              Limit what packages are considered for the query. Valid values for WHAT are: installed, available, recent, updates, extras, all and repository (default).

       --installed
              Restrict query ONLY to installed pkgs - disables all repos and only acts on rpmdb.


GROUP QUERY OPTIONS
       -i, --info
              Show general information about group.

       -l, --list
              List packages belonging to (required by) group.

       --grouppkgs=WHAT
              Specify what type of packages are queried from groups. Valid values for WHAT are all, mandatory, default, optional.

       --requires
              List groups required by group.

GROUP SELECTION OPTIONS
       -a     Query all available groups.

       -g, --group
              Query groups instead of packages.

EXAMPLES
       List all packages whose name contains 'perl':
              repoquery '*perl*'

       List all packages depending on openssl:
              repoquery --whatrequires openssl

       List all package names and the repository they come from, nicely formatted:
              repoquery -a --qf "%-20{repoid} %{name}"

       List name and summary of all available updates (if any), nicely formatted:
              repoquery -a --pkgnarrow=updates --qf "%{name}:\n%{summary}\n"

       List optional packages in base group:
              repoquery -g --grouppkgs=optional -l base

       List build requirements from 'anaconda' source rpm:
              repoquery --requires anaconda.src

       List packages which BuildRequire gail-devel
              repoquery --archlist=src --whatrequires gail-devel
                NB: This command will only work if you have repositories enabled which include srpms.



MISC
       Specifying package names
              A package can be referred to in all queries with any of the following:

              name
              name.arch
              name-ver
              name-ver-rel
              name-ver-rel.arch
              name-epoch:ver-rel.arch
              epoch:name-ver-rel.arch

              For example: repoquery -l kernel-2.4.1-10.i686
              Additionally wildcards (shell-style globs) can be used.


FILES
       As repoquery uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for details:

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




Panu Matilainen                                                                                17 October 2005                                                                                   repoquery(1)
