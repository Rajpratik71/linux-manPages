DH_UPDATE_AUTOTOOLS_CONFIG(1)                  Debhelper                 DH_UPDATE_AUTOTOOLS_CONFIG(1)

NAME
       dh_update_autotools_config - Update autotools config files

SYNOPSIS
       dh_update_autotools_config [debhelper options]

DESCRIPTION
       dh_update_autotools_config replaces all occurrences of config.sub and config.guess in the
       source tree by the up-to-date versions found in the autotools-dev package.  The original files
       are backed up and restored by dh_clean.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Niels Thykier <niels@thykier.net>

12.6.1ubuntu2                                 2019-09-17                 DH_UPDATE_AUTOTOOLS_CONFIG(1)
