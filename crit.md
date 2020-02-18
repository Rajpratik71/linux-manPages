CRIT(1)                       User Commands                      CRIT(1)

NAME
       crit - CRiu Image Tool

SYNOPSIS
       crit decode [-h] [-i IN] [-o OUT] [--pretty]
       crit encode [-h] [-i IN] [-o OUT]
       crit info [-h] in
       crit x [-h] dir {ps,fds,mems}
       crit show [-h] in

DESCRIPTION
       CRIT is a feature-rich replacement for existing criu show.

   positional arguments:
       {decode,encode,info,x,show}
              Use crit CMD --help for command-specific help

       decode convert criu image from binary type json

       encode convert criu image from json type to binary

       info   show info about image

       x      explore image dir

       show   convert criu image from binary to human-readable json

   optional arguments:
       -h, --help
              show this help message and exit

SEE ALSO
       criu(1).

AUTHOR
       This   manual   page   was   written   by   Salvatore  Bonaccorso
       <carnil@debian.org> based on help2man(1) for  the  Debian  system
       (but may be used by others).

crit 2.0                       March 2016                        CRIT(1)
