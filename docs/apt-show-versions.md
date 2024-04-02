APT-SHOW-VERSIONS(1p)                                   User Contributed Perl Documentation                                  APT-SHOW-VERSIONS(1p)

NAME
       apt-show-versions - Lists available package versions with distribution

DESCRIPTION
       apt-show-versions parses the dpkg status file and the APT lists for the installed and available package versions and distribution and shows
       upgrade options within the specific distribution of the selected package.

       This is really useful if you have a mixed stable/testing environment and want to list all packages which are from testing and can be
       upgraded in testing.

       apt-show-versions uses caching for the status information of installed and available packages. If you run apt-show-versions as root the
       cache is updated as needed. If you run as non-root uses the newest available information, but can't update the cache. If you run as root
       with the option -i the cache is initialized or updated only.

SYNOPSIS
       apt-show-versions [-h] [[-p] package name] [-a] [-b]

OPTIONS
       If you don't give any options the status of all installed packages is printed.

       -p package, --package=package
           Print available and installed versions for specified package. You can also specify a package name without the option -p. If -p and a
           package name are missing, all installed packages are displayed.

       -r, --regex
           interpret package from option -p as a regex.

       -R, --regex-all
           like --regex, but also show matching packages which are not installed

       -u, --upgradeable
           Print only upgradeable packages

       -a, --allversions
           Print all available versions of the selected packages

       -b, --brief
           Print only package_name/distribution for upgradeable packages

       -v, --verbose
           Prints out messages about which package files are parsed.

       -V, --version
           Prints out version of apt-show-versions

       -i, --initialize
           Initialize or update package cache only (as root). Do this every time when the status of the installed or available packages has
           changed. Initialization is done automatically on installation of the package and via a cron.daily job.

       -stf file, --status-file=file
           Use file as the dpkg status file instead of /var/lib/dpkg/status

       -ld directory, --list-dir=directory
           Use directory as path to apt's list files instead of /var/state/apt/lists/ or /var/lib/apt/lists/

       -h, --help
           Prints out command-line help.

EXIT CODES
       0   No error

       1   Wrong usage

       2   apt-show-versions has been called with exactly one package and upgradeable option set, but package is uptodate. As no output has been
           requested, this case gets signaled using the exit code.

       255 Unspecified error

EXAMPLES
       If you want to know for all your installed packages whether they are uptodate or upgradeable, use:

           apt-show-versions

       If you want to have a list of all upgradeable packages:

           apt-show-versions -u

       To get a list of all available versions of libc6:

           apt-show-versions -a -p libc6

       To get information about several packages:

           apt-show-versions dpkg apt

           apt-show-versions -r ^texlive

       To upgrade all packages in testing:

           apt-get install `apt-show-versions -u -b | grep testing`

AUTHOR
       Christoph Martin, martin@uni-mainz.de

SEE ALSO
       apt(8), dpkg(1)

perl v5.20.1                                                        2015-01-21                                               APT-SHOW-VERSIONS(1p)
