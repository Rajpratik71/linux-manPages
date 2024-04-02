DH_AUTOTOOLS-DEV_RESTORECONFIG(1)                                    Debhelper                                   DH_AUTOTOOLS-DEV_RESTORECONFIG(1)

NAME
       dh_autotools-dev_restoreconfig - restore config.sub and config.guess

SYNOPSIS
       dh_autotools-dev_restoreconfig [debhelper options]

DESCRIPTION
       dh_autotools-dev_restoreconfig restores the original config.sub and config.guess files that have been backed up by
       dh_autotools-dev_updateconfig under the names config.sub.dh-orig and config.guess.dh-orig.

EXAMPLES
       dh_autotools-dev_restoreconfig is usually called indirectly in a rules file via the dh command.

               %:
                       dh $@ --with autotools_dev

       It can also be direcly called in the clean rule.

               clean:
                       dh_testdir
                       dh_testroot
                       [ ! -f Makefile ] || $(MAKE) clean
                       dh_autotools-dev_restoreconfig
                       dh_clean

SEE ALSO
       debhelper(7), dh(1).

       This program is meant to be used together with debhelper.

AUTHOR
       Fabian Greffrath <fabian+debian@greffrath.com>

perl v5.20.2                                                        2015-09-11                                   DH_AUTOTOOLS-DEV_RESTORECONFIG(1)
