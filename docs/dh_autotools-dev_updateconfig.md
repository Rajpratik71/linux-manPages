DH_AUTOTOOLS-DEV_UPDATECONFIG(1)                                     Debhelper                                    DH_AUTOTOOLS-DEV_UPDATECONFIG(1)

NAME
       dh_autotools-dev_updateconfig - update config.sub and config.guess

SYNOPSIS
       dh_autotools-dev_updateconfig [debhelper options]

DESCRIPTION
       dh_autotools-dev_updateconfig replaces all occurances of config.sub and config.guess in the source tree by the up-to-date versions found in
       the autotools-dev package.  The original files are backed up under the names config.sub.dh-orig and config.guess.dh-orig.

EXAMPLES
       dh_autotools-dev_updateconfig is usually called indirectly in a rules file via the dh command.

               %:
                       dh $@ --with autotools_dev

       It can also be direcly called at the start of the build (or configure) rule.

               build:
                       dh_autotools-dev_updateconfig
                       ./configure
                       $(MAKE)

SEE ALSO
       debhelper(7), dh(1).

       This program is meant to be used together with debhelper.

AUTHOR
       Fabian Greffrath <fabian+debian@greffrath.com>

perl v5.20.2                                                        2015-09-11                                    DH_AUTOTOOLS-DEV_UPDATECONFIG(1)
