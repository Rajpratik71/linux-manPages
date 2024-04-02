DEBIAN-DISTRO-INFO(1)                                         General Commands Manual                                        DEBIAN-DISTRO-INFO(1)

NAME
       debian-distro-info - provides information about Debian's distributions

SYNOPSIS
       debian-distro-info [OPTIONS]

OPTIONS
       --date=DATE
              date for calculating the version (default: today)

       -h, --help
              display help message and exit

       --alias=DIST
              print  the alias (oldstable, stable, testing, unstable) relative to the distribution codename passed as an argument.  Only distribu‐
              tion codenames composed of lower case ASCII letters are accepted, and if the distribution does not  qualify  as  oldstable,  stable,
              testing, or unstable, then the same codename passed as argument is returned.

       -a, --all
              list all known versions

       -y[MILESTONE], --days[=MILESTONE]
              display  number  of days until specified version reaches the specified milestone.  MILESTONE may be one of created, release, or eol.
              If no milestone is specified, assume release.  For options that return a list, display the normal output followed by whitespace  and
              the  number  of days until the specified milestone.  If milestone cannot be calculated, the string '(unknown)' is displayed.  Unless
              one of -c, -f or -r is specified, only the number of days will be displayed.

       -d, --devel
              latest development version

       -o, --old
              latest old (stable) version

       --series=SERIES
              series to calculate the version for

       -s, --stable
              latest stable version

       --supported
              list of all supported stable versions

       -t, --testing
              latest testing version

       --unsupported
              list of all unsupported stable versions

       -c, --codename
              print the codename (default)

       -r, --release
              print the release version

       -f, --fullname
              print the full name

SEE ALSO
       distro-info(1), ubuntu-distro-info(1)

AUTHOR
       The script and this manual page was written by Benjamin Drung <bdrung@debian.org>.

distro-info                                                         August 2013                                              DEBIAN-DISTRO-INFO(1)
