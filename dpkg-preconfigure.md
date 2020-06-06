DPKG-PRECONFIGURE(8)                                                                             Debconf                                                                             DPKG-PRECONFIGURE(8)

NAME
       dpkg-preconfigure - let packages ask questions prior to their installation

SYNOPSIS
        dpkg-preconfigure [options] package.deb

        dpkg-preconfigure --apt

DESCRIPTION
       dpkg-preconfigure lets packages ask questions before they are installed.  It operates on a set of debian packages, and all packages that use debconf will have their config script run so they can
       examine the system and ask questions.

OPTIONS
       -ftype, --frontend=type
           Select the frontend to use.

       -pvalue, --priority=value
           Set the lowest priority of questions you are interested in. Any questions with a priority below the selected priority will be ignored and their default answers will be used.

       --terse
           Enables terse output mode. This affects only some frontends.

       --apt
           Run in apt mode. It will expect to read a set of package filenames from stdin, rather than getting them as parameters. Typically this is used to make apt run dpkg-preconfigure on all
           packages before they are installed.  To do this, add something like this to /etc/apt/apt.conf:

            // Pre-configure all packages before
            // they are installed.
            DPkg::Pre-Install-Pkgs {
                   "dpkg-preconfigure --apt --priority=low";
            };

       -h, --help
           Display usage help.

SEE ALSO
       debconf(7)

AUTHOR
       Joey Hess <joeyh@debian.org>

                                                                                                2019-05-06                                                                           DPKG-PRECONFIGURE(8)
