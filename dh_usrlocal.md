DH_USRLOCAL(1)                                 Debhelper                                DH_USRLOCAL(1)

NAME
       dh_usrlocal - migrate usr/local directories to maintainer scripts

SYNOPSIS
       dh_usrlocal [debhelper options] [-n]

DESCRIPTION
       dh_usrlocal is a debhelper program that can be used for building packages that will provide a
       subdirectory in /usr/local when installed.

       It finds subdirectories of usr/local in the package build directory, and removes them,
       replacing them with maintainer script snippets (unless -n is used) to create the directories at
       install time, and remove them when the package is removed, in a manner compliant with Debian
       policy. These snippets are inserted into the maintainer scripts by dh_installdeb. See
       dh_installdeb(1) for an explanation of debhelper maintainer script snippets.

       When the DEB_RULES_REQUIRES_ROOT environment variable is not (effectively) binary-targets, the
       directories in /usr/local will be handled as if they were owned by root:root (see below).

       When the DEB_RULES_REQUIRES_ROOT environment variable has an effective value of binary-targets,
       the owners, groups and permissions will be preserved with the sole exception where the
       directory is owned by root:root.

       If a directory is owned by root:root, then ownership will be determined at install time.  The
       ownership and permission bits will either be root:root mode 0755 or root:staff mode 02775.  The
       actual choice depends on whether the system has /etc/staff-group-for-usr-local (as documented
       in the Debian Policy Manual §9.1.2 since version 4.1.4)

OPTIONS
       -n, --no-scripts
           Do not modify postinst/prerm scripts.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

CONFORMS TO
       Debian policy, version 2.2

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Andrew Stribblehill <ads@debian.org>

12.6.1ubuntu2                                 2019-09-17                                DH_USRLOCAL(1)
