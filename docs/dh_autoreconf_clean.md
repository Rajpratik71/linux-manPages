DH_AUTORECONF_CLEAN(1)                                             dh-autoreconf                                            DH_AUTORECONF_CLEAN(1)

NAME
       dh_autoreconf_clean - Clean all changes made by dh_autoreconf

SYNOPSIS
       dh_autoreconf_clean [debhelper options]

DESCRIPTION
       dh_autoreconf_clean removes all files which have been created or changed during the autoreconf call executed by dh_autoreconf(1). It also
       reverts any ltmain.sh patch applied by dh_autoreconf.

SEE ALSO
       debhelper(7), dh_autoreconf(1), dh-autoreconf(7)

AUTHOR
       Julian Andres Klode <jak@debian.org>

dh-autoreconf v17~ubuntu16.04.1                                     2018-05-11                                              DH_AUTORECONF_CLEAN(1)
