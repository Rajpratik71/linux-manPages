QEMU-IO(1)                                                                               General Commands Manual                                                                               QEMU-IO(1)

NAME
       qemu-io - QEMU Disk exerciser

SYNOPSIS
       qemu-io [-h] [-V] [-rsnm] [-c cmd] ... [file]

DESCRIPTION
       qemu-io is a command line utility to exercise the QEMU I/O path.

OPTIONS
       -c, --cmd <cmd>
              Command to execute

       -r, --read-only
              Export read-only

       -s, --snapshot
              Use snapshot file

       -n, --nocache
              Disable host cache

       -g, --growable
              Allow file to grow (only applies to protocols)

       -m, --misalign
              Misalign allocations for O_DIRECT

       -k, --native-aio
              Use kernel AIO implementation (on Linux only)

       -h, --help
              Display help and exit

       -V, --version
              Output version information and exit

SEE ALSO
       qemu-img(1), qemu-nbd(8)

AUTHOR
       QEMU project

       This  manual  page  was  written  by Asias He <asias.hejun@gmail.com>, for the Debian project (and may be used by others). Permission is  granted to  copy, distribute and/or modify this document
       under the terms of the Creative Commons Attribution-Share Alike 3.0 United States License. (See http://creativecommons.org/licenses/by-sa/3.0/us/legalcode)

                                                                                            December 18, 2011                                                                                  QEMU-IO(1)
