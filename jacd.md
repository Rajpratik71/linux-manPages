JACD(1)                                                            User Commands                                                           JACD(1)

NAME
       jacd - manual page for jacd 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       jacd [options] NAME [INTF]

DESCRIPTION
       jacd: An SAE J1939 address claiming daemon

OPTIONS
       -v, --verbose
              Increase verbosity

       -r, --range=RANGE
              Ranges of source addresses e.g. 80,50-100,200-210 (defaults to 0-253)

       -c, --cache=FILE
              Cache file to save/restore the source address

       -a, --address=ADDRESS Start with Source Address ADDRESS

       -p, --prefix=STR
              Prefix to use when logging

       NAME is the 64bit nodename

EXAMPLES
       jacd -r 100,80-120 -c /tmp/1122334455667788.jacd 1122334455667788

jacd 2018.02.0-1~ubuntu16.04.1~ppa1                                October 2018                                                            JACD(1)
