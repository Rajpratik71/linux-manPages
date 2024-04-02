mergerepo(1)                                                                                                                                                                                     mergerepo(1)



NAME
       mergerepo - Merge multiple repositories together


SYNOPSIS
       mergerepo --repo repo1 --repo repo2

DESCRIPTION
       mergerepo is a program that allows you merge multiple repositories into a single repository while referring to the remote location for all packages.


OPTIONS
       -r --repo <url>
              Url to a repository to be merged.


       -o --outputdir <directory>
              Path where merged repository metadata should be written to. If not specified repository metadata will be written to `pwd`/merged_repo/.


       -d --database
              Generate sqlite databases of the merged repository metadata. This is now the default.


       -a --archlist
              Specify a comma-separated list of architectures to use. Defaults to ALL.


       --nogroups
              Do not merge/include groups metadata in the repository.


       --noupdateinfo
              Do not merge/include updateinfo metadata in the repository.


       --no-database
              Do not generate sqlite databases in the repository.


       --compress-type <compress-type>
              Specify which compression type to use: compat (default), xz (may not be available), gz, bz2.


       --version
              Output version.


       -h --help
              Show help menu.


EXAMPLES
       $ mergerepo --repo=http://myurl.org/repo1 --repo=http://myurl.org/repo2 -d -o /tmp/mymergedrepo


SEE ALSO
       createrepo (8)


AUTHORS
       Seth Vidal <skvidal@fedoraproject.org>


BUGS
       Any bugs which are found should be emailed to the mailing list: rpm-metadata@lists.baseurl.org or filed as tickets at: http://createrepo.baseurl.org/




Seth Vidal                                                                                       2008 Oct 21                                                                                     mergerepo(1)
