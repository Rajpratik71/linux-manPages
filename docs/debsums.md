DEBSUMS(1)                                                    General Commands Manual                                                   DEBSUMS(1)

NAME
       debsums - check the MD5 sums of installed Debian packages

SYNOPSIS
       debsums [options] [package|deb] ...

DESCRIPTION
       Verify installed Debian package files against MD5 checksum lists from /var/lib/dpkg/info/*.md5sums.

       debsums can generate checksum lists from deb archives for packages that don't include one.

OPTIONS
       -a, --all
              Also check configuration files (normally excluded).

       -e, --config
              Only check configuration files.

       -c, --changed
              Report changed file list to stdout (implies -s).

       -l, --list-missing
              List packages (or debs) which don't have an MD5 sums file.

       -s, --silent
              Only report errors.

       -m, --md5sums=file
              Read list of deb checksums from file.

       -r, --root=dir
              Root directory to check (default /).

       -d, --admindir=dir
              dpkg admin directory (default /var/lib/dpkg).

       -p, --deb-path=dir[:dir...]
              Directories in which to look for debs derived from the package name (default is the current directory).

              A useful value is /var/cache/apt/archives when using apt-get autoclean or not clearing the cache at all.  The command:

                     apt-get --reinstall -d install `debsums -l`

              may be used to populate the cache with any debs not already in the cache.

              Note:  This doesn't work for CD-ROM and other local sources as packages are not copied to /var/cache.  Simple file sources (all debs
              in a single directory) should be added to the -p list.

       -g, --generate=[missing|all][,keep[,nocheck]]
              Generate MD5 sums from deb contents.  If the argument is a package name rather than a deb archive, the program will look for  a  deb
              named package_version_arch.deb in the directories given by the -p option.

              missing
                     Generate MD5 sums from the deb for packages which don't provide one.

              all    Ignore the on disk sums and use the one supplied in the deb, or generated from it if none exists.

              keep   Write the extracted/generated sums to /var/lib/dpkg/info/package.md5sums.

              nocheck
                     Implies keep; the extracted/generated sums are not checked against the installed package.

              For backward compatibility, the short option -g is equivalent to --generate=missing.

       --no-locale-purge
              Report missing locale files even if localepurge is configured.

       --no-prelink
              Report changed ELF files even if prelink is configured.

       --ignore-permissions
              Treat permission errors as warnings when running as non-root.

       --help
       --version
              Print help and version information.

EXIT STATUS
       debsums returns 0 on success, or a combination* of the following values on error:

       1      A specified package or archive name was not installed, invalid or the installed version did not match the given archive.

       2      Changed or missing package files, or checksum mismatch on an archive.

       255    Invalid option.

       *If both of the first two conditions are true, the exit status will be 3.

EXAMPLES
       debsums foo bar
              Check the sums for installed packages foo and bar.

       debsums foo.deb bar.deb
              As above, using checksums from (or generated from) the archives.

       debsums -l
              List installed packages with no checksums.

       debsums -ca
              List changed package files from all installed packages with checksums.

       debsums -ce
              List changed configuration files.

       debsums -cagp /var/cache/apt/archives
              As above, using sums from cached debs where available.

       apt-get install --reinstall $(dpkg -S $(debsums -c) | cut -d : -f 1 | sort -u)
              Reinstalls packages with changed files.

RESULTS
       OK     The file's MD5 sum is good.

       FAILED The file's MD5 sum does not match.

       REPLACED
              The file has been replaced by a file from a different package.

NOTES
       In order to create md5sums files for the already installed packages which don't have them, you must run debsums_init once after the instal‐
       lation of debsums package.

SEE ALSO
       md5sum(1), debsums_init(8)

ENVIRONMENT
       TMPDIR Directory for extracting information and contents from package archives (/tmp by default).

CAVEATS
       While in general the program may be run as a normal user, some packages contain files which are not globally readable so cannot be checked.
       Privileges are of course also required when generating sums with the keep option set.

       Files which have been replaced by another package may be erroneously reported as changed.

       debsums  is  intended  primarily as a way of determining what installed files have been locally modified by the administrator or damaged by
       media errors and is of limited use as a security tool.

       If you are looking for an integrity checker that can run from safe media, do integrity checks on checksum databases and can be easily  con‐
       figured to run periodically to warn the admin of changes see other tools such as: aide, integrit, samhain, or tripwire.

AUTHOR
       Written by Brendan O'Dea <bod@debian.org>.
       Based on a program by Christoph Lameter <clameter@debian.org> and Petr Cech <cech@debian.org>.

COPYRIGHT
       Copyright © 2002  Brendan O'Dea <bod@debian.org>
       This  is  free software, licensed under the terms of the GNU General Public License.  There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE.

User Commands                                                         Debian                                                            DEBSUMS(1)
