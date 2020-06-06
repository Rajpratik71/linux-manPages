ISPELL-AUTOBUILDHASH(8)                                                                                                                                                           ISPELL-AUTOBUILDHASH(8)

NAME
       ispell-autobuildhash - Autobuilding the ispell hash file for some dicts

SYNOPSIS
        ispell-autobuildhash [--force]

          Options:
           --debug      Show some extra ispell-autobuildhash information.
           --dry-run    Show what would be done, but do nothing real.
           --force      Rebuild the hash file for all dicts providing a
                        compat file skipping the test.
           --triggered  Tell the script that is run in the triggers stage.

DESCRIPTION
       ispell-autobuildhash is a script that will manage ispell hash files autobuild, intended to be called from the dictionaries-common tools.  Depending on the ispell compatibility level and on the
       compatibility level used for the hash file if present, will decide whether it must be rebuilt or not. This script will only work on ispell packages prepared to use it, it will do nothing for
       other ispell dict packages.

OPTIONS
        --debug      Show some extra ispell-autobuildhash information.
        --dry-run    Show what would be done, but do nothing real.
        --force      Rebuild the hash file for all dicts providing a compat
                     file regardless of the compatibility levels found.
        --triggered  Tell the script that is run in the triggers stage. When
                     run under dpkg control, do not try to set the
                     'ispell-autobuildhash' trigger, but run real
                     B<ispell-autobuildhash> code. When not run under dpkg
                     control, real code will always be run and '--triggered'
                     option has no real effect.

PACKAGE MAINTAINERS
       To use this system, ispell-autobuildhash expects a $dict.compat file in /var/lib/ispell ($dict stands for the hash or affix file basename) containing ispell major or compatibility version for
       last successful build or "0" or en empty file if hash is to be rebuild, as is for dictionary instalation and upgrades.

       When upgrading ispell, script will check if version in $dict.compat is different from ispell.compat and rebuild if so, updating $dict.compat with the new value. The particular way things are
       done depends on whether your dict has a single source or a multiple source like ipolish has.

       The most common case is having a single source. In this case you must put the $dict.aff file at /usr/lib/ispell/$dict.aff as usual and the munched wordlist compressed with gzip at
       /usr/share/ispell/$dict.mwl.gz.

       This script supports the way ipolish allows selection of subdictionaries to be put in the hash file. It will detect the presence of  the main language .desc file and call update-ipolish-hash as
       appropriate.

       Although this script looks for the existence of a update-ispell-hash script with supposedly similar functionality to update-ipolish-hash, this latter does not really exists, although it might be
       added at some time to ispell or to the dictionaries-common system, if enough demand is found.

       If your package provides more than one ispell dictionary you will need to do the steps above for each dictionary.

       Dictionaries-common scripts will call internally this script and create a hash file at /var/lib/ispell/$dict.hash. You must set a symlink to that file from /usr/lib/ispell/$dict.hash.

       Ispell dictionary packages using this script must make sure that $dict.compat is reset on every new install/upgrade, so hash is rebuilt.  They must also make sure that $dict.compat and
       /var/lib/ispell/$dict.hash are removed on package removal

       As of version 1.10, installdeb-ispell script will understand 'auto-compat' field in $dict.info-ispell file to help with this by adding needed debhelper snippets. Put in that entry the base
       name(s) of your compat file(s) and check resulting maintainer scripts after build.

       Note that you are no longer suggested to ship empty files at /var/lib/ispell/$dict.compat and /var/lib/ispell/$dict.hash to help with reset/removal of those files, but explicitly create/update
       them on install and explicitly remove them on removal.

       ispell maintainer should also call this script from package postinst.  When comparing versions it will get the ispell version from file /usr/share/ispell/ispell.compat, or if it does not exists,
       from the upstream version as given in the first line of 'ispell -vv output.

AUTHOR
       Agustin Martin <agmartin@debian.org>

COPYRIGHT
       Copyright (C) 2003-2013 Agustin Martin <agmartin@debian.org>

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the
       License, or (at your option) any later version.

1.26.3                                                                                          2015-8-31                                                                         ISPELL-AUTOBUILDHASH(8)
