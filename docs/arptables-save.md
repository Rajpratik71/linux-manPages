ARPTABLES-SAVE(8)                                                                    ARPTABLES-SAVE(8)

NAME
       arptables-save - dump arptables rules to stdout (nft-based)

SYNOPSIS
       arptables-save [-M modprobe] [-c]

       arptables-save [-V]

DESCRIPTION
       arptables-save  is used to dump the contents of an ARP Table in easily parseable format to STD‐
       OUT. Use I/O-redirection provided by your shell to write to a file.

       -M, --modprobe modprobe_program
              Specify the path to the  modprobe  program.  By  default,  arptables-save  will  inspect
              /proc/sys/kernel/modprobe to determine the executable's path.

       -c, --counters
              Include the current values of all packet and byte counters in the output.

       -V, --version
              Print version information and exit.

AUTHOR
       Jesper Dangaard Brouer <brouer@redhat.com>

SEE ALSO
       arptables-restore(8), arptables(8)

                                              March 2019                             ARPTABLES-SAVE(8)
