UPDATE-DEFAULT-WORDLIST(8)                                                                                              UPDATE-DEFAULT-WORDLIST(8)

NAME
       update-default-wordlist - update default wordlist

SYNOPSIS
        update-default-wordlist [--skip-symlinks] [--triggered]

DESCRIPTION
       WARNING: Not to be used from the command line unless you know very well what you are doing.

       This program is intended to be called from wordlist package postinst, from select-default-wordlist or from dictionaries-common postinst.

       When called under dpkg control with the --trigger option the script is run normally, otherwise the dictionaries-common update-default-
       wordlist trigger is enabled for later run.

       With the --skip-symlinks option the symlinks setting is skipped.

       When run normally (from the command line or with --trigger) this script rebuilds the info at /var/cache/dictionaries-common/wordlist.db
       after files under /var/lib/dictionaries-common/wordlist, reads the system default from the debconf database and unless disabled, set
       default symlinks in /etc/dictionaries-common pointing to the appropriate files in /usr/share/dict/.

OPTIONS
        --skip-symlinks  Do not try to set symlinks at /etc/dictionaries-common dir.
        --triggered      Run all the code instead of trying to enable
                         update-default-wordlist trigger

SEE ALSO
       The dictionaries-common policy document

AUTHORS
       Rafael Laboissiere, Agustin Martin Domingo

1.27.2~ubuntu16.04.1~c42.ppa1                                       2017-12-18                                          UPDATE-DEFAULT-WORDLIST(8)
