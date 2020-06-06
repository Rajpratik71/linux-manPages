dpkg-vendor(1)                                                                                  dpkg suite                                                                                 dpkg-vendor(1)

NAME
       dpkg-vendor - queries information about distribution vendors

SYNOPSIS
       dpkg-vendor [option...] command

DESCRIPTION
       dpkg-vendor is a tool to query information about vendors listed in /etc/dpkg/origins. /etc/dpkg/origins/default contains information about the current vendor.

COMMANDS
       --is vendor
              Exits with 0 if the current vendor is vendor. Otherwise exits with non-zero.

       --derives-from vendor
              Exits with 0 if the current vendor distribution is a derivative of vendor, otherwise exits with non-zero. It uses the Parent field to browse all ancestors of the current vendor.

       --query field
              Print on standard output the value of the vendor-specific field for the current vendor.

       --help Show the usage message and exit.

       --version
              Show the version and exit.

OPTIONS
       --vendor vendor
              Assumes the current vendor is vendor instead of discovering it with the DEB_VENDOR environment variable or /etc/dpkg/origins/default.

ENVIRONMENT
       DEB_VENDOR
              This setting defines the current vendor. If not set, it will discover the current vendor by reading /etc/dpkg/origins/default.

SEE ALSO
       deb-origin(5).

Debian Project                                                                                  2011-11-10                                                                                 dpkg-vendor(1)
