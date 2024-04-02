INSTALLCHECK(1)                                                                                    LIBSOLV                                                                                    INSTALLCHECK(1)



NAME
       installcheck - find out which packages cannot be installed

SYNOPSIS
       installcheck ARCH REPO1 REPO2... --nocheck NREPO1 NREPO2...

DESCRIPTION
       The installcheck tool checks if all packages in REPO1...REPON are installable. A package is installable if there is a set of packages from the repositories that satisfies its dependencies. The
       repositories after the --nocheck option are only used for dependency resolving, but the tool does not check if the packages in them are installable.

       A Repository can be a solv file, a rpmmd primary.xml.gz file, a SUSE packages or packages.gz file, or a Debian Packages or Packages.gz file.

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                  INSTALLCHECK(1)
