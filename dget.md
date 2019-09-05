DGET(1)                                                                                                                                    DGET(1)

NAME
       dget -- Download Debian source and binary packages

SYNOPSIS
       dget [options] URL ...
       dget [options] [--all] package[=version] ...

DESCRIPTION
       dget downloads Debian packages.  In the first form, dget fetches the requested URLs.  If this is a .dsc or .changes file, then dget acts as
       a source-package aware form of wget: it also fetches any files referenced in the .dsc/.changes file.  The downloaded source is then checked
       with dscverify and, if successful, unpacked by dpkg-source.

       In the second form, dget downloads a binary package (i.e., a .deb file) from the Debian mirror configured in /etc/apt/sources.list(.d).
       Unlike apt-get install -d, it does not require root privileges, writes to the current directory, and does not download dependencies.  If a
       version number is specified, this version of the package is requested.  With --all, the list of all binaries for the source package package
       is extracted from the output of "apt-cache showsrc package".

       In both cases dget is capable of getting several packages and/or URLs at once.

       (Note that .udeb packages used by debian-installer are located in separate packages files from .deb packages. In order to use .udebs with
       dget, you will need to have configured apt to use a packages file for component/debian-installer).

       Before downloading files listed in .dsc and .changes files, and before downloading binary packages, dget checks to see whether any of these
       files already exist.  If they do, then their md5sums are compared to avoid downloading them again unnecessarily.  dget also looks for
       matching files in /var/cache/apt/archives and directories given by the --path option or specified in the configuration files (see below).
       Finally, if downloading (.orig).tar.gz or .diff.gz files fails, dget consults apt-get source --print-uris.  Download backends used are curl
       and wget, looked for in that order.

       dget was written to make it easier to retrieve source packages from the web for sponsor uploads.  For checking the package with debdiff,
       the last binary version is available via dget package, the last source version via apt-get source package.

OPTIONS
       -a, --all
           Interpret package as a source package name, and download all binaries as found in the output of "apt-cache showsrc package".  If
           package is arch-qualified, then only binary packages which are "Arch: all", "Arch: any", or "Arch: $arch" will be downloaded.

       -b, --backup
           Move files that would be overwritten to ./backup.

       -q, --quiet
           Suppress wget/curl non-error output.

       -d, --download-only
           Do not run dpkg-source -x on the downloaded source package.  This can only be used with the first method of calling dget.

       -x, --extract
           Run dpkg-source -x on the downloaded source package to unpack it.  This option is the default and can only be used with the first
           method of calling dget.

       -u, --allow-unauthenticated
           Do not attempt to verify the integrity of downloaded source packages using dscverify.

       --build
           Run dpkg-buildpackage -b -uc on the downloaded source package.

       --path DIR[:DIR ...]
           In addition to /var/cache/apt/archives, dget uses the colon-separated list given as argument to --path to find files with a matching
           md5sum.  For example: "--path /srv/pbuilder/result:/home/cb/UploadQueue".  If DIR is empty (i.e., "--path ''" is specified), then any
           previously listed directories or directories specified in the configuration files will be ignored.  This option may be specified
           multiple times, and all of the directories listed will be searched; hence, the above example could have been written as: "--path
           /srv/pbuilder/result --path /home/cb/UploadQueue".

       --insecure
           Allow SSL connections to untrusted hosts.

       --no-cache
           Bypass server-side HTTP caches by sending a Pragma: no-cache header.

       -h, --help
           Show a help message.

       -V, --version
           Show version information.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.
       Command line options can be used to override configuration file settings.  Environment variable settings are ignored for this purpose.  The
       currently recognised variable is:

       DGET_PATH
           This can be set to a colon-separated list of directories in which to search for files in addition to the default
           /var/cache/apt/archives.  It has the same effect as the --path command line option.  It is not set by default.

       DGET_UNPACK
           Set to 'no' to disable extracting downloaded source packages.  Default is 'yes'.

       DGET_VERIFY
           Set to 'no' to disable checking signatures of downloaded source packages.  Default is 'yes'.

EXAMPLES
       Download all .deb files for the previous version of a package and run debdiff on them:

         dget --all mypackage=1.2-1
         debdiff --from *_1.2-1_*.deb --to *_1.2-2_*.deb

BUGS AND COMPATIBILITY
       dget package should be implemented in apt-get install -d.

       Before devscripts version 2.10.17, the default was not to extract the downloaded source. Set DGET_UNPACK=no to revert to the old behaviour.

AUTHOR
       This program is Copyright (C) 2005-2013 by Christoph Berg <myon@debian.org>.  Modifications are Copyright (C) 2005-06 by Julian Gilbey
       <jdg@debian.org>.

       This program is licensed under the terms of the GPL, either version 2 of the License, or (at your option) any later version.

SEE ALSO
       apt-get(1), curl(1), debcheckout(1), debdiff(1), dpkg-source(1), wget(1)

Debian Utilities                                                    2016-03-23                                                             DGET(1)
