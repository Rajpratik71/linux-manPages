FSG(1)                                                                                               FSG                                                                                               FSG(1)



NAME
       FSG - manual page for FSG lsb_release v2.0

SYNOPSIS
       lsb_release [OPTION]...

DESCRIPTION
       FSG lsb_release v2.0 prints certain LSB (Linux Standard Base) and Distribution information.

       With no OPTION specified defaults to -v.

OPTIONS
       -v, --version

              Display the version of the LSB specification against which the distribution is compliant.

       -i, --id

              Display the string id of the distributor.

       -d, --description

              Display the single line text description of the distribution.

       -r, --release

              Display the release number of the distribution.

       -c, --codename

              Display the codename according to the distribution release.

       -a, --all

              Display all of the above information.

       -s, --short

              Use short output format for information requested by other options (or version if none).

       -h, --help

              Display this message.

FILES
       If the installation is LSB compliant, the "/etc/lsb-release" file should contain the LSB_VERSION field.  The value of the field should be a colon separated list of supported module versions indicat‐
       ing the LSB specification modules to which the installation is compliant. If the installation is not compliant, the above field should not be present.

       Optional fields are DISTRIB_ID, DISTRIB_RELEASE, DISTRIB_CODENAME, DISTRIB_DESCRIPTION and can be used to override information which is parsed from the "/etc/distrib-release" file.

       If the "/etc/lsb-release.d" directory exists, it is searched for filenames which are taken as additional module-version strings to add to LSB_VERSION.

       The "/etc/distrib-release" file contains a description line which is parsed to get information (especially on currently non-LSB compliant systems).

       The required line style is:
       "Distributor release x.x (Codename)"

       Where Distributor can be a couple of words, but then concatenated (i.e. Linux Foo BarLinux Linux -> FooBarLinux),
       x.x starts with a digit followed by any non-blank characters, Codename will also be concatenated (blanks cleanup only).

       release may not be used as a keyword in DISTRIB_DESCRIPTION if you don't want to override "/etc/distrib-release" data.

       Notice: To support the Debian distributions' lack of information (see "/etc/debian_version" file) some have been directly added into the lsb_release script.

EXAMPLES
       If the "/etc/lsb-release" file contains:

       LSB_VERSION="core-2.0-ia64:core-2.0-noarch"
       DISTRIB_DESCRIPTION="I enjoy using my distrib"

       and the "/etc/lsb-release.d" directory contains:

       graphics-2.0-ia64    graphics-2.0-noarch

       and the "/etc/foobar-release" file contains:

       My Linux Distrib release 1.0RC4 (TryIt)

       Then the results of various options will be:

       $ ./lsb_release --all
       LSB Version:    core-2.0-ia64:core-2.0-noarch:graphics-2.0-ia64:graphics-2.0-noarch
       Distributor ID: MyDistrib
       Description:    I enjoy using my distrib
       Release:        1.0RC4
       Codename:       TryIt

       $ ./lsb_release -a -s
       1.0 MyDistrib "I enjoy using my distrib" 1.0RC4 TryIt

       If the "/etc/lsb-release" file is absent (indicating this is not an LSB compliant distribution), the result will be:

       $ ./lsb_release -a
       LSB Version:    n/a
       Distributor ID: MyDistrib
       Description:    My Linux Distrib release 1.0RC4 (TryIt)
       Release:        1.0RC4
       Codename:       TryIt

REPORTING BUGS
       Report bugs at http://bugs.linuxbase.org.  Please include a complete, self contained example that will allow the bug to be reproduced, and say which version of lsb_release you are using.

COPYRIGHT
       Copyright © 2000, 2002, 2004 Free Standards Group, Inc.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

       Originally written by Dominique MASSONIE.



FSG lsb_release v2.0                                                                              March 2015                                                                                           FSG(1)
