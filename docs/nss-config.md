NSS-CONFIG(1)                                                                             Network Security Services                                                                             NSS-CONFIG(1)



NAME
       nss-config - Return meta information about nss libraries

SYNOPSIS
       nss-config [--prefix] [--exec-prefix] [--includedir] [--libs] [--cflags] [--libdir] [--version]

DESCRIPTION
       nss-config is a shell scrip tool which can be used to obtain gcc options for building client pacakges of nspt.

OPTIONS
       --prefix
           Returns the top level system directory under which the nss libraries are installed.

       --exec-prefix
           returns the top level system directory under which any nss binaries would be installed.

       --includedir count
           returns the path to the directory were the nss libraries are installed.

       --version
           returns the upstream version of nss in the form major_version-minor_version-patch_version.

       --libs
           returns the compiler linking flags.

       --cflags
           returns the compiler include flags.

       --libdir
           returns the path to the directory were the nss libraries are installed.

EXAMPLES
       The following example will query for both include path and linkage flags:

                   /usr/bin/nss-config --cflags --libs



FILES
       /usr/bin/nss-config

SEE ALSO
       pkg-config(1)

AUTHORS
       The nss liraries were written and maintained by developers with Netscape, Red Hat, Sun, Oracle, Mozilla, and Google.

       Authors: Elio Maldonado <emaldona@redhat.com>.

LICENSE
       Licensed under the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.



nss 3.44.0                                                                                       Nov 13 2013                                                                                    NSS-CONFIG(1)
