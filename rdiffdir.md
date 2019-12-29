RDIFFDIR(1)                                  User Manuals                                  RDIFFDIR(1)

NAME
       rdiffdir - compute and apply signatures and diffs to directories

SYNOPSIS
       rdiffdir [options] sig[nature] basis_dir signature_file

       rdiffdir [options] delta full_sigtar {incr_sigtar} new_dir delta_file

       rdiffdir [options] patch basis_dir delta_file

       rdiffdir [options] tar basis_dir tar_file

       If signature_file or delta_file are "-", the data will be read from stdin or written to stdout
       as appropriate.

DESCRIPTION
       rdiffdir is supposed to be like rdiff, but can operate on directories.  See rdiff(1) for more
       information.  The syntax is similar.

       Regarding the delta command, the full_sigtar operand is a signature_file written by an earlier
       signature or tar command (the latter using the --write-sig-to option). The optional incr_sigtar
       operands are signature files written by earlier delta commands using the --write-sig-to option.
       This way the Nth invocation of the delta command can parse (and extend) the signature chain
       that has been founded by the first signature or tar command with a full signature, and then
       extended by the subsequent N-1 delta invocations with incremental signatures. It is the
       responsibility of the user to specify the sigtar operands in logical increment order.

OPTIONS
       --write-sig-to sigfile
              This option is only used in delta and tar modes.  When specified, rdiffdir will write a
              signature of the directory it is processing to sigfile.  The end result will be a delta
              and a new signature calculated over the same data.

       -z, --gzip-compress
              Enable gzip compression and decompression of signature and delta files.

SELECTION OPTIONS
       In signature and delta modes, rdiffdir accepts duplicity-like selection options including
       --exclude, --exclude-filelist, etc.  See the duplicity(1) manual page for more information.

BUGS
       Hard links are currently unsupported (they will be treated as non-linked regular files).

       Bad signatures will be treated as empty instead of logging appropriate error message.

AUTHOR
       Original Author - Ben Escoto <bescoto@stanford.edu>

       Current Maintainer - Kenneth Loafman <kenneth@loafman.com>

       Continuous Contributors
              Edgar Soldin, Mike Terry

       Also we'd like to thank everybody posting issues to the mailing list or on launchpad, sending
       in patches or contributing otherwise. Duplicity wouldn't be as stable and useful if it weren't
       for you.

       A special thanks goes to rsync.net, a Cloud Storage provider with explicit support for
       duplicity, for several monetary donations and for providing a special "duplicity friends" rate
       for their offsite backup service.  Email info@rsync.net for details.

SEE ALSO
       duplicity(1), python(1), rdiff(1), rdiff-backup(1).

Version 0.8.04                              August 31, 2019                                RDIFFDIR(1)
