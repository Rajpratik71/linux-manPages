UPDATE-DEFAULT-ISPELL(8)                                                      UPDATE-DEFAULT-ISPELL(8)

NAME
       update-default-ispell - update default ispell dictionary

SYNOPSIS
        update-default-ispell [--skip-symlinks] [--triggered]

DESCRIPTION
       WARNING: Not to be used from the command line unless you know very well what you are doing.

       This program is intended to be called from ispell dictionary package postinst, from select-
       default-ispell or from dictionaries-common postinst.

       When called under dpkg control with the --trigger option the script is run normally, otherwise
       the dictionaries-common update-default-ispell trigger is enabled for later run.

       With the --skip-symlinks option the symlinks setting is skipped.  This is needed for update-
       default-ispell when called from dictionaries-common postinst, since autobuilt hashes may not
       yet be available.

       When run normally (from the command line or with --trigger) this script rebuilds the info at
       /var/cache/dictionaries-common/ispell.db after files under /var/lib/dictionaries-common/ispell,
       reads the system default from the debconf database and unless disabled, set default symlinks in
       /etc/dictionaries-common pointing to the appropriate files in /usr/lib/ispell/.

       For ispell this script also updates the system-wide setting
       /etc/dictionaries-common/ispell-default and the emacsen, jed, and SquirrelMail support after
       known info.

OPTIONS
        --skip-symlinks  Do not try to set symlinks at /etc/dictionaries-common dir.
        --triggered      Run all the code instead of trying to enable
                         update-default-ispell trigger

SEE ALSO
       The dictionaries-common policy document

AUTHORS
       Rafael Laboissiere, Agustin Martin Domingo

1.28.1                                        2018-11-15                      UPDATE-DEFAULT-ISPELL(8)
