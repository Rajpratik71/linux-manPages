ARPTABLES-RESTORE(8)                                                              ARPTABLES-RESTORE(8)

NAME
       arptables-restore - Restore ARP Tables (nft-based)

SYNOPSIS
       arptables-restore

DESCRIPTION
       arptables-restore  is  used to restore ARP Tables from data specified on STDIN or via a file as
       first argument.  Use I/O redirection provided by your shell to read from a file

       arptables-restore
              flushes (deletes) all previous contents of the respective ARP Table.

AUTHOR
       Jesper Dangaard Brouer <brouer@redhat.com>

SEE ALSO
       arptables-save(8), arptables(8)

                                              March 2019                          ARPTABLES-RESTORE(8)
