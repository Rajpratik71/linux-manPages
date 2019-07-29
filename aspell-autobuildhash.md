ASPELL-AUTOBUILDHASH(8)                                                                                                    ASPELL-AUTOBUILDHASH(8)

NAME
       aspell-autobuildhash - Autobuilding aspell hash files for some dicts

SYNOPSIS
        aspell-autobuildhash [--force]

          Options:
           --debug      Show extra info about aspell-autobuildhash internal
                        work. Will also enable aspell affix validation.
           --dry-run    Show what would be done, but do nothing real.
           --force      Rebuild the hash file for all dicts providing a
                        compat file skipping the test.
           --triggered  Tell the script that is run in the triggers stage.

DESCRIPTION
       aspell-autobuildhash is a script that will manage aspell hash files autobuild, intended to be called from the dictionaries-common tools.
       Depending on the aspell compatibility level and on the compatibility level used for the hash file if present, will decide whether it must
       be rebuilt or not. This script will only work on aspell packages prepared to use it, it will do nothing for other aspell dict packages.

OPTIONS
        --debug      Show some extra information about aspell-autobuildhash
                     internal work. Will also enable aspell affix validation.
        --dry-run    Show what would be done, but do nothing real.
        --force      Rebuild the hash file for all dicts providing a compat
                     file regardless of the compatibility levels found.
        --triggered  Tell the script that is run in the triggers stage. When
                     run under dpkg control, do not try to set the
                     'aspell-autobuildhash' trigger, but run real
                     B<aspell-autobuildhash> code. When not run under dpkg
                     control, real code will always be run and '--triggered'
                     option has no real effect.

PACKAGE MAINTAINERS
       To use this system, aspell-autobuildhash expects a $lang.compat file in /var/lib/aspell ($lang stands for the lang basename with variant if
       any, e.g. $lang is something like gl-minimos or en)) containing aspell compatibility version for last successful build or "0" or en empty
       file if hash is to be rebuild, as is for dictionary installation and upgrades.

       When upgrading aspell, script will check if version in $lang.compat is different from aspell.compat and rebuild if so, updating
       $lang.compat with the new value.

       Wordlists should previously be compressed either with gzip (and their extensions set as .mwl.gz or .wl.gz) or preferably first with aspell
       prezip and then gzipped (with .cwl.gz extension).  This applies both for plain wordlists and munched wordlists (in the ispell way) if you
       use affix compression.

       If your package will provide a single hash, install prezipped+gzipped wordlist as /usr/share/aspell/$lang.cwl.gz or, if prezip is not used,
       as /usr/share/aspell/$lang.mwl.gz.

       If your package will provide more than one aspell hash for the same $lang, you will need to place each compressed wordlist as e.g.
       /usr/share/aspell/$subdict.cwl.gz, and the common $lang.compat as above. Then create a /usr/share/aspell/$lang.contents file with the base
       names of the subdicts, one in a line. For English that will contain, amongst other possible lines

        en-common
        en-variant_0
        en-variant_1
        en-variant_2
        en_CA-w_accents-only

       No need to use this file if a single hash is being created.

       Dictionaries-common scripts will call internally this script and create a single hash file at /var/lib/ispell/$lang.rws, or hash files at
       /var/lib/ispell/$subdict.rws. You must set a symlink to that files from /usr/lib/aspell/$lang.rws or /usr/lib/aspell/$subdict.rws as
       appropriate.

       Aspell dictionary packages using this script must make sure that $lang.compat is reset on every new install/upgrade, so hash is rebuilt.
       They must also make sure that $lang.compat and all of /var/lib/aspell/$lang.rws or /var/lib/aspell/$subdict.rws are removed on package
       removal.

       As of version 1.10, installdeb-aspell script will understand 'auto-compat' and 'auto-contents' fields in $dict.info-aspell file to help
       with this by adding needed debhelper snippets.  Put in that entry the base name(s) of your compat and contents file(s) and carefully check
       resulting maintainer scripts after build.

       Note that you are no longer suggested to ship empty files at any of /var/lib/aspell/$lang.compat, /var/lib/aspell/$lang.rws or
       /var/lib/aspell/$subdict.rws, but explicitly create/update them on install and explicitly remove them on removal.

       aspell maintainer should also call this script from package postinst.  When comparing versions it will get the aspell version from file
       /usr/share/aspell/aspell.compat.

AUTHORS
       Agustin Martin <agmartin@debian.org>

COPYRIGHT
       Copyright (C) 2004-2013 Agustin Martin <agmartin@debian.org>

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

1.27.2~ubuntu16.04.1~c42.ppa1                                       2017-12-18                                             ASPELL-AUTOBUILDHASH(8)
