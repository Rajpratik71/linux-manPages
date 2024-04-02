createrepo(8)                                                                                                                                                                                   createrepo(8)



NAME
       createrepo - Create repomd (xml-rpm-metadata) repository


SYNOPSIS
       createrepo [options] <directory>

DESCRIPTION
       createrepo is a program that creates a repomd (xml-based rpm metadata) repository from a set of rpms.


OPTIONS
       -u --baseurl <url>
              Optional base URL location for all files.

       -o --outputdir <url>
              Optional output directory (useful for read only media).

       -x --excludes <package>
              File globs to exclude, can be specified multiple times.

       -i --pkglist <filename>
              specify a text file which contains the complete list of files to include in the repository from the set found in the directory. File format is one package per line, no wildcards or globs.

       -n --includepkg
              specify pkgs to include on the command line. Takes urls as well as local paths.

       -q --quiet
              Run quietly.

       -g --groupfile <groupfile>
              A precreated xml filename to point to for group information.
              See examples section below for further explanation.

       -v --verbose
              Run verbosely.

       -c --cachedir <path>
              Specify  a  directory  to use as a cachedir. This allows createrepo to create a cache of checksums of packages in the repository. In consecutive runs of createrepo over the same repository of
              files that do not have a complete change out of all packages this decreases the processing time dramatically.

       --basedir
              Basedir for path to directories in the repodata, default is the current working directory.

       --update
              If metadata already exists in the outputdir and an rpm is unchanged (based on file size and mtime) since the metadata was generated, reuse the existing metadata rather than recalculating  it.
              In the case of a large repository with only a few new or modified rpms this can significantly reduce I/O and processing time.

       --skip-stat
              skip the stat() call on a --update, assumes if the filename is the same then the file is still the same (only use this if you're fairly trusting or gullible).

       --update-md-path
              Use the existing repodata for --update, from this path.

       -C --checkts
              Don't  generate repo metadata, if their timestamps are newer than its rpms.  This option decreases the processing time drastically again, if you happen to run it on an unmodified repo, but it
              is (currently) mutual exclusive with the --split option. NOTE: This command will not notice when packages have been removed from repo. Use --update to handle that.

       --split
              Run in split media mode. Rather than pass a single directory, take a set of directories corresponding to different volumes in a media set.

       -p --pretty
              Output xml files in pretty format.

       --version
              Output version.

       -h --help
              Show help menu.


       -d --database
              Generate sqlite databases for use with yum. This is now the default.


       --no-database
              Do not generate sqlite databases in the repository.


       -S --skip-symlinks
              Ignore symlinks of packages

       -s --checksum
              Choose the checksum type used in repomd.xml and for packages in the metadata.  The default is now "sha256" (if python has hashlib). The older default was "sha", which is actually "sha1", how‐
              ever explicitly using "sha1" doesn't work on older (3.0.x) versions of yum, you need to specify "sha".

       --profile
              Output time based profiling information.

       --changelog-limit CHANGELOG_LIMIT
              Only import the last N changelog entries, from each rpm, into the metadata

       --unique-md-filenames
              Include the file's checksum in the metadata filename, helps HTTP caching (default)


       --simple-md-filenames
              Do not include the file's checksum in the metadata filename.


       --retain-old-md
              Keep around the latest (by timestamp) N copies of the old repodata (so clients with older repomd.xml files can still access it). Default is 0.


       --distro
              Specify distro tags. Can be specified more than once. Optional syntax specifying a cpeid(http://cpe.mitre.org/) --distro=cpeid,distrotag

       --content
              Specify keyword/tags about the content of the repository. Can be specified more than once.

       --repo Specify keyword/tags about the repository itself. Can be specified more than once.

       --revision
              Arbitrary string for a repository revision.

       --deltas
              Tells createrepo to generate deltarpms and the delta metadata

       --oldpackagedirs PATH
              paths to look for older pkgs to delta against. Can be specified multiple times

       --num-deltas int
              the number of older versions to make deltas against. Defaults to 1

       --read-pkgs-list READ_PKGS_LIST
              output the paths to the pkgs actually read useful with  --update

       --max-delta-rpm-size MAX_DELTA_RPM_SIZE
              max size of an rpm that to run deltarpm against (in bytes)

       --workers WORKERS
              number of workers to spawn to read rpms

       --compress-type
              specify which compression method to use: compat (default), xz (may not be available), gz, bz2.

EXAMPLES
       Here is an example of a repository with a groups file. Note that the groups file should be in the same directory as the rpm packages (i.e. /path/to/rpms/comps.xml).

       createrepo -g comps.xml /path/to/rpms


FILES
       repodata/filelists.xml.gz
       repodata/other.xml.gz
       repodata/primary.xml.gz
       repodata/repomd.xml

SEE ALSO
       yum (8) yum.conf (5)


AUTHORS
       See the Authors file


BUGS
       Any bugs which are found should be emailed to the mailing list: rpm-metadata@lists.baseurl.org or reported in trac at: http://createrepo.baseurl.org



Seth Vidal                                                                                        2005 Jan 2                                                                                    createrepo(8)
