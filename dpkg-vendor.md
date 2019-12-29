dpkg-vendor(1)                                dpkg suite                                dpkg-vendor(1)

NAME
       dpkg-vendor - queries information about distribution vendors

SYNOPSIS
       dpkg-vendor [option...] command

DESCRIPTION
       dpkg-vendor  is  a  tool  to  query  information  about  vendors  listed  in /etc/dpkg/origins.
       /etc/dpkg/origins/default contains information about the current vendor.

COMMANDS
       --is vendor
              Exits with 0 if the current vendor is vendor. Otherwise exits with 1.

       --derives-from vendor
              Exits with 0 if the current vendor distribution is a  derivative  of  vendor,  otherwise
              exits with 1.  It uses the Parent field to browse all ancestors of the current vendor.

       --query field
              Print on standard output the value of the vendor-specific field for the current vendor.

       --help Show the usage message and exit.

       --version
              Show the version and exit.

OPTIONS
       --vendor vendor
              Assumes  the  current  vendor  is  vendor  instead of discovering it with the DEB_VENDOR
              environment variable or /etc/dpkg/origins/default.

ENVIRONMENT
       DEB_VENDOR
              This setting defines the current vendor. If not set, it will discover the current vendor
              by reading /etc/dpkg/origins/default.

       DPKG_COLORS
              Sets  the  color  mode  (since  dpkg  1.18.5).   The currently accepted values are: auto
              (default), always and never.

       DPKG_NLS
              If set, it will be used to decide whether to  activate  Native  Language  Support,  also
              known  as  internationalization  (or  i18n)  support  (since dpkg 1.19.0).  The accepted
              values are: 0 and 1 (default).

SEE ALSO
       deb-origin(5).

1.19.7                                        2019-09-05                                dpkg-vendor(1)
