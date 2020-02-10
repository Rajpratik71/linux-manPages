DCONTROL(1)                                                                                                                                                                                   DCONTROL(1)

NAME
       dcontrol -- Query package and source control files for all Debian distributions

SYNOPSIS
       dcontrol [options] package[modifiers] ...

DESCRIPTION
       dcontrol queries a remote database of Debian binary and source package control files. It can be thought of as an apt-cache webservice that also operates for distributions and architectures
       different from the local machine.

MODIFIERS
       Like apt-cache, packages can be suffixed by modifiers:

       =version
           Exact version match

       @architecture
           Query this only architecture. Use @source for source packages, @binary excludes source packages.

       /[archive:][suite][/component]
           Restrict to archive (debian, debian-backports, debian-security, debian-volatile), suite (always codenames, with the exception of experimental), and/or component (main, updates/main, ...).
           Use two slashes (//) to separate suite and component if the suite name contains slashes.  (Component can be left empty.)

       By default, all versions, suites, and architectures are queried. Refer to https://qa.debian.org/cgi-bin/dcontrol for currently supported values.

OPTIONS
       -s, --show-suites
           Add headers showing which distribution the control file is from.

       -d, --debug
           Print URL queried.

       -h, --help
           Show a help message.

       -V, --version
           Show version information.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.  Command line options can be used to override
       configuration file settings.  Environment variable settings are ignored for this purpose.  The currently recognised variable is:

       DCONTROL_URL
           URL to query. Default is https://qa.debian.org/cgi-bin/dcontrol.

AUTHOR
       This program is Copyright (C) 2009 by Christoph Berg <myon@debian.org>.

       This program is licensed under the terms of the GPL, either version 2 of the License, or (at your option) any later version.

SEE ALSO
       apt-cache(1)

Debian Utilities                                                                                2016-03-23                                                                                    DCONTROL(1)
