NSPR-CONFIG(1)                                                                            Netscape Portable Runtime                                                                            NSPR-CONFIG(1)



NAME
       nspr-config - Return meta information about nspr libraries

SYNOPSIS
       nspr-config [--prefix] [--exec-prefix] [--includedir] [--libs] [--cflags] [--libdir] [--version]

DESCRIPTION
       nspr-config is a shell script which can be used to obtain gcc options for building client pacakges of nspr.

OPTIONS
       --prefix
           Returns the top level system directory under which the nspr libraries are installed.

       --exec-prefix
           Returns the top level system directory under which any nspr binaries would be installed.

       --includedir count
           Returns the path to the directory were the nspr headers are installed.

       --version
           Returns the upstream version of nspr in the form major_version-minor_version-patch_version.

       --libs
           Returns the compiler linking flags.

       --cflags
           Returns the compiler include flags.

       --libdir
           Returns the path to the directory were the nspr libraries are installed.

EXAMPLES
       The following example will query for both include path and linkage flags:

                   /usr/bin/nspr-config --cflags --libs



FILES
       /usr/bin/nspr-config

SEE ALSO
       pkg-config(1)

AUTHORS
       The NSPR liraries were written and maintained by developers with Netscape, Red Hat, Sun, Oracle, Mozilla, and Google.

       Authors: Elio Maldonado <emaldona@redhat.com>.

LICENSE
       Licensed under the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.



nspr 4.21.0                                                                                     9 August 2019                                                                                  NSPR-CONFIG(1)
