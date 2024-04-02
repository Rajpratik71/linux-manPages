reposync(1)                                                                                                                                                                                       reposync(1)



NAME
       reposync - synchronize yum repositories to a local directory

SYNOPSIS
       reposync [options]

DESCRIPTION
       reposync is used to synchronize a remote yum repository to a local directory, using yum to retrieve the packages.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       -c CONFIG, --config=CONFIG
              Config file to use (defaults to /etc/yum.conf).

       -a ARCH, --arch=ARCH
              Act as if running the specified arch (default: current arch, note: does not override $releasever. x86_64 is a superset for i*86.).

       --source
              Also download .src.rpm files.

       -r REPOID, --repoid=REPOID
              Specify repo ids to query, can be specified multiple times (default is all enabled).

       -e CACHEDIR, --cachedir CACHEDIR
              Directory in which to store metadata.

       -t, --tempcache
              Use a temp dir for storing/accessing yum-cache.

       -d, --delete
              Delete local packages no longer present in repository.

       -p DESTDIR, --download_path=DESTDIR
              Path to download packages to: defaults to current directory.

       --norepopath
              Don't add the reponame to the download path.  Can only be used when syncing a single repository (default is to add the reponame).

       -g, --gpgcheck
              Remove packages that fail GPG signature checking after downloading.  exit status is '1' if at least one package was removed.

       -u, --urls
              Just list urls of what would be downloaded, don't download.

       -l, --plugins
              Enable yum plugin support.

       -m, --downloadcomps
              Also download comps.xml.

       --download-metadata
              Download all the non-default metadata.

       -n, --newest-only
              Download only newest packages per-repo.

       -q, --quiet
              Output as little information as possible.

       --allow-path-traversal
              Allow packages stored outside their repo directory to be synced.  These are packages that are referenced in metadata by using absolute paths or up-level ".." symbols, and are normally skipped
              by reposync for security reasons.

              CAUTION: Using this option has potential security implications since, by providing malicious repodata, an attacker could make reposync write to arbitrary locations on the file system that are
              accessible by the user running it.

EXAMPLES
       Sync all packages from the 'updates' repo to the current directory:
               reposync --repoid=updates

       Sync only the newest packages from the 'updates' repo to the current directory:
               reposync -n --repoid=updates

       Sync packages from the 'updates' and 'extras' repos to the current directory:
               reposync --repoid=updates --repoid=extras

       Sync all packages from the 'updates' repo to the repos directory:
               reposync -p repos --repoid=updates

       Sync all packages from the 'updates' repo to the repos directory excluding x86_64 arch. Edit /etc/yum.conf adding option exclude=*.x86_64. Then:
              reposync -p repos --repoid=updates

FILES
       reposync uses the yum libraries for retrieving information and packages. If no configuration file is specified, the default yum configuration will be used.

       /etc/yum.conf
       /etc/yum/repos.d/

SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/

AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




                                                                                                27 April 2007                                                                                     reposync(1)
