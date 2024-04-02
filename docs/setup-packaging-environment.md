PULL-DEBIAN-DEBDIFF(1)                                        General Commands Manual                                       PULL-DEBIAN-DEBDIFF(1)

NAME
       setup-packaging-environment - helps one to get started with Ubuntu development

SYNOPSIS
       setup-packaging-environment

DESCRIPTION
       setup-packaging-environment  aims to make it more straightforward for new contributors to get their Ubuntu installation ready for packaging
       work. It ensures that all four components from Ubuntu's official repositories are enabled along with their corresponding  source  reposito‐
       ries.  It  also  installs  a  minimal  set  of  packages  needed  for Ubuntu packaging work (ubuntu-dev-tools, devscripts, debhelper, cdbs,
       patchutils, pbuilder, and build-essential). Finally, it assists in defining the DEBEMAIL and DEBFULLNAME environment variables.

AUTHORS
       setup-packaging-environment was written by Siegfried-A. Gevatter <rainct@ubuntu.com>.

       This manual page was written by Andrew Starr-Bochicchio <a.starr.b@gmail.com>.

       Both are released under the terms of the GNU General Public License, version 3 or later.

ubuntu-dev-tools                                                     June 2010                                              PULL-DEBIAN-DEBDIFF(1)
