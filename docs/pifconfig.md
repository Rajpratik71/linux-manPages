PIFCONFIG(8)                                                                                                                                                                                     PIFCONFIG(8)



NAME
       pifconfig - display information about a network interface

SYNOPSIS
       pifconfig [INTERFACE [INTERFACE [INTERFACE] ...]]

DESCRIPTION
       This script mimic ifconfig behavior, but is written purely in python and python module ethtool.

OPTIONS
       INTERFACE
           Display information about only the listed interfaces. If no interface is given all interfaces are displayed.

       -h, --help
           Show help message and exit.

SEE ALSO
       ifconfig(8)

AUTHORS
       Arnaldo Carvalho de Melo <acme@redhat.com>

       Man page written by Miroslav Suchý <msuchy@redhat.com>, David Sommerseth <davids@redhat.com>



                                                                                                  08/09/2019                                                                                     PIFCONFIG(8)
