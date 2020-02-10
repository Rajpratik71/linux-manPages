CRYPTDISKS_START(8)                                                                         cryptsetup manual                                                                         CRYPTDISKS_START(8)

NAME
       cryptdisks_start - wrapper around cryptsetup that parses /etc/crypttab.

SYNOPSIS
       cryptdisks_start <name>

DESCRIPTION
       cryptdisks_start is a wrapper around cryptsetup that parses /etc/crypttab just like the initscript /etc/init.d/cryptdisks does and starts the dm-crypt mapping that corresponds to <name>.

       Note that this wrapper passes --key-file=- to cryptsetup, so the passphrase in any referenced key file must not be followed by a newline character.

SEE ALSO
       cryptdisks_stop(8), cryptsetup(8), crypttab(5)

AUTHOR
       This manual page was written by Jonas Meurer <mejo@debian.org> in December 2007.

cryptsetup 2:1.6.6-5ubunt                                                                       2017-08-10                                                                            CRYPTDISKS_START(8)
